import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WDFWbutton extends StatefulWidget {
  const WDFWbutton({
    Key? key,
    required this.label,
    this.padding = const EdgeInsets.symmetric(vertical: 12, horizontal: 36),
    this.color,
    this.disabledColor = CupertinoColors.quaternarySystemFill,
    this.onPressed,
    this.minSize = 44.0,
    this.pressedOpacity = 0.4,
    this.borderRadius = const BorderRadius.all(Radius.circular(4)),
    this.alignment = Alignment.center,
    required this.isIOS,
  }) : super(key: key);

  final String label;

  final EdgeInsetsGeometry? padding;

  final Color? color;

  final Color disabledColor;

  final VoidCallback? onPressed;

  final double? minSize;

  final double? pressedOpacity;

  final BorderRadius? borderRadius;

  final AlignmentGeometry alignment;

  final bool isIOS;

  bool get enabled => onPressed != null;

  @override
  _WDFWbuttonState createState() => _WDFWbuttonState();
}

class _WDFWbuttonState extends State<WDFWbutton> {
  _WDFWbuttonState() : super();

  @override
  Widget build(BuildContext context) => widget.isIOS
      ? CupertinoButton.filled(
          child: Text(
            widget.label,
            style: GoogleFonts.getFont(
              'Montserrat Alternates',
              textStyle: TextStyle(
                  fontSize: 22,
                  color: Theme.of(context).colorScheme.onSecondary,
                  inherit: false),
            ),
            softWrap: false,
          ),
          padding: widget.padding,
          disabledColor: widget.disabledColor,
          onPressed: widget.onPressed,
          minSize: widget.minSize,
          pressedOpacity: widget.pressedOpacity,
          borderRadius: widget.borderRadius,
          alignment: widget.alignment,
        )
      : ElevatedButton(
          onPressed: widget.onPressed,
          child: Text(
            widget.label,
            style: GoogleFonts.getFont(
              'Montserrat Alternates',
              textStyle: TextStyle(
                  fontSize: 22,
                  color: Theme.of(context).colorScheme.onSecondary,
                  inherit: false),
            ),
            softWrap: false,
          ),
          style: ElevatedButton.styleFrom(
            padding: widget.padding,
            minimumSize: Size(widget.minSize ?? 0.0, widget.minSize ?? 0.0),
            alignment: widget.alignment,
          ),
        );
}
