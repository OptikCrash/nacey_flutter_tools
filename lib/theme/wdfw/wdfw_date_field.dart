import 'dart:async';
import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nacey_flutter_tools/theme/wdfw/wdfw_text_field.dart';

class DateField extends StatelessWidget {
  DateField(
      {Key? key,
      this.initialValue,
      this.startDate,
      this.endDate,
      this.label = '',
      this.suffixIcon,
      this.onCallback,
      required this.textEditingController})
      : super(key: key) {
    initialValue = initialValue ?? DateTime.now();
    startDate = DateTime(
        initialValue!.year - 1, initialValue!.month, initialValue!.day);
    endDate = DateTime(
        initialValue!.year + 1, initialValue!.month, initialValue!.day);
  }
  late DateTime? initialValue;
  late DateTime? startDate;
  late DateTime? endDate;
  final String label;
  final Icon? suffixIcon;
  final Function(DateTime)? onCallback;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    final _DateBloc dateBloc = _DateBloc(
      initialValue: initialValue!,
      startDate: startDate,
      endDate: endDate,
    );
    return StreamBuilder(
      stream: dateBloc.stream,
      initialData: initialValue,
      builder: (context, snapshot) {
        // textEditingController.text =
        //     (snapshot.data as DateTime).toHumanReadableDate;
        return (Platform.isIOS)
            ? CupertinoFormRow(
                child: FormField(
                  builder: (FormFieldState<String> state) => WDFWtext(
                    controller: textEditingController,
                    readOnly: true,
                    suffix: suffixIcon,
                    placeholder: label,
                    onTap: () => _buildIosDatePicker(
                        context, dateBloc, textEditingController),
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 14, 8),
                child: TextFormField(
                  controller: textEditingController,
                  readOnly: true,
                  onTap: () => _buildMaterialDatePicker(context, dateBloc),
                  decoration: InputDecoration(
                      label: Text(label),
                      suffixIcon: suffixIcon,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColorDark,
                          style: BorderStyle.solid,
                          width: 2,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4.0)),
                      )),
                ),
              );
      },
    );
  }

  _buildMaterialDatePicker(BuildContext context, _DateBloc dateBloc) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      helpText: 'Select Trip Date',
      initialDate: initialValue!,
      firstDate: startDate!,
      lastDate: endDate!,
    );
    if (picked != null && picked != initialValue!) {
      dateBloc.setDate(picked);
      (picked) => onCallback;
    }
  }

  _buildIosDatePicker(BuildContext context, _DateBloc dateBloc,
      TextEditingController controller) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return Container(
              height: 475,
              color: Theme.of(context).canvasColor,
              child: Column(
                children: [
                  SizedBox(
                    height: 400,
                    child: CupertinoDatePicker(
                      backgroundColor: Theme.of(context).canvasColor,
                      mode: CupertinoDatePickerMode.date,
                      onDateTimeChanged: (DateTime? picked) {
                        if (picked != null && picked != initialValue) {
                          Function(DateTime)? fun = onCallback;
                          dateBloc.setDate(picked);
                          // controller.text = picked.toHumanReadableDate;
                          if (fun != null) {
                            fun(picked);
                          }
                        }
                      },
                      initialDateTime: initialValue,
                      minimumDate: startDate!,
                      maximumDate: endDate!,
                    ),
                  ),
                  CupertinoButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                  ),
                ],
              ));
        });
  }
}

class _DateBloc {
  final _stateStreamController = StreamController<DateTime>.broadcast();

  StreamSink<DateTime> get _dateSink => _stateStreamController.sink;
  Stream<DateTime> get _dateStream => _stateStreamController.stream;
  Stream<DateTime> get stream => _dateStream;

  _DateBloc({
    required DateTime initialValue,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    _dateStream.listen((value) {});
  }
  setDate(value) {
    _dateSink.add(value);
  }
}
