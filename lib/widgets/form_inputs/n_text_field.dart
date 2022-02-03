import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

class NTextField extends StatefulWidget {
  const NTextField({
    Key? key,
    this.controller,
    this.initialValue,
    this.focusNode,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.style,
    this.strutStyle,
    this.textDirection = TextDirection.ltr,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.autofocus = false,
    this.readOnly = false,
    this.toolbarOptions,
    this.showCursor,
    this.obscuringCharacter = '•',
    this.obscureText = false,
    this.autocorrect = true,
    this.smartDashesType,
    this.smartQuotesType,
    this.enableSuggestions = true,
    this.maxLengthEnforcement,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    this.inputFormatters,
    this.enabled = true,
    this.cursorWidth = 2.0,
    this.cursorHeight,
    this.cursorRadius = const Radius.circular(2.0),
    this.cursorColor,
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.enableInteractiveSelection = true,
    this.selectionControls,
    this.buildCounter,
    this.scrollPhysics,
    this.autofillHints,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.scrollController,
    this.restorationId,
    this.enableIMEPersonalizedLearning = true,
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
    this.hintTextDirection,
    this.hintMaxLines,
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
    this.semanticCounterText,
    this.alignLabelWithHint,
    this.constraints,
    this.useMaterial,
    this.useCupertino,
    this.isOutlined = true,
  })  : assert(!(label != null && labelText != null),
            'Declaring both label and labelText is not supported.'),
        assert(!(prefix != null && label != null),
            'Declaring both prefix and label is not supported.'),
        assert(!(suffix != null && suffixText != null),
            'Declaring both suffix and suffixText is not supported.'),
        assert(initialValue == null || controller == null),
        assert(obscuringCharacter.length == 1),
        assert(maxLines == null || maxLines > 0),
        assert(minLines == null || minLines > 0),
        assert(
          (maxLines == null) || (minLines == null) || (maxLines >= minLines),
          "minLines can't be greater than maxLines",
        ),
        assert(
          !expands || (maxLines == null && minLines == null),
          'minLines and maxLines must be null when expands is true.',
        ),
        assert(!obscureText || maxLines == 1,
            'Obscured fields cannot be multiline.'),
        assert(maxLength == null ||
            maxLength == TextField.noMaxLength ||
            maxLength > 0),
        assert(!(useMaterial != null && useCupertino != null),
            'Declaring both Material design and Cupertino human interface is not supported.'),
        super(key: key);
  //region properties
  final TextEditingController? controller;
  final String? initialValue;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final bool autofocus;
  final bool readOnly;
  final ToolbarOptions? toolbarOptions;
  final bool? showCursor;
  final String obscuringCharacter;
  final bool obscureText;
  final bool autocorrect;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final bool enableSuggestions;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;
  final double cursorWidth;
  final double? cursorHeight;
  final Radius cursorRadius;
  final Color? cursorColor;
  final Brightness? keyboardAppearance;
  final EdgeInsets scrollPadding;
  final bool enableInteractiveSelection;
  final TextSelectionControls? selectionControls;
  final InputCounterWidgetBuilder? buildCounter;
  final ScrollPhysics? scrollPhysics;
  final Iterable<String>? autofillHints;
  final AutovalidateMode autovalidateMode;
  final ScrollController? scrollController;
  final String? restorationId;
  final bool enableIMEPersonalizedLearning;
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
  final TextDirection? hintTextDirection;
  final int? hintMaxLines;
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
  final String? semanticCounterText;
  final bool? alignLabelWithHint;
  final BoxConstraints? constraints;
  final bool? useMaterial;
  final bool? useCupertino;
  final bool isOutlined;
  //endregion

  const NTextField.outlined({
    Key? key,
    this.controller,
    this.initialValue,
    this.focusNode,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.style,
    this.strutStyle,
    this.textDirection = TextDirection.ltr,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.autofocus = false,
    this.readOnly = false,
    this.toolbarOptions,
    this.showCursor,
    this.obscuringCharacter = '•',
    this.obscureText = false,
    this.autocorrect = true,
    this.smartDashesType,
    this.smartQuotesType,
    this.enableSuggestions = true,
    this.maxLengthEnforcement,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    this.inputFormatters,
    this.enabled = true,
    this.cursorWidth = 2.0,
    this.cursorHeight,
    this.cursorRadius = const Radius.circular(2.0),
    this.cursorColor,
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.enableInteractiveSelection = true,
    this.selectionControls,
    this.buildCounter,
    this.scrollPhysics,
    this.autofillHints,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.scrollController,
    this.restorationId,
    this.enableIMEPersonalizedLearning = true,
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
    this.hintTextDirection,
    this.hintMaxLines,
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
    this.semanticCounterText,
    this.alignLabelWithHint,
    this.constraints,
    this.useMaterial,
    this.useCupertino,
    this.isOutlined = true,
  })  : assert(!(label != null && labelText != null),
            'Declaring both label and labelText is not supported.'),
        assert(!(prefix != null && label != null),
            'Declaring both prefix and label is not supported.'),
        assert(!(suffix != null && suffixText != null),
            'Declaring both suffix and suffixText is not supported.'),
        assert(initialValue == null || controller == null),
        assert(obscuringCharacter.length == 1),
        assert(maxLines == null || maxLines > 0),
        assert(minLines == null || minLines > 0),
        assert(
          (maxLines == null) || (minLines == null) || (maxLines >= minLines),
          "minLines can't be greater than maxLines",
        ),
        assert(
          !expands || (maxLines == null && minLines == null),
          'minLines and maxLines must be null when expands is true.',
        ),
        assert(!obscureText || maxLines == 1,
            'Obscured fields cannot be multiline.'),
        assert(maxLength == null ||
            maxLength == TextField.noMaxLength ||
            maxLength > 0),
        assert(!(useMaterial != null && useCupertino != null),
            'Declaring both Material design and Cupertino human interface is not supported.'),
        super(key: key);

  @override
  _NTextFieldState createState() => _NTextFieldState();
}

class _NTextFieldState extends State<NTextField> {
  @override
  Widget build(BuildContext context) {
    bool _isIOS;
    if (widget.useCupertino == true) {
      _isIOS = true;
    } else if (widget.useMaterial == true) {
      _isIOS = false;
    } else {
      _isIOS = Platform.isIOS;
    }
    double _sizeDiff = 64.0;
    if (widget.suffix != null) {
      _sizeDiff = 64.0;
    } else if (widget.suffixIcon == null && widget.suffixText != null) {
      _sizeDiff = 128.0;
    } else if (widget.suffixIcon != null && widget.suffixText != null) {
      _sizeDiff = 104.0;
    } else if (widget.suffixIcon == null && widget.suffixText == null) {
      _sizeDiff = 24.0;
    }
    return _isIOS
        ? Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - _sizeDiff,
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
                    placeholder: widget.hintText,
                    placeholderStyle: widget.hintStyle,
                    keyboardType: widget.keyboardType,
                    textInputAction: widget.textInputAction,
                    textCapitalization: widget.textCapitalization,
                    style: widget.style ??
                        TextStyle(
                            color: Theme.of(context).colorScheme.onSurface),
                    strutStyle: widget.strutStyle,
                    textAlign: widget.textAlign,
                    textAlignVertical: widget.textAlignVertical,
                    textDirection: widget.textDirection,
                    readOnly: widget.readOnly,
                    toolbarOptions: widget.toolbarOptions,
                    showCursor: widget.showCursor,
                    autofocus: widget.autofocus,
                    obscuringCharacter: widget.obscuringCharacter,
                    obscureText: widget.obscureText,
                    autocorrect: widget.autocorrect,
                    smartDashesType: widget.smartDashesType,
                    smartQuotesType: widget.smartQuotesType,
                    enableSuggestions: widget.enableSuggestions,
                    maxLines: widget.maxLines,
                    minLines: widget.minLines,
                    expands: widget.expands,
                    maxLength: widget.maxLength,
                    onEditingComplete: widget.onEditingComplete,
                    inputFormatters: widget.inputFormatters,
                    enabled: widget.enabled,
                    cursorWidth: widget.cursorWidth,
                    cursorHeight: widget.cursorHeight,
                    cursorColor: widget.cursorColor,
                    keyboardAppearance: widget.keyboardAppearance,
                    scrollPadding: widget.scrollPadding,
                    enableInteractiveSelection:
                        widget.enableInteractiveSelection,
                    selectionControls: widget.selectionControls,
                    scrollPhysics: widget.scrollPhysics,
                    autofillHints: widget.autofillHints,
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
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface),
                            maxLines: widget.helperMaxLines ??
                                Theme.of(context)
                                    .inputDecorationTheme
                                    .helperMaxLines),
                      Expanded(child: Container()),
                      if (widget.counterText?.isNotEmpty == true)
                        Text(
                          widget.counterText!,
                          style: widget.counterStyle ??
                              TextStyle(
                                  fontSize: 14,
                                  color:
                                      Theme.of(context).colorScheme.onSurface),
                        )
                    ],
                  ),
                  error: (widget.errorText?.isNotEmpty == true)
                      ? Text(widget.errorText!,
                          style: widget.errorStyle,
                          maxLines: widget.errorMaxLines)
                      : null,
                ),
              ),
              _iosSuffix
            ],
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              key: widget.key,
              controller: widget.controller,
              initialValue: widget.initialValue,
              focusNode: widget.focusNode,
              decoration: _androidDecoration,
              keyboardType: widget.keyboardType,
              textCapitalization: widget.textCapitalization,
              textInputAction: widget.textInputAction,
              style: widget.style,
              strutStyle: widget.strutStyle,
              textDirection: widget.textDirection,
              textAlign: widget.textAlign,
              textAlignVertical: widget.textAlignVertical,
              autofocus: widget.autofocus,
              readOnly: widget.readOnly,
              toolbarOptions: widget.toolbarOptions,
              showCursor: widget.showCursor,
              obscuringCharacter: widget.obscuringCharacter,
              obscureText: widget.obscureText,
              autocorrect: widget.autocorrect,
              smartDashesType: widget.smartDashesType,
              smartQuotesType: widget.smartQuotesType,
              enableSuggestions: widget.enableSuggestions,
              maxLengthEnforcement: widget.maxLengthEnforcement,
              maxLines: widget.maxLines,
              minLines: widget.minLines,
              expands: widget.expands,
              maxLength: widget.maxLength,
              onChanged: widget.onChanged,
              onTap: widget.onTap,
              onEditingComplete: widget.onEditingComplete,
              onFieldSubmitted: widget.onFieldSubmitted,
              onSaved: widget.onSaved,
              validator: widget.validator,
              inputFormatters: widget.inputFormatters,
              enabled: widget.enabled,
              cursorWidth: widget.cursorWidth,
              cursorHeight: widget.cursorHeight,
              cursorRadius: widget.cursorRadius,
              cursorColor: widget.cursorColor,
              keyboardAppearance: widget.keyboardAppearance,
              scrollPadding: widget.scrollPadding,
              enableInteractiveSelection: widget.enableInteractiveSelection,
              selectionControls: widget.selectionControls,
              buildCounter: widget.buildCounter,
              scrollPhysics: widget.scrollPhysics,
              autofillHints: widget.autofillHints,
              autovalidateMode: widget.autovalidateMode,
              scrollController: widget.scrollController,
              restorationId: widget.restorationId,
              enableIMEPersonalizedLearning:
                  widget.enableIMEPersonalizedLearning,
            ),
          );
  }

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
      return Flexible(
        flex: 1,
        child: SizedBox(
          height: constraints.maxHeight,
          child: Row(
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
              if (widget.suffixIcon != null) widget.suffixIcon!
            ],
          ),
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
              right: _iosBorderSide))
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
          hintTextDirection: widget.hintTextDirection,
          hintMaxLines: widget.hintMaxLines,
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
          suffixIcon: widget.suffixIcon,
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
          semanticCounterText: widget.semanticCounterText,
          alignLabelWithHint: widget.alignLabelWithHint,
          constraints: widget.constraints,
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
            hintTextDirection: widget.hintTextDirection,
            hintMaxLines: widget.hintMaxLines,
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
            suffixIcon: widget.suffixIcon,
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
            semanticCounterText: widget.semanticCounterText,
            alignLabelWithHint: widget.alignLabelWithHint,
            constraints: widget.constraints,
          );
}
