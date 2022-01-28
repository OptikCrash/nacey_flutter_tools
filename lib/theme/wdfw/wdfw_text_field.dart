import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui show BoxHeightStyle, BoxWidthStyle;

import 'package:flutter/services.dart';

class WDFWtext extends TextFormField {
  WDFWtext({
    Key? key,
    controller,
    validator,
    onSaved,
    initialValue,
    autovalidateMode = AutovalidateMode.disabled,
    focusNode,
    decoration,
    this.padding = const EdgeInsets.all(12),
    this.label = '',
    this.placeholder = '',
    this.placeholderStyle = const TextStyle(
      fontWeight: FontWeight.w400,
      color: CupertinoColors.placeholderText,
      inherit: false,
    ),
    prefix,
    this.prefixMode = OverlayVisibilityMode.always,
    suffix,
    this.suffixMode = OverlayVisibilityMode.always,
    this.clearButtonMode = OverlayVisibilityMode.never,
    TextInputType? keyboardType,
    this.textInputAction = TextInputAction.newline,
    this.textCapitalization = TextCapitalization.none,
    style,
    strutStyle,
    this.textAlign = TextAlign.start,
    textAlignVertical,
    textDirection,
    this.readOnly = false,
    ToolbarOptions? toolbarOptions,
    showCursor,
    this.autofocus = false,
    this.obscuringCharacter = '*',
    this.obscureText = false,
    this.autocorrect = true,
    SmartDashesType? smartDashesType,
    SmartQuotesType? smartQuotesType,
    this.enableSuggestions = true,
    this.maxLines = 1,
    minLines,
    this.expands = false,
    maxLength,
    maxLengthEnforcement,
    onChanged,
    onEditingComplete,
    onSubmitted,
    inputFormatters,
    this.isEnabled = true,
    this.cursorWidth = 2.0,
    cursorHeight,
    this.cursorRadius = const Radius.circular(2.0),
    cursorColor,
    this.selectionHeightStyle = ui.BoxHeightStyle.tight,
    this.selectionWidthStyle = ui.BoxWidthStyle.tight,
    keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.dragStartBehavior = DragStartBehavior.start,
    this.enableInteractiveSelection = true,
    selectionControls,
    onTap,
    scrollController,
    scrollPhysics,
    autofillHints,
    restorationId,
    this.enableIMEPersonalizedLearning = true,
  })  : assert(obscuringCharacter.length == 1),
        smartDashesType = smartDashesType ??
            (obscureText ? SmartDashesType.disabled : SmartDashesType.enabled),
        smartQuotesType = smartQuotesType ??
            (obscureText ? SmartQuotesType.disabled : SmartQuotesType.enabled),
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
        assert(maxLength == null || maxLength > 0),
        // Assert the following instead of setting it directly to avoid surprising the user by silently changing the value they set.
        assert(
          !identical(textInputAction, TextInputAction.newline) ||
              maxLines == 1 ||
              !identical(keyboardType, TextInputType.text),
          'Use keyboardType TextInputType.multiline when using TextInputAction.newline on a multiline TextField.',
        ),
        keyboardType = keyboardType ??
            (maxLines == 1 ? TextInputType.text : TextInputType.multiline),
        toolbarOptions = toolbarOptions ??
            (obscureText
                ? const ToolbarOptions(
                    selectAll: true,
                    paste: true,
                  )
                : const ToolbarOptions(
                    copy: true,
                    cut: true,
                    selectAll: true,
                    paste: true,
                  )),
        super(
          key: key,
          controller: controller,
          focusNode: focusNode,
          validator: validator,
          decoration: decoration,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          textCapitalization: textCapitalization,
          style: style,
          strutStyle: strutStyle,
          textAlign: textAlign,
          textAlignVertical: textAlignVertical,
          textDirection: textDirection,
          readOnly: readOnly,
          toolbarOptions: toolbarOptions,
          showCursor: showCursor,
          autofocus: autofocus,
          obscuringCharacter: obscuringCharacter,
          obscureText: obscureText,
          autocorrect: autocorrect,
          smartDashesType: smartDashesType,
          smartQuotesType: smartQuotesType,
          enableSuggestions: enableSuggestions,
          maxLines: maxLines,
          minLines: minLines,
          expands: expands,
          maxLength: maxLength,
          maxLengthEnforcement: maxLengthEnforcement,
          onChanged: onChanged,
          onEditingComplete: onEditingComplete,
          inputFormatters: inputFormatters,
          enabled: isEnabled,
          cursorWidth: cursorWidth,
          cursorHeight: cursorHeight,
          cursorRadius: cursorRadius,
          cursorColor: cursorColor,
          keyboardAppearance: keyboardAppearance,
          scrollPadding: scrollPadding,
          enableInteractiveSelection: enableInteractiveSelection,
          selectionControls: selectionControls,
          onTap: onTap,
          scrollController: scrollController,
          scrollPhysics: scrollPhysics,
          autofillHints: autofillHints,
          restorationId: restorationId,
          enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
        );
  String label;
  String placeholder;
  FocusNode? focusNode;
  BoxDecoration? decoration;
  EdgeInsets padding;
  TextStyle placeholderStyle;
  Widget? prefix;
  OverlayVisibilityMode prefixMode;
  Widget? suffix;
  OverlayVisibilityMode suffixMode;
  OverlayVisibilityMode clearButtonMode;
  TextInputType keyboardType;
  TextInputAction? textInputAction;
  TextCapitalization textCapitalization;
  TextStyle? style;
  StrutStyle? strutStyle;
  TextAlign textAlign;
  TextAlignVertical? textAlignVertical;
  TextDirection? textDirection;
  bool readOnly;
  ToolbarOptions? toolbarOptions;
  bool? showCursor;
  bool autofocus;
  bool obscureText;
  bool autocorrect;
  SmartDashesType? smartDashesType;
  SmartQuotesType? smartQuotesType;
  bool isEnabled;
  bool enableSuggestions;
  int maxLines;
  int? minLines;
  bool expands;
  int? maxLength;
  MaxLengthEnforcement? maxLengthEnforcement;
  Function(String)? onChanged;
  Function()? onEditingComplete;
  Function(String)? onSubmitted;
  List<TextInputFormatter>? inputFormatters;
  double cursorWidth;
  double? cursorHeight;
  Radius cursorRadius;
  Color? cursorColor;
  String obscuringCharacter;
  BoxHeightStyle selectionHeightStyle;
  BoxWidthStyle selectionWidthStyle;
  Brightness? keyboardAppearance;
  EdgeInsets scrollPadding;
  DragStartBehavior dragStartBehavior;
  bool enableInteractiveSelection;
  TextSelectionControls? selectionControls;
  GestureTapCallback? onTap;
  ScrollController? scrollController;
  ScrollPhysics? scrollPhysics;
  Iterable<String>? autofillHints;
  bool enableIMEPersonalizedLearning;

  // static WDFWtext create({
  //   Key? key,
  //   required BuildContext context,
  //   required TextEditingController controller,
  //   validator,
  //   focusNode,
  //   decoration,
  //   padding = const EdgeInsets.all(12),
  //   label = '',
  //   placeholder,
  //   placeholderStyle = const TextStyle(
  //     fontWeight: FontWeight.w400,
  //     color: CupertinoColors.placeholderText,
  //   ),
  //   prefix,
  //   prefixMode = OverlayVisibilityMode.always,
  //   suffix,
  //   suffixMode = OverlayVisibilityMode.always,
  //   clearButtonMode = OverlayVisibilityMode.never,
  //   TextInputType? keyboardType,
  //   textInputAction,
  //   textCapitalization = TextCapitalization.none,
  //   style,
  //   strutStyle,
  //   textAlign = TextAlign.start,
  //   textAlignVertical,
  //   textDirection,
  //   readOnly = false,
  //   ToolbarOptions? toolbarOptions,
  //   showCursor,
  //   autofocus = false,
  //   obscuringCharacter = '*',
  //   obscureText = false,
  //   autocorrect = true,
  //   SmartDashesType? smartDashesType,
  //   SmartQuotesType? smartQuotesType,
  //   enableSuggestions = true,
  //   maxLines = 1,
  //   minLines,
  //   expands = false,
  //   maxLength,
  //   maxLengthEnforcement,
  //   onChanged,
  //   onEditingComplete,
  //   onSubmitted,
  //   inputFormatters,
  //   enabled,
  //   cursorWidth = 2.0,
  //   cursorHeight,
  //   cursorRadius = const Radius.circular(2.0),
  //   cursorColor,
  //   selectionHeightStyle = ui.BoxHeightStyle.tight,
  //   selectionWidthStyle = ui.BoxWidthStyle.tight,
  //   keyboardAppearance,
  //   scrollPadding = const EdgeInsets.all(20.0),
  //   dragStartBehavior = DragStartBehavior.start,
  //   enableInteractiveSelection = true,
  //   selectionControls,
  //   onTap,
  //   scrollController,
  //   scrollPhysics,
  //   autofillHints,
  //   restorationId,
  //   enableIMEPersonalizedLearning = true,
  // }) =>
  //     WDFWtext(
  //       key: key,
  //       context: context,
  //       controller: controller,
  //       focusNode: focusNode,
  //       validator: validator,
  //       decoration: decoration,
  //       padding: padding,
  //       label: label,
  //       placeholder: placeholder,
  //       placeholderStyle: placeholderStyle,
  //       prefix: prefix,
  //       prefixMode: prefixMode,
  //       suffix: suffix,
  //       suffixMode: suffixMode,
  //       clearButtonMode: clearButtonMode,
  //       keyboardType: keyboardType,
  //       textInputAction: textInputAction,
  //       textCapitalization: textCapitalization,
  //       style: style,
  //       strutStyle: strutStyle,
  //       textAlign: textAlign,
  //       textAlignVertical: textAlignVertical,
  //       textDirection: textDirection,
  //       readOnly: readOnly,
  //       toolbarOptions: toolbarOptions,
  //       showCursor: showCursor,
  //       autofocus: autofocus,
  //       obscuringCharacter: obscuringCharacter,
  //       obscureText: obscureText,
  //       autocorrect: autocorrect,
  //       smartDashesType: smartDashesType,
  //       smartQuotesType: smartQuotesType,
  //       enableSuggestions: enableSuggestions,
  //       maxLines: maxLines,
  //       minLines: minLines,
  //       expands: expands,
  //       maxLength: maxLength,
  //       maxLengthEnforcement: maxLengthEnforcement,
  //       onChanged: onChanged,
  //       onEditingComplete: onEditingComplete,
  //       onSubmitted: onSubmitted,
  //       inputFormatters: inputFormatters,
  //       enabled: enabled,
  //       cursorWidth: cursorWidth,
  //       cursorHeight: cursorHeight,
  //       cursorRadius: cursorRadius,
  //       cursorColor: cursorColor,
  //       selectionHeightStyle: selectionHeightStyle,
  //       selectionWidthStyle: selectionWidthStyle,
  //       keyboardAppearance: keyboardAppearance,
  //       scrollPadding: scrollPadding,
  //       dragStartBehavior: dragStartBehavior,
  //       enableInteractiveSelection: enableInteractiveSelection,
  //       selectionControls: selectionControls,
  //       onTap: onTap,
  //       scrollController: scrollController,
  //       scrollPhysics: scrollPhysics,
  //       autofillHints: autofillHints,
  //       restorationId: restorationId,
  //       enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
  //     );

  @override
  _WDFWtextState createState() => _WDFWtextState();
}

class _WDFWtextState extends FormFieldState<String> {
  @override
  WDFWtext get widget => super.widget as WDFWtext;

  @override
  Widget build(BuildContext context) {
    if (widget.label.isEmpty && widget.placeholder.isNotEmpty == true) {
      widget.label = widget.placeholder;
    } else if (widget.label.isNotEmpty && widget.placeholder.isEmpty) {
      widget.placeholder = widget.label;
    }
    if (Platform.isIOS) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (widget.label.isNotEmpty)
              ? Text(
                  widget.label,
                  style: Theme.of(context).textTheme.headline5,
                )
              : Row(),
          const SizedBox(height: 5),
          CupertinoFormRow(
            child: CupertinoTextField(
              controller: widget.controller,
              focusNode: widget.focusNode,
              decoration: widget.decoration ??
                  BoxDecoration(
                    color: Theme.of(context).canvasColor,
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
                  ),
              padding: widget.padding,
              placeholder: widget.placeholder,
              placeholderStyle: widget.placeholderStyle,
              prefix: widget.prefix,
              prefixMode: widget.prefixMode,
              suffix: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: widget.suffix),
              suffixMode: widget.suffixMode,
              clearButtonMode: widget.clearButtonMode,
              keyboardType: widget.keyboardType,
              textInputAction: widget.textInputAction,
              textCapitalization: widget.textCapitalization,
              style: widget.style,
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
              maxLengthEnforcement: widget.maxLengthEnforcement,
              onChanged: widget.onChanged,
              onEditingComplete: widget.onEditingComplete,
              onSubmitted: widget.onSubmitted,
              inputFormatters: widget.inputFormatters,
              enabled: widget.enabled,
              cursorWidth: widget.cursorWidth,
              cursorHeight: widget.cursorHeight,
              cursorRadius: widget.cursorRadius,
              cursorColor: widget.cursorColor,
              selectionHeightStyle: widget.selectionHeightStyle,
              selectionWidthStyle: widget.selectionWidthStyle,
              keyboardAppearance: widget.keyboardAppearance,
              scrollPadding: widget.scrollPadding,
              dragStartBehavior: widget.dragStartBehavior,
              enableInteractiveSelection: widget.enableInteractiveSelection,
              selectionControls: widget.selectionControls,
              onTap: widget.onTap,
              scrollController: widget.scrollController,
              scrollPhysics: widget.scrollPhysics,
              autofillHints: widget.autofillHints,
              restorationId: restorationId,
              enableIMEPersonalizedLearning:
                  widget.enableIMEPersonalizedLearning,
            ),
          ),
        ],
      );
    } else {
      return Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 14, 8),
        child: TextFormField(
          controller: widget.controller,
          focusNode: widget.focusNode,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
              label: Text(widget.label),
              hintText: widget.placeholder,
              hintStyle: widget.placeholderStyle,
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColorDark,
                    style: BorderStyle.solid,
                    width: 2,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(4.0)))),
          validator: widget.validator,
          textInputAction: widget.textInputAction,
          textCapitalization: widget.textCapitalization,
          style: widget.style,
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
          maxLengthEnforcement: widget.maxLengthEnforcement,
          onChanged: widget.onChanged,
          onEditingComplete: widget.onEditingComplete,
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
          onTap: widget.onTap,
          scrollController: widget.scrollController,
          scrollPhysics: widget.scrollPhysics,
          autofillHints: widget.autofillHints,
          restorationId: restorationId,
          enableIMEPersonalizedLearning: widget.enableIMEPersonalizedLearning,
        ),
      );
    }
  }
}
