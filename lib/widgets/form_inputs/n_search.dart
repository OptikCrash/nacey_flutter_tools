import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//**
// Search Stuff
// */
class NSearchField<T> extends StatefulWidget {
  //region constructors
  const NSearchField({
    Key? key,
    required this.delegate,
    required this.controller,
    required this.onTap,
    this.focusNode,
    this.textCapitalization = TextCapitalization.none,
    this.style,
    this.toolbarOptions,
    this.onChanged,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    this.icon,
    this.iconColor,
    this.prefixIcon,
    this.prefixIconConstraints,
    this.prefix,
    this.prefixIconColor,
    this.label,
    this.labelText,
    this.labelStyle,
    this.floatingLabelStyle,
    this.hintText, //placeholder
    this.hintStyle = const TextStyle(
      fontWeight: FontWeight.w400,
      color: CupertinoColors.placeholderText,
    ), //
    this.helperText,
    this.helperStyle,
    this.helperMaxLines,
    this.errorText,
    this.errorStyle,
    this.errorMaxLines,
    this.floatingLabelBehavior,
    this.isDense,
    this.contentPadding,
    this.isCollapsed = false,
    this.suffixIcon,
    this.suffix,
    this.suffixText,
    this.suffixStyle,
    this.suffixIconColor,
    this.suffixIconConstraints,
    this.counterText,
    this.counter,
    this.counterStyle,
    this.filled,
    this.fillColor,
    this.focusColor,
    this.hoverColor,
    this.errorBorder,
    this.focusedBorder,
    this.focusedErrorBorder,
    this.disabledBorder,
    this.enabledBorder,
    this.border,
    this.alignLabelWithHint = true,
    this.useMaterial = false,
    this.useCupertino = false,
    this.isOutlined = false,
    this.enabled = true,
  })  : assert(!(label != null && labelText != null),
            'Declaring both label and labelText is not supported.'),
        assert(!(prefix != null && label != null),
            'Declaring both prefix and label is not supported.'),
        assert(!(suffix != null && suffixText != null),
            'Declaring both suffix and suffixText is not supported.'),
        assert(!(useMaterial && useCupertino),
            'Declaring both Material design and Cupertino human interface is not supported.'),
        assert(!(useCupertino && useMaterial)),
        super(key: key);
  //endregion
  //region properties
  final NSearchDelegate<T> delegate;
  final TextEditingController controller;
  final GestureTapCallback onTap;
  final FocusNode? focusNode;
  final TextCapitalization textCapitalization;
  final TextStyle? style;
  final ToolbarOptions? toolbarOptions;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final Widget? icon;
  final Color? iconColor;
  final Widget? prefixIcon;
  final BoxConstraints? prefixIconConstraints;
  final Widget? prefix;
  final Color? prefixIconColor;
  final Widget? label;
  final String? labelText;
  final TextStyle? labelStyle;
  final TextStyle? floatingLabelStyle;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? helperText;
  final TextStyle? helperStyle;
  final int? helperMaxLines;
  final String? errorText;
  final TextStyle? errorStyle;
  final int? errorMaxLines;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final bool? isDense;
  final EdgeInsetsGeometry? contentPadding;
  final bool isCollapsed;
  final Widget? suffixIcon;
  final Widget? suffix;
  final String? suffixText;
  final TextStyle? suffixStyle;
  final Color? suffixIconColor;
  final BoxConstraints? suffixIconConstraints;
  final String? counterText;
  final Widget? counter;
  final TextStyle? counterStyle;
  final bool? filled;
  final Color? fillColor;
  final Color? focusColor;
  final Color? hoverColor;
  final InputBorder? errorBorder;
  final InputBorder? focusedBorder;
  final InputBorder? focusedErrorBorder;
  final InputBorder? disabledBorder;
  final InputBorder? enabledBorder;
  final InputBorder? border;
  final bool alignLabelWithHint;
  final bool useMaterial;
  final bool useCupertino;
  final bool isOutlined;
  final bool readOnly = true;
  final bool showCursor = false;
  final bool enabled;
  //endregion
  @override
  _NSearchField createState() => _NSearchField<T>();
}

class _NSearchField<T> extends State<NSearchField> {
  @override
  Widget build(BuildContext context) {
    if (widget.useMaterial) {
      return _materialField(context);
    } else if (widget.useCupertino) {
      return _cupertinoField(context);
    } else {
      return Platform.isIOS
          ? _cupertinoField(context)
          : _materialField(context);
    }
  }

  Widget _cupertinoField(BuildContext context) {
    return ListTile(
      onTap: widget.onTap,
      title: CupertinoFormRow(
        prefix: _iosPrefix,
        child: CupertinoTextFormFieldRow(
          decoration: _iosDecoration,
          controller: widget.controller,
          onTap: widget.onTap,
          validator: widget.validator,
          onSaved: widget.onSaved,
          onChanged: widget.onChanged,
          focusNode: widget.focusNode,
          placeholder: widget.hintText,
          placeholderStyle: widget.hintStyle,
          textCapitalization: widget.textCapitalization,
          style: widget.style ??
              TextStyle(color: Theme.of(context).colorScheme.onSurface),
          readOnly: true,
          toolbarOptions: widget.toolbarOptions,
          showCursor: false,
          autofocus: false,
          cursorWidth: 0,
          cursorHeight: 0,
        ),
        helper: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (widget.helperText?.isNotEmpty == true)
              Text(widget.helperText!,
                  style: widget.helperStyle ??
                      TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.onSurface),
                  maxLines: widget.helperMaxLines ??
                      Theme.of(context).inputDecorationTheme.helperMaxLines),
            Expanded(child: Container()),
            if (widget.counterText?.isNotEmpty == true)
              Text(
                widget.counterText!,
                style: widget.counterStyle ??
                    TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.onSurface),
              )
          ],
        ),
        error: (widget.errorText?.isNotEmpty == true)
            ? Text(widget.errorText!,
                style: widget.errorStyle, maxLines: widget.errorMaxLines)
            : null,
      ),
      trailing: _iosSuffix,
    );
  }

  Widget _materialField(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: TextFormField(
          key: widget.key,
          controller: widget.controller,
          focusNode: widget.focusNode,
          decoration: _androidDecoration,
          textCapitalization: widget.textCapitalization,
          style: widget.style,
          readOnly: true,
          toolbarOptions: widget.toolbarOptions,
          showCursor: widget.showCursor,
          onChanged: widget.onChanged,
          onTap: widget.onTap,
          onFieldSubmitted: widget.onFieldSubmitted,
          onSaved: widget.onSaved,
          validator: widget.validator,
          enabled: widget.enabled,
        ),
      );

  get _iosPrefix {
    BoxConstraints constraints;
    Color color;
    if (widget.prefixIconConstraints != null) {
      constraints = widget.prefixIconConstraints!;
    } else {
      constraints = BoxConstraints.tight(const Size(24, 36));
    }
    if (widget.prefixIconColor != null) {
      color = widget.prefixIconColor!;
    } else {
      color = Theme.of(context).primaryColor;
    }
    if (widget.prefix == null &&
        widget.prefixIcon == null &&
        widget.label == null &&
        !(widget.labelText?.isNotEmpty == true)) {
      return null;
    } else if (widget.prefix != null &&
        widget.prefixIcon == null &&
        widget.label == null &&
        !(widget.labelText?.isNotEmpty == true)) {
      return widget.prefix!;
    } else if (widget.prefix == null &&
        widget.prefixIcon == null &&
        widget.label != null &&
        !(widget.labelText?.isNotEmpty == true)) {
      return widget.label!;
    } else if (widget.prefix != null && widget.labelText != null) {
      return SizedBox(
        height: constraints.minHeight,
        child: Row(
          children: [
            widget.prefix!,
            const SizedBox(width: 3),
            if (widget.labelStyle != null)
              Text(widget.labelText!, style: widget.labelStyle!),
            if (widget.labelStyle == null)
              Text(widget.labelText!,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface)),
          ],
        ),
      );
    } else if (widget.prefix != null && widget.label != null) {
      return SizedBox(
        height: constraints.minHeight,
        child: Row(
          children: [
            widget.prefix!,
            const SizedBox(width: 3),
            widget.label!,
          ],
        ),
      );
    } else if (widget.prefixIcon != null && widget.label != null) {
      return SizedBox(
        height: constraints.minHeight,
        child: Row(
          children: [
            widget.prefixIcon!,
            const SizedBox(width: 3),
            widget.label!,
          ],
        ),
      );
    } else {
      return SizedBox(
        height: constraints.minHeight,
        child: Row(
          children: [
            if (widget.prefixIcon != null) widget.prefixIcon!,
            const SizedBox(width: 3),
            if (widget.labelText != null && widget.labelStyle != null)
              Text(widget.labelText!, style: widget.labelStyle!),
            if (widget.labelText != null && widget.labelStyle == null)
              Text(
                widget.labelText!,
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onSurface),
              ),
          ],
        ),
      );
    }
  }

  get _iosSuffix {
    if (widget.suffix == null &&
        widget.suffixText?.isNotEmpty == true &&
        widget.suffixIcon == null) {
      return null;
    } else if (widget.suffix != null) {
      return Flexible(flex: 1, child: widget.suffix!);
    } else {
      BoxConstraints constraints;
      Color color;
      if (widget.suffixIconConstraints != null) {
        constraints = widget.suffixIconConstraints!;
      } else {
        constraints = BoxConstraints.tight(const Size(24, 36));
      }
      if (widget.suffixIconColor != null) {
        color = widget.suffixIconColor!;
      } else {
        color = Theme.of(context).primaryColor;
      }
      return SizedBox(
        height: constraints.maxHeight,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.suffixText?.isNotEmpty == true &&
                widget.suffixStyle != null)
              Text(widget.suffixText!,
                  style: widget.suffixStyle!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface)),
            if (widget.suffixText?.isNotEmpty == true &&
                widget.suffixStyle == null)
              Text(
                widget.suffixText!,
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onSurface),
              ),
            const SizedBox(width: 3),
            if (widget.suffixIcon != null)
              widget.suffixIcon!
            else
              const Padding(
                padding: EdgeInsets.all(6.0),
                child: Icon(CupertinoIcons.right_chevron),
              )
          ],
        ),
      );
    }
  }

  get _iosBorderSide =>
      BorderSide(color: Theme.of(context).colorScheme.onSurface, width: 0.0);

  get _iosDecoration => widget.isOutlined
      ? BoxDecoration(
          color: widget.filled == true
              ? Theme.of(context).colorScheme.surface
              : Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          border: Border(
              top: _iosBorderSide,
              bottom: _iosBorderSide,
              left: _iosBorderSide,
              right: _iosBorderSide),
        )
      : widget.border;

  get _androidDecoration => widget.isOutlined
      ? InputDecoration(
          icon: widget.icon,
          iconColor: widget.iconColor,
          label: widget.label,
          labelText: widget.labelText,
          labelStyle: widget.labelStyle,
          floatingLabelStyle: widget.floatingLabelStyle,
          helperText: widget.helperText,
          helperStyle: widget.helperStyle,
          helperMaxLines: widget.helperMaxLines,
          hintText: widget.hintText,
          hintStyle: widget.hintStyle,
          errorText: widget.errorText,
          errorStyle: widget.errorStyle,
          errorMaxLines: widget.errorMaxLines,
          floatingLabelBehavior: widget.floatingLabelBehavior,
          isCollapsed: widget.isCollapsed,
          isDense: widget.isDense,
          contentPadding: widget.contentPadding,
          prefixIcon: widget.prefixIcon,
          prefixIconConstraints: widget.prefixIconConstraints,
          prefix: widget.prefix,
          prefixIconColor: widget.prefixIconColor,
          suffixIcon: widget.suffixIcon ?? const Icon(Icons.arrow_right),
          suffix: widget.suffix,
          suffixText: widget.suffixText,
          suffixStyle: widget.suffixStyle,
          suffixIconColor: widget.suffixIconColor,
          suffixIconConstraints: widget.suffixIconConstraints,
          counter: widget.counter,
          counterText: widget.counterText,
          counterStyle: widget.counterStyle,
          filled: widget.filled,
          fillColor: widget.fillColor,
          focusColor: widget.focusColor,
          hoverColor: widget.hoverColor,
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context).errorColor,
                  width: 1,
                  style: BorderStyle.solid)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 1,
                  style: BorderStyle.solid)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: widget.focusColor ?? Theme.of(context).focusColor,
                  width: 1,
                  style: BorderStyle.solid)),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context).disabledColor,
                  width: 1,
                  style: BorderStyle.solid)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: widget.iconColor ??
                      widget.prefixIconColor ??
                      widget.suffixIconColor ??
                      Theme.of(context).colorScheme.onSurface,
                  width: 1,
                  style: BorderStyle.solid)),
          alignLabelWithHint: widget.alignLabelWithHint,
        )
      : widget.border ??
          InputDecoration(
            icon: widget.icon,
            iconColor: widget.iconColor,
            label: widget.label,
            labelText: widget.labelText,
            labelStyle: widget.labelStyle,
            floatingLabelStyle: widget.floatingLabelStyle,
            helperText: widget.helperText,
            helperStyle: widget.helperStyle,
            helperMaxLines: widget.helperMaxLines,
            hintText: widget.hintText,
            hintStyle: widget.hintStyle,
            errorText: widget.errorText,
            errorStyle: widget.errorStyle,
            errorMaxLines: widget.errorMaxLines,
            floatingLabelBehavior: widget.floatingLabelBehavior,
            isCollapsed: widget.isCollapsed,
            isDense: widget.isDense,
            contentPadding: widget.contentPadding,
            prefixIcon: widget.prefixIcon,
            prefixIconConstraints: widget.prefixIconConstraints,
            prefix: widget.prefix,
            prefixIconColor: widget.prefixIconColor,
            suffixIcon: widget.suffixIcon ?? const Icon(Icons.arrow_right),
            suffix: widget.suffix,
            suffixText: widget.suffixText,
            suffixStyle: widget.suffixStyle,
            suffixIconColor: widget.suffixIconColor,
            suffixIconConstraints: widget.suffixIconConstraints,
            counter: widget.counter,
            counterText: widget.counterText,
            counterStyle: widget.counterStyle,
            filled: widget.filled,
            fillColor: widget.fillColor,
            focusColor: widget.focusColor,
            hoverColor: widget.hoverColor,
            errorBorder: widget.errorBorder,
            focusedBorder: widget.focusedBorder,
            focusedErrorBorder: widget.focusedErrorBorder,
            disabledBorder: widget.disabledBorder,
            enabledBorder: widget.enabledBorder,
            border: widget.border,
            alignLabelWithHint: widget.alignLabelWithHint,
          );
}

Future<T?> showNSearchDelegate<T>({
  required BuildContext context,
  required NSearchDelegate<T> delegate,
  String? query = '',
  bool useRootNavigator = false,
}) {
  delegate.query = query ?? delegate.query;
  delegate._currentBody = _SearchBody.suggestions;
  return Navigator.of(context, rootNavigator: useRootNavigator)
      .push(_SearchPageRoute(
    delegate: delegate,
  ));
}

enum _SearchBody {
  suggestions,
  results,
}

abstract class NSearchDelegate<T> {
  NSearchDelegate({
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

  _SearchPageRoute? _route;

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
    this.useCupertino = false,
    this.useMaterial = false,
  }) : assert(!(useCupertino && useMaterial));
  final NSearchDelegate<T> delegate;
  final Animation<double> animation;
  final bool useCupertino;
  final bool useMaterial;

  @override
  State<_SearchScreen<T>> createState() => _SearchScreenState<T>();
}

class _SearchScreenState<T> extends State<_SearchScreen<T>> {
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    if (widget.useCupertino) {
      return _CupertinoSearchScreen(
        delegate: widget.delegate,
        animation: widget.animation,
      );
    } else if (!widget.useMaterial) {
      return _MaterialSearchScreen(
        delegate: widget.delegate,
        animation: widget.animation,
      );
    } else {
      return Platform.isIOS
          ? _CupertinoSearchScreen(
              delegate: widget.delegate,
              animation: widget.animation,
            )
          : _MaterialSearchScreen(
              delegate: widget.delegate,
              animation: widget.animation,
            );
    }
  }

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
  final NSearchDelegate<T> delegate;
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

class _CupertinoSearchScreen<T> extends _SearchScreen<T> {
  const _CupertinoSearchScreen({
    required delegate,
    required animation,
  }) : super(delegate: delegate, animation: animation);
  @override
  State<_SearchScreen<T>> createState() => _CupertinoSearchState<T>();
}

class _MaterialSearchScreen<T> extends _SearchScreen<T> {
  const _MaterialSearchScreen({
    required delegate,
    required animation,
  }) : super(delegate: delegate, animation: animation);
  @override
  State<_SearchScreen<T>> createState() => _MaterialSearchState<T>();
}

class _MaterialSearchState<T> extends _SearchScreenState<T> {
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

class _CupertinoSearchState<T> extends _SearchScreenState<T> {
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
            automaticallyImplyLeading: true,
            middle: CupertinoSearchTextField(
              prefixIcon: Icon(
                CupertinoIcons.search,
                color: Theme.of(context).primaryColor,
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
