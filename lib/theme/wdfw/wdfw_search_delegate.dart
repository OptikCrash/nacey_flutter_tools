import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//**
// Search Stuff
// */
Future<T?> wdfwShowSearchDelegate<T>({
  required BuildContext context,
  required WDFWSearchDelegate<T> delegate,
  String? query = '',
  bool useRootNavigator = false,
}) {
  delegate.query = query ?? delegate.query;
  delegate._currentBody = _SearchBody.suggestions;
  return Navigator.of(context, rootNavigator: useRootNavigator)
      .push(_SearchPageRoute<T>(
    delegate: delegate,
  ));
}

enum _SearchBody {
  suggestions,
  results,
}

abstract class WDFWSearchDelegate<T> {
  WDFWSearchDelegate({
    this.searchFieldLabel,
    this.searchFieldStyle,
    this.searchFieldDecorationTheme,
    this.keyboardType,
    this.textInputAction = TextInputAction.search,
  }) : assert(searchFieldStyle == null || searchFieldDecorationTheme == null);
  final String? searchFieldLabel;
  final TextStyle? searchFieldStyle;
  final InputDecorationTheme? searchFieldDecorationTheme;
  final TextInputType? keyboardType;
  final TextInputAction textInputAction;

  Animation<double> get transitionAnimation => _proxyAnimation;
  FocusNode? _focusNode;
  final TextEditingController _queryTextController = TextEditingController();
  final ProxyAnimation _proxyAnimation =
      ProxyAnimation(kAlwaysDismissedAnimation);
  final ValueNotifier<_SearchBody?> _currentBodyNotifier =
      ValueNotifier<_SearchBody?>(null);

  _SearchBody? get _currentBody => _currentBodyNotifier.value;
  set _currentBody(_SearchBody? value) {
    _currentBodyNotifier.value = value;
  }

  _SearchPageRoute<T>? _route;

  String get query => _queryTextController.text;
  set query(String value) {
    _queryTextController.text = value;
    _queryTextController.selection = TextSelection.fromPosition(
        TextPosition(offset: _queryTextController.text.length));
  }

  Widget buildSuggestions(BuildContext context);
  Widget buildResults(BuildContext context);

  List<Widget>? buildActions(BuildContext context);

  PreferredSizeWidget? buildBottom(BuildContext context) => null;

  void showResults(BuildContext context) {
    _focusNode?.unfocus();
    _currentBody = _SearchBody.results;
  }

  void showSuggestions(BuildContext context) {
    assert(_focusNode != null,
        '_focusNode must be set by route before showSuggestions is called.');
    _focusNode!.requestFocus();
    _currentBody = _SearchBody.suggestions;
  }

  void close(BuildContext context, T? result) {
    _currentBody = null;
    _focusNode?.unfocus();
    Navigator.of(context)
      ..popUntil((Route<dynamic> route) => route == _route)
      ..pop(result);
  }
}

class _SearchScreen<T> extends StatefulWidget {
  const _SearchScreen({
    required this.delegate,
    required this.animation,
  });
  final WDFWSearchDelegate<T> delegate;
  final Animation<double> animation;

  @override
  State<_SearchScreen<T>> createState() => _SearchScreenState<T>();
}

class _SearchScreenState<T> extends State<_SearchScreen<T>> {
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) => Platform.isIOS
          ? _IosSearchScreen(
              delegate: widget.delegate,
              animation: widget.animation,
            )
          : _AndroidSearchScreen(
              delegate: widget.delegate,
              animation: widget.animation,
            );

  _getSearchFieldLabel() =>
      widget.delegate.searchFieldLabel ??
      MaterialLocalizations.of(context).searchFieldLabel;

  _getBody(BuildContext context) {
    Widget? body;
    switch (widget.delegate._currentBody) {
      case _SearchBody.suggestions:
        body = KeyedSubtree(
          key: const ValueKey<_SearchBody>(_SearchBody.suggestions),
          child: widget.delegate.buildSuggestions(context),
        );
        break;
      case _SearchBody.results:
        body = KeyedSubtree(
          key: const ValueKey<_SearchBody>(_SearchBody.results),
          child: widget.delegate.buildResults(context),
        );
        break;
      case null:
        break;
    }
    return body;
  }

  @override
  void initState() {
    super.initState();
    widget.delegate._queryTextController.addListener(_onQueryChanged);
    widget.animation.addStatusListener(_onAnimationStatusChanged);
    widget.delegate._currentBodyNotifier.addListener(_onSearchBodyChanged);
    focusNode.addListener(_onFocusChanged);
    widget.delegate._focusNode = focusNode;
  }

  @override
  void dispose() {
    super.dispose();
    widget.delegate._queryTextController.removeListener(_onQueryChanged);
    widget.animation.removeStatusListener(_onAnimationStatusChanged);
    widget.delegate._currentBodyNotifier.removeListener(_onSearchBodyChanged);
    widget.delegate._focusNode = null;
    focusNode.dispose();
  }

  void _onAnimationStatusChanged(AnimationStatus status) {
    if (status != AnimationStatus.completed) {
      return;
    }
    widget.animation.removeStatusListener(_onAnimationStatusChanged);
    if (widget.delegate._currentBody == _SearchBody.suggestions) {
      focusNode.requestFocus();
    }
  }

  @override
  void didUpdateWidget(_SearchScreen<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.delegate != oldWidget.delegate) {
      oldWidget.delegate._queryTextController.removeListener(_onQueryChanged);
      widget.delegate._queryTextController.addListener(_onQueryChanged);
      oldWidget.delegate._currentBodyNotifier
          .removeListener(_onSearchBodyChanged);
      widget.delegate._currentBodyNotifier.addListener(_onSearchBodyChanged);
      oldWidget.delegate._focusNode = null;
      widget.delegate._focusNode = focusNode;
    }
  }

  void _onFocusChanged() {
    if (focusNode.hasFocus &&
        widget.delegate._currentBody != _SearchBody.suggestions) {
      widget.delegate.showSuggestions(context);
    }
  }

  void _onQueryChanged() {
    setState(() {
      // rebuild ourselves because query changed.
    });
  }

  void _onSearchBodyChanged() {
    setState(() {
      // rebuild ourselves because search body changed.
    });
  }
}

class _SearchPageRoute<T> extends PageRoute<T> {
  _SearchPageRoute({
    required this.delegate,
  }) {
    assert(
      delegate._route == null,
      'The ${delegate.runtimeType} instance is currently used by another active '
      'search. Please close that search by calling close() on the PlatformSearchDelegate '
      'before opening another search with the same delegate instance.',
    );
    delegate._route = this;
  }
  final WDFWSearchDelegate<T> delegate;
  @override
  Color? get barrierColor => null;
  @override
  String? get barrierLabel => null;
  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);
  @override
  bool get maintainState => false;

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }

  @override
  Animation<double> createAnimation() {
    final Animation<double> animation = super.createAnimation();
    delegate._proxyAnimation.parent = animation;
    return animation;
  }

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return _SearchScreen<T>(delegate: delegate, animation: animation);
  }

  @override
  void didComplete(T? result) {
    super.didComplete(result);
    assert(delegate._route == this);
    delegate._route = null;
    delegate._currentBody = null;
  }
}

class _IosSearchScreen<T> extends _SearchScreen<T> {
  const _IosSearchScreen({
    required delegate,
    required animation,
  }) : super(delegate: delegate, animation: animation);
  @override
  State<_SearchScreen<T>> createState() => _IosSearchState<T>();
}

class _AndroidSearchScreen<T> extends _SearchScreen<T> {
  const _AndroidSearchScreen({
    required delegate,
    required animation,
  }) : super(delegate: delegate, animation: animation);
  @override
  State<_SearchScreen<T>> createState() => _AndroidSearchState<T>();
}

class _AndroidSearchState<T> extends _SearchScreenState<T> {
  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    return Semantics(
      explicitChildNodes: true,
      scopesRoute: true,
      namesRoute: true,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            padding: const EdgeInsets.all(5.0),
            onPressed: () {
              setState(() => Navigator.of(context).maybePop());
            },
            icon: const Icon(Icons.arrow_back),
          ),
          title: TextFormField(
            controller: widget.delegate._queryTextController,
            focusNode: focusNode,
            textInputAction: widget.delegate.textInputAction,
            keyboardType: widget.delegate.keyboardType,
            // onSubmitted: (String _) {
            //   widget.delegate.showResults(context);
            // },
            decoration: InputDecoration(
              hintText: _getSearchFieldLabel(),
            ),
          ),
          actions: widget.delegate.buildActions(context),
          bottom: widget.delegate.buildBottom(context),
        ),
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: _getBody(context),
        ),
      ),
    );
  }
}

class _IosSearchState<T> extends _SearchScreenState<T> {
  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    return Semantics(
      explicitChildNodes: true,
      scopesRoute: true,
      namesRoute: true,
      child: Material(
        child: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            leading: CupertinoButton(
              padding: const EdgeInsets.all(5.0),
              child: const Icon(CupertinoIcons.back),
              onPressed: () {
                setState(() => Navigator.of(context).maybePop());
              },
            ),
            middle: CupertinoSearchTextField(
              prefixIcon: Icon(
                CupertinoIcons.search,
                color: Theme.of(context).primaryColor,
              ),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Theme.of(context).primaryColorDark,
                    style: BorderStyle.solid,
                    width: 2,
                  ),
                  bottom: BorderSide(
                    color: Theme.of(context).primaryColorDark,
                    style: BorderStyle.solid,
                    width: 2,
                  ),
                  left: BorderSide(
                    color: Theme.of(context).primaryColorDark,
                    style: BorderStyle.solid,
                    width: 2,
                  ),
                  right: BorderSide(
                    color: Theme.of(context).primaryColorDark,
                    style: BorderStyle.solid,
                    width: 2,
                  ),
                ),
                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                color: Theme.of(context).canvasColor,
              ),
              controller: widget.delegate._queryTextController,
              focusNode: focusNode,
              placeholder: _getSearchFieldLabel(),
            ),
            trailing: CupertinoButton(
                child: const Text('Close'),
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                onPressed: () {
                  widget.delegate.close(context, null);
                }),
          ),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: _getBody(context) ?? Row(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
