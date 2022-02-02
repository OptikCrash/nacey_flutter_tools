import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui show BoxHeightStyle, BoxWidthStyle;

import 'package:flutter/services.dart';

class NTextField extends StatefulWidget {
  NTextField({
    Key? key,
    this.controller,
    this.initialValue,
    this.focusNode,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.style,
    this.strutStyle,
    this.textDirection,
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
    //////////////////////////////////////////////
    // String? placeholder,
    // TextStyle? placeholderStyle = const TextStyle(
    //   fontWeight: FontWeight.w400,
    //   color: CupertinoColors.placeholderText,
    // ),
    /////////////////////////////////////////////////
    this.icon,
    this.iconColor,
    this.prefixIcon,
    this.prefixIconConstraints,
    this.prefix,
    this.prefixText,
    this.prefixStyle,
    this.prefixIconColor,
    this.label,
    this.labelText,
    this.labelStyle,
    this.floatingLabelStyle,

    /// label text will default replace the label.
    this.hintText, //placeholder
    this.hintStyle = const TextStyle(
      fontWeight: FontWeight.w400,
      color: CupertinoColors.placeholderText,
    ), //
    TextDirection? hintTextDirection, //null
    this.hintMaxLines,

    /// hint will take placeholder spot
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
  })  : assert(!(label != null && labelText != null),
            'Declaring both label and labelText is not supported.'),
        assert(!(prefix != null && prefixText != null),
            'Declaring both prefix and prefixText is not supported.'),
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
        super(key: key);

  final TextEditingController? controller;
  final String? initialValue;
  FocusNode? focusNode;
  TextInputType? keyboardType;
  TextCapitalization textCapitalization;
  TextInputAction? textInputAction;
  TextStyle? style;
  StrutStyle? strutStyle;
  TextDirection? textDirection;
  TextAlign textAlign;
  TextAlignVertical? textAlignVertical;
  bool autofocus;
  bool readOnly;
  ToolbarOptions? toolbarOptions;
  bool? showCursor;
  String obscuringCharacter;
  bool obscureText;
  bool autocorrect;
  SmartDashesType? smartDashesType;
  SmartQuotesType? smartQuotesType;
  bool enableSuggestions;
  MaxLengthEnforcement? maxLengthEnforcement;
  int? maxLines;
  int? minLines;
  bool expands;
  int? maxLength;
  ValueChanged<String>? onChanged;
  GestureTapCallback? onTap;
  VoidCallback? onEditingComplete;
  ValueChanged<String>? onFieldSubmitted;
  FormFieldSetter<String>? onSaved;
  FormFieldValidator<String>? validator;
  List<TextInputFormatter>? inputFormatters;
  bool enabled;
  double cursorWidth;
  double? cursorHeight;
  Radius cursorRadius;
  Color? cursorColor;
  Brightness? keyboardAppearance;
  EdgeInsets scrollPadding;
  bool enableInteractiveSelection;
  TextSelectionControls? selectionControls;
  InputCounterWidgetBuilder? buildCounter;
  ScrollPhysics? scrollPhysics;
  Iterable<String>? autofillHints;
  AutovalidateMode autovalidateMode;
  ScrollController? scrollController;
  String? restorationId;
  bool enableIMEPersonalizedLearning;
  //region decoration
  Widget? icon;
  Color? iconColor;
  Widget? prefixIcon;
  BoxConstraints? prefixIconConstraints;
  Widget? prefix;
  String? prefixText;
  TextStyle? prefixStyle;
  Color? prefixIconColor;
  Widget? label;
  String? labelText;
  TextStyle? labelStyle;
  TextStyle? floatingLabelStyle;
  String? hintText;
  TextStyle? hintStyle;
  TextDirection? hintTextDirection;
  int? hintMaxLines;
  String? helperText;
  TextStyle? helperStyle;
  int? helperMaxLines;
  String? errorText;
  TextStyle? errorStyle;
  int? errorMaxLines;
  FloatingLabelBehavior? floatingLabelBehavior;
  bool? isDense;
  EdgeInsetsGeometry? contentPadding;
  bool isCollapsed;
  Widget? suffixIcon;
  Widget? suffix;
  String? suffixText;
  TextStyle? suffixStyle;
  Color? suffixIconColor;
  BoxConstraints? suffixIconConstraints;
  String? counterText;
  Widget? counter;
  TextStyle? counterStyle;
  bool? filled;
  Color? fillColor;
  Color? focusColor;
  Color? hoverColor;
  InputBorder? errorBorder;
  InputBorder? focusedBorder;
  InputBorder? focusedErrorBorder;
  InputBorder? disabledBorder;
  InputBorder? enabledBorder;
  InputBorder? border;
  String? semanticCounterText;
  bool? alignLabelWithHint;
  BoxConstraints? constraints;
  //endregion

  @override
  _NTextFieldState createState() => _NTextFieldState();
}

class _NTextFieldState extends State<NTextField> {
  @override
  Widget build(BuildContext context) {
    InputDecoration decoration = InputDecoration(
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
      prefixText: widget.prefixText,
      prefixStyle: widget.prefixStyle,
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

    return Platform.isIOS
        ? CupertinoFormRow(
            prefix: widget.icon,
            child: CupertinoTextField(
              controller: widget.controller,
              focusNode: widget.focusNode,
              placeholder: widget.hintText,
              placeholderStyle: widget.hintStyle,
              prefix: widget.prefix,
              suffix: widget.suffix,
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
              onSubmitted: widget.onSaved,
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
              restorationId: widget.restorationId,
              enableIMEPersonalizedLearning:
                  widget.enableIMEPersonalizedLearning,
            ),
            helper: Row(
              children: [
                if (widget.helperText?.isNotEmpty == true)
                  Text(widget.helperText!,
                      style: widget.helperStyle,
                      maxLines: widget.helperMaxLines),
                Expanded(child: Container()),
                if (widget.counterText?.isNotEmpty == true)
                  Text(widget.counterText!, style: widget.counterStyle)
              ],
            ),
            error: (widget.errorText?.isNotEmpty == true)
                ? Text(widget.errorText!,
                    style: widget.errorStyle, maxLines: widget.errorMaxLines)
                : null,
          )
        : TextFormField(
            key: widget.key,
            controller: widget.controller,
            initialValue: widget.initialValue,
            focusNode: widget.focusNode,
            decoration: decoration,
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
            enableIMEPersonalizedLearning: widget.enableIMEPersonalizedLearning,
          );
  }
}
