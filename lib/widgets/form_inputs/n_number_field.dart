import 'dart:async';
import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum _InputAction { increment, decrement, reset }

enum InputStyle {
  inline,
  inlineStackButtons,
  inlineSymmetric,
  roundStacked,
  roundInline
}

class NNumericField extends StatefulWidget {
  const NNumericField({
    Key? key,
    this.controller,
    this.initialValue = 0,
    this.focusNode,
    this.textInputAction,
    this.style,
    this.autofocus = false,
    this.readOnly = false,
    this.toolbarOptions,
    this.showCursor,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    this.enabled = true,
    this.cursorWidth = 2.0,
    this.cursorHeight,
    this.cursorRadius = const Radius.circular(2.0),
    this.cursorColor,
    this.keyboardAppearance,
    this.enableInteractiveSelection = true,
    this.selectionControls,
    this.buildCounter,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.restorationId,
    this.icon,
    this.iconColor,
    this.label,
    this.labelText,
    this.labelStyle,
    this.floatingLabelStyle,
    this.hintTextDirection,
    this.hintMaxLines,
    this.errorText,
    this.errorStyle,
    this.floatingLabelBehavior,
    this.isDense,
    this.contentPadding,
    this.isCollapsed = false,
    this.suffix,
    this.footerLeftText,
    this.footerLeftStyle,
    this.footerLeftMaxLines,
    this.footerRightText,
    this.footerRight,
    this.footerRightStyle,
    this.filled = false,
    this.fillColor,
    this.focusColor,
    this.hoverColor,
    this.errorBorder,
    this.focusedBorder,
    this.focusedErrorBorder,
    this.disabledBorder,
    this.enabledBorder,
    this.border,
    this.semanticCounterText,
    this.constraints,
    this.isInteger = false,
    this.useMaterial,
    this.useCupertino,
    this.isOutlined = false,
    this.isNegativeValid = false,
    this.canReset = true,
    this.canIncrement = true,
    this.canDecrement = true,
    this.dividerColor,
    this.incrementButtonColor,
    this.incrementButtonIconColor,
    this.decrementButtonColor,
    this.decrementButtonIconColor,
    this.resetButtonColor,
    this.resetButtonIconColor,
  })  : assert(!(label != null && labelText != null),
            'Declaring both label and labelText is not supported.'),
        assert(!(useMaterial != null && useCupertino != null),
            'Declaring both Material design and Cupertino human interface is not supported.'),
        super(key: key);

  //region properties
  final TextEditingController? controller;
  final num? initialValue;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final bool autofocus;
  final bool readOnly;
  final ToolbarOptions? toolbarOptions;
  final bool? showCursor;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final bool enabled;
  final double cursorWidth;
  final double? cursorHeight;
  final Radius cursorRadius;
  final Color? cursorColor;
  final Brightness? keyboardAppearance;
  final bool enableInteractiveSelection;
  final TextSelectionControls? selectionControls;
  final InputCounterWidgetBuilder? buildCounter;
  final AutovalidateMode autovalidateMode;
  final String? restorationId;
  final Widget? icon;
  final Color? iconColor;
  final Widget? label;
  final String? labelText;
  final TextStyle? labelStyle;
  final TextStyle? floatingLabelStyle;
  final TextDirection? hintTextDirection;
  final int? hintMaxLines;
  final String? footerLeftText;
  final TextStyle? footerLeftStyle;
  final int? footerLeftMaxLines;
  final String? errorText;
  final TextStyle? errorStyle;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final bool? isDense;
  final EdgeInsetsGeometry? contentPadding;
  final bool isCollapsed;
  final Widget? suffix;
  final String? footerRightText;
  final Widget? footerRight;
  final TextStyle? footerRightStyle;
  final Color? focusColor;
  final Color? hoverColor;
  final InputBorder? errorBorder;
  final InputBorder? focusedBorder;
  final InputBorder? focusedErrorBorder;
  final InputBorder? disabledBorder;
  final InputBorder? enabledBorder;
  final InputBorder? border;
  final String? semanticCounterText;
  final BoxConstraints? constraints;
  final bool? useMaterial;
  final bool? useCupertino;
  final bool isOutlined;
  final bool isInteger;
  final bool isNegativeValid;
  final bool canReset;
  final bool canIncrement;
  final bool canDecrement;
  final bool filled;
  final Color? fillColor;
  final Color? dividerColor;
  final Color? incrementButtonColor;
  final Color? incrementButtonIconColor;
  final Color? decrementButtonColor;
  final Color? decrementButtonIconColor;
  final Color? resetButtonColor;
  final Color? resetButtonIconColor;
  //endregion

  @override
  _NumericInput createState() => _NumericInput();
}

class _NumericInput extends State<NNumericField> {
  final String _counterId = 'numeric-input-${DateTime.now().toIso8601String()}';
  late _NumericBloc bloc;
  late bool _isIOS;

  @override
  void initState() {
    super.initState();
    //region cupertino or material
    if (widget.useCupertino == true) {
      _isIOS = true;
    } else if (widget.useMaterial == true) {
      _isIOS = false;
    } else {
      _isIOS = Platform.isIOS;
    }
    //endregion
    //region bloc selection
    bloc = widget.isInteger
        ? _IntBloc(
            context: context,
            initialValue: widget.controller?.text.isEmpty == true
                ? widget.initialValue != null
                    ? widget.initialValue!.toInt()
                    : 0
                : int.tryParse(widget.controller!.text) ?? 0,
            isNegativeValid: widget.isNegativeValid)
        : _DoubleBloc(
            context: context,
            initialValue: widget.controller?.text != null
                ? double.tryParse(widget.controller!.text) ?? 0.00
                : widget.initialValue != null
                    ? widget.initialValue!.toDouble()
                    : 0.00,
            isNegativeValid: widget.isNegativeValid) as _NumericBloc;
    bloc.stream.listen((event) {
      widget.controller!.text = event.toString();
    });
    //endregion
  }

  @override
  Widget build(BuildContext context) {
    double variableWidth = 96;
    if (widget.icon != null) {
      variableWidth += 36;
    }
    if (widget.canDecrement) {
      variableWidth += 36;
    }
    if (widget.label != null || widget.labelText != null) {
      variableWidth += 36;
    }
    return _isIOS
        ? Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 96,
                  maxWidth: variableWidth,
                  minHeight: 102,
                ),
                child: CupertinoFormRow(
                  prefix: widget.icon,
                  child: CupertinoTextFormFieldRow(
                    decoration: _iosDecoration,
                    controller: widget.controller,
                    validator: widget.validator,
                    prefix: _iosPrefix,
                    onSaved: widget.onSaved,
                    onChanged: widget.onChanged,
                    onTap: widget.onTap,
                    focusNode: widget.focusNode,
                    keyboardType: TextInputType.number,
                    textInputAction: widget.textInputAction,
                    textAlign: TextAlign.center,
                    style: widget.style ??
                        TextStyle(
                            color: Theme.of(context).colorScheme.onSurface),
                    readOnly: widget.readOnly,
                    toolbarOptions: widget.toolbarOptions,
                    showCursor: widget.showCursor,
                    autofocus: widget.autofocus,
                    onEditingComplete: widget.onEditingComplete,
                    enabled: widget.enabled,
                    cursorWidth: widget.cursorWidth,
                    cursorHeight: widget.cursorHeight,
                    cursorColor: widget.cursorColor,
                    keyboardAppearance: widget.keyboardAppearance,
                    enableInteractiveSelection:
                        widget.enableInteractiveSelection,
                    selectionControls: widget.selectionControls,
                  ),
                  helper: _iosFooter,
                  error: _iosError,
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(height: 12),
                  _iosSuffix,
                  const SizedBox(height: 12),
                  if (widget.footerRightText?.isNotEmpty == true)
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: Text(
                        widget.footerRightText!,
                        style: widget.footerRightStyle ??
                            TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).colorScheme.onSurface),
                      ),
                    ),
                ],
              )
            ],
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.icon != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: widget.icon!,
                  ),
                const SizedBox(width: 12),
                SizedBox(
                  width: 140,
                  height: 72,
                  child: TextFormField(
                    key: widget.key,
                    controller: widget.controller,
                    focusNode: widget.focusNode,
                    decoration: _androidDecoration,
                    keyboardType: TextInputType.number,
                    textInputAction: widget.textInputAction,
                    style: widget.style,
                    textAlign: TextAlign.center,
                    autofocus: widget.autofocus,
                    readOnly: widget.readOnly,
                    toolbarOptions: widget.toolbarOptions,
                    showCursor: widget.showCursor,
                    onChanged: widget.onChanged,
                    onTap: widget.onTap,
                    onEditingComplete: widget.onEditingComplete,
                    onFieldSubmitted: widget.onFieldSubmitted,
                    onSaved: widget.onSaved,
                    validator: widget.validator,
                    enabled: widget.enabled,
                    cursorWidth: widget.cursorWidth,
                    cursorHeight: widget.cursorHeight,
                    cursorRadius: widget.cursorRadius,
                    cursorColor: widget.cursorColor,
                    keyboardAppearance: widget.keyboardAppearance,
                    enableInteractiveSelection:
                        widget.enableInteractiveSelection,
                    selectionControls: widget.selectionControls,
                    buildCounter: widget.buildCounter,
                    autovalidateMode: widget.autovalidateMode,
                    restorationId: widget.restorationId,
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  children: [
                    Row(
                      children: [
                        if (widget.canIncrement)
                          FloatingActionButton(
                            backgroundColor: widget.incrementButtonColor ??
                                Theme.of(context).colorScheme.secondary,
                            heroTag: "increment $_counterId",
                            mini: true,
                            child: Icon(
                              Icons.add,
                              color: widget.incrementButtonIconColor ??
                                  Theme.of(context)
                                      .buttonTheme
                                      .colorScheme
                                      ?.onSecondary ??
                                  Colors.white,
                            ),
                            onPressed: () => setState(() {
                              bloc.increment();
                            }),
                          ),
                        if (widget.canReset)
                          FloatingActionButton(
                            backgroundColor: widget.resetButtonColor ??
                                Theme.of(context).colorScheme.secondary,
                            heroTag: "reset $_counterId",
                            mini: true,
                            child: Icon(
                              Icons.refresh,
                              color: widget.resetButtonIconColor ??
                                  Theme.of(context)
                                      .buttonTheme
                                      .colorScheme
                                      ?.onSecondary ??
                                  Colors.white,
                            ),
                            onPressed: () => setState(() {
                              bloc.reset();
                            }),
                          ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    if (_counter != null) _counter!,
                    const SizedBox(height: 16),
                  ],
                ),
              ],
            ));
  }

  Widget? get _label =>
      widget.label ??
      ((widget.labelText != null)
          ? Text(
              widget.labelText!,
              style: widget.labelStyle ??
                  TextStyle(color: Theme.of(context).colorScheme.onSurface),
            )
          : null);

  Widget? get _counter =>
      widget.footerRight ??
      ((widget.footerRightText != null)
          ? Text(
              widget.footerRightText!,
              style: widget.footerRightStyle ??
                  TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.onSurface),
            )
          : null);

  get _iosError => (widget.errorText?.isNotEmpty == true)
      ? Text(widget.errorText!,
          style: widget.errorStyle,
          maxLines: 1,
          softWrap: true,
          overflow: TextOverflow.ellipsis)
      : null;

  get _iosFooter => Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(height: 24),
          if (widget.footerLeftText?.isNotEmpty == true)
            Text(widget.footerLeftText!,
                style: widget.footerLeftStyle ??
                    TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.onSurface),
                maxLines: widget.footerLeftMaxLines ??
                    Theme.of(context).inputDecorationTheme.helperMaxLines),
        ],
      );

  get _iosPrefix => Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (_label != null)
            Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: _label!,
            ),
          if (widget.canDecrement)
            SizedBox(
              height: 36,
              width: 36,
              child: CupertinoButton(
                color: widget.decrementButtonColor ??
                    Theme.of(context).colorScheme.secondary,
                minSize: 24.0,
                padding: const EdgeInsets.symmetric(horizontal: 6),
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.remove,
                  color: widget.decrementButtonIconColor ??
                      Theme.of(context).buttonTheme.colorScheme?.onSecondary ??
                      Colors.white,
                ),
                onPressed: () => setState(() {
                  bloc.decrement();
                }),
              ),
            ),
          const SizedBox(width: 12),
        ],
      );

  get _iosSuffix => ConstrainedBox(
        constraints: const BoxConstraints(
            minHeight: 34, maxHeight: 48, maxWidth: 256, minWidth: 104),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (widget.canIncrement)
              SizedBox(
                height: 36,
                width: 36,
                child: CupertinoButton(
                  color: widget.incrementButtonColor ??
                      Theme.of(context).colorScheme.secondary,
                  minSize: 24.0,
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.add,
                    color: widget.incrementButtonIconColor ??
                        Theme.of(context)
                            .buttonTheme
                            .colorScheme
                            ?.onSecondary ??
                        Colors.white,
                  ),
                  onPressed: () => setState(() {
                    bloc.increment();
                  }),
                ),
              ),
            const SizedBox(width: 12),
            if (widget.canReset)
              SizedBox(
                height: 36,
                width: 36,
                child: CupertinoButton(
                  color: widget.resetButtonColor ??
                      Theme.of(context).colorScheme.secondary,
                  minSize: 24.0,
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.refresh,
                    color: widget.resetButtonIconColor ??
                        Theme.of(context)
                            .buttonTheme
                            .colorScheme
                            ?.onSecondary ??
                        Colors.white,
                  ),
                  onPressed: () => setState(() {
                    bloc.reset();
                  }),
                ),
              ),
            const SizedBox(width: 12),
            if (widget.suffix != null) widget.suffix!,
            const SizedBox(width: 12),
          ],
        ),
      );

  get _iosBorderSide =>
      BorderSide(color: Theme.of(context).colorScheme.onSurface, width: 0.0);

  get _iosDecoration => widget.isOutlined
      ? BoxDecoration(
          color: widget.filled == true
              ? widget.fillColor ??
                  Theme.of(context).inputDecorationTheme.fillColor
              : Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          border: Border(
              top: _iosBorderSide,
              bottom: _iosBorderSide,
              left: _iosBorderSide,
              right: _iosBorderSide))
      : widget.border;

  get _androidDecoration => widget.isOutlined
      ? InputDecoration(
          icon: (widget.canDecrement)
              ? FloatingActionButton(
                  backgroundColor: widget.decrementButtonColor ??
                      Theme.of(context).colorScheme.secondary,
                  heroTag: "decrement $_counterId",
                  mini: true,
                  child: Icon(
                    Icons.remove,
                    color: widget.decrementButtonIconColor ??
                        Theme.of(context)
                            .buttonTheme
                            .colorScheme
                            ?.onSecondary ??
                        Colors.white,
                  ),
                  onPressed: () => setState(() {
                    bloc.decrement();
                  }),
                )
              : null,
          label: _label,
          floatingLabelStyle: widget.floatingLabelStyle,
          helperText: widget.footerLeftText,
          helperStyle: widget.footerLeftStyle,
          helperMaxLines: widget.footerLeftMaxLines,
          hintTextDirection: widget.hintTextDirection,
          hintMaxLines: widget.hintMaxLines,
          errorText: widget.errorText,
          errorStyle: widget.errorStyle,
          floatingLabelBehavior: widget.floatingLabelBehavior,
          isCollapsed: widget.isCollapsed,
          isDense: widget.isDense,
          contentPadding: widget.contentPadding,
          suffix: (widget.suffix != null) ? widget.suffix! : null,
          filled: widget.filled,
          fillColor: widget.fillColor ??
              Theme.of(context).inputDecorationTheme.fillColor,
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
                      Theme.of(context).colorScheme.onSurface,
                  width: 1,
                  style: BorderStyle.solid)),
          semanticCounterText: widget.semanticCounterText,
          constraints: widget.constraints,
        )
      : widget.border ??
          InputDecoration(
            icon: (widget.canDecrement)
                ? FloatingActionButton(
                    backgroundColor: widget.decrementButtonColor ??
                        Theme.of(context).colorScheme.secondary,
                    heroTag: "decrement $_counterId",
                    mini: true,
                    child: Icon(
                      Icons.remove,
                      color: widget.decrementButtonIconColor ??
                          Theme.of(context)
                              .buttonTheme
                              .colorScheme
                              ?.onSecondary ??
                          Colors.white,
                    ),
                    onPressed: () => setState(() {
                      bloc.decrement();
                    }),
                  )
                : null,
            label: _label,
            floatingLabelStyle: widget.floatingLabelStyle,
            helperText: widget.footerLeftText,
            helperStyle: widget.footerLeftStyle,
            helperMaxLines: widget.footerLeftMaxLines,
            hintTextDirection: widget.hintTextDirection,
            hintMaxLines: widget.hintMaxLines,
            errorText: widget.errorText,
            errorStyle: widget.errorStyle,
            floatingLabelBehavior: widget.floatingLabelBehavior,
            isCollapsed: widget.isCollapsed,
            isDense: widget.isDense,
            contentPadding: widget.contentPadding,
            suffix: (widget.suffix != null) ? widget.suffix! : null,
            filled: widget.filled,
            fillColor: widget.fillColor ??
                Theme.of(context).inputDecorationTheme.fillColor,
            focusColor: widget.focusColor,
            hoverColor: widget.hoverColor,
            errorBorder: widget.errorBorder,
            focusedBorder: widget.focusedBorder,
            focusedErrorBorder: widget.focusedErrorBorder,
            disabledBorder: widget.disabledBorder,
            enabledBorder: widget.enabledBorder,
            border: widget.border,
            semanticCounterText: widget.semanticCounterText,
            constraints: widget.constraints,
          );
}

class _IntBloc implements _NumericBloc<int> {
  late int _counter;
  late final bool isNegativeValid;
  late final _stateStreamController = StreamController<int>();
  late final _eventStreamController = StreamController<_InputAction>();

  StreamSink<int> get _counterSink => _stateStreamController.sink;
  Stream<int> get _counterStream => _stateStreamController.stream;
  StreamSink<_InputAction> get _eventSink => _eventStreamController.sink;
  Stream<_InputAction> get _eventStream => _eventStreamController.stream;
  @override
  Stream<int> get stream => _counterStream;

  _IntBloc({
    required BuildContext context,
    required int initialValue,
    required bool isNegativeValid,
  }) {
    _counter = initialValue;
    _eventStream.listen((event) {
      switch (event) {
        case _InputAction.increment:
          _counter++;
          break;
        case _InputAction.decrement:
          {
            if (!isNegativeValid && _counter == 0) {
              break;
            }
            _counter--;
          }
          break;
        case _InputAction.reset:
          _counter = 0;
          break;
      }
      _counterSink.add(_counter);
    });
  }

  @override
  Future<void> increment() async => _eventSink.add(_InputAction.increment);
  @override
  Future<void> decrement() async => _eventSink.add(_InputAction.decrement);
  @override
  Future<void> reset() async => _eventSink.add(_InputAction.reset);
}

class _DoubleBloc implements _NumericBloc<double> {
  late double _counter;
  late final bool isNegativeValid;
  late final _stateStreamController = StreamController<double>();
  late final _eventStreamController = StreamController<_InputAction>();

  StreamSink<double> get _counterSink => _stateStreamController.sink;
  Stream<double> get _counterStream => _stateStreamController.stream;
  StreamSink<_InputAction> get _eventSink => _eventStreamController.sink;
  Stream<_InputAction> get _eventStream => _eventStreamController.stream;
  @override
  Stream<double> get stream => _counterStream;

  _DoubleBloc({
    required BuildContext context,
    required double initialValue,
    required bool isNegativeValid,
  }) {
    _counter = initialValue;
    _eventStream.listen((event) {
      switch (event) {
        case _InputAction.increment:
          _counter++;
          break;
        case _InputAction.decrement:
          {
            if (!isNegativeValid && _counter == 0) {
              break;
            }
            _counter--;
          }
          break;
        case _InputAction.reset:
          _counter = 0;
          break;
      }
      _counterSink.add(_counter);
    });
  }

  @override
  Future<void> increment() async => _eventSink.add(_InputAction.increment);
  @override
  Future<void> decrement() async => _eventSink.add(_InputAction.decrement);
  @override
  Future<void> reset() async => _eventSink.add(_InputAction.reset);
}

abstract class _NumericBloc<num> {
  Stream<num> get stream;
  Future<void> increment();
  Future<void> decrement();
  Future<void> reset();
}
