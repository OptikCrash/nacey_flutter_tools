import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WDFWslider extends StatefulWidget {
  const WDFWslider({
    Key? key,
    this.label = '',
    required this.children,
    this.groupValue,
    required this.onValueChanged,
    this.padding = const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
  }) : super(key: key);
  final String label;
  final Map<dynamic, String> children;
  final dynamic groupValue;
  final ValueChanged onValueChanged;
  final EdgeInsetsGeometry padding;
  final double gapPadding = 4.0;
  @override
  _WDFWsliderState createState() => _WDFWsliderState();
}

class _WDFWsliderState<T> extends State<WDFWslider> {
  @override
  Widget build(BuildContext context) => Padding(
        padding: widget.padding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              widget.label,
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(height: 5),
            _ThemedSlider<T>(
              groupValue: widget.groupValue,
              children: _children(context),
              onValueChanged: widget.onValueChanged,
            )
          ],
        ),
      );

  Map<T, Widget> _children(BuildContext context) {
    Map<T, Widget> result = {};
    widget.children.forEach((key, value) => result[key] = Padding(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 0),
          child: Text(
            value,
            style: GoogleFonts.getFont('Montserrat Alternates',
                textStyle: TextStyle(
                    fontSize: 24,
                    color: Theme.of(context).colorScheme.onPrimary,
                    inherit: false)),
          ),
        ));
    return result;
  }
}

class _ThemedSlider<T> extends CupertinoSlidingSegmentedControl {
  _ThemedSlider({
    Key? key,
    required children,
    required onValueChanged,
    groupValue,
  }) : super(
          key: key,
          children: children,
          onValueChanged: onValueChanged,
          groupValue: groupValue,
        );

  @override
  State<CupertinoSlidingSegmentedControl> createState() => _ThemedSliderState();
}

class _ThemedSliderState extends State<CupertinoSlidingSegmentedControl> {
  @override
  Widget build(BuildContext context) => Container(
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
        ),
        child: CupertinoSlidingSegmentedControl(
          key: widget.key,
          children: widget.children,
          onValueChanged: widget.onValueChanged,
          groupValue: widget.groupValue,
          thumbColor: Theme.of(context).sliderTheme.thumbColor!,
          padding: const EdgeInsets.all(3),
          backgroundColor: CupertinoDynamicColor(
            debugLabel: 'tertiarySystemFill',
            color: Theme.of(context).canvasColor,
            darkColor: Theme.of(context).canvasColor,
            highContrastColor: Theme.of(context).canvasColor,
            darkHighContrastColor: Theme.of(context).canvasColor,
            elevatedColor: Theme.of(context).canvasColor,
            darkElevatedColor: Theme.of(context).canvasColor,
            highContrastElevatedColor: Theme.of(context).canvasColor,
            darkHighContrastElevatedColor: Theme.of(context).canvasColor,
          ),
        ),
      );
}
