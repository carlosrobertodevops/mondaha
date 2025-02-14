// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import "package:community_testing_ryusdv/backend/schema/structs/index.dart"
    as community_testing_ryusdv_data_schema;
import "package:community_testing_ryusdv/backend/schema/enums/enums.dart"
    as community_testing_ryusdv_enums;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/custom_code/widgets/index.dart';
import '/flutter_flow/custom_functions.dart';

class DateRangePicker extends StatefulWidget {
  const DateRangePicker({
    Key? key,
    this.width,
    this.height,
    this.initialStartDate,
    this.initialEndDate,
    this.buttonTextColor,
    this.buttonBackgroundColor,
    this.buttonOutlineColor,
    this.buttonOutlineWidth,
    this.pickerDialogWidth,
    this.pickerDialogHeight,
    this.minAllowableDateUnixMs,
    this.maxAllowableDateUnixMs,
    required this.onDateRangePicked,
    this.buttonHintText,
    this.buttonCornerRadius,
    this.pickerBackgroundColor,
    this.pickerHeaderColor,
    this.pickerSelectedDateColor,
    this.pickerCurrentDateColor,
    this.pickerDialogPadding,
    this.buttonElevation,
  }) : super(key: key);

  final double? width;
  final double? height;
  final DateTime? initialStartDate;
  final DateTime? initialEndDate;
  final Color? buttonTextColor;
  final Color? buttonBackgroundColor;
  final Color? buttonOutlineColor;
  final double? buttonOutlineWidth;
  final double? pickerDialogWidth;
  final double? pickerDialogHeight;
  final int? minAllowableDateUnixMs;
  final int? maxAllowableDateUnixMs;
  final Future Function(DateTime? startDateSelected, DateTime? endDateSelected)
      onDateRangePicked;
  final String? buttonHintText;
  final double? buttonCornerRadius;
  final Color? pickerBackgroundColor;
  final Color? pickerHeaderColor;
  final Color? pickerSelectedDateColor;
  final Color? pickerCurrentDateColor;
  final double? pickerDialogPadding;
  final double? buttonElevation;

  @override
  _DateRangePickerState createState() => _DateRangePickerState();
}

class _DateRangePickerState extends State<DateRangePicker> {
  DateTimeRange? selectedDateRange;
  late DateTime defaultFirstDate;
  late DateTime defaultLastDate;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    defaultFirstDate = DateTime(now.year - 2, now.month, now.day);
    defaultLastDate = DateTime(now.year + 2, now.month, now.day);

    if (widget.initialStartDate != null && widget.initialEndDate != null) {
      selectedDateRange = DateTimeRange(
        start: widget.initialStartDate!,
        end: widget.initialEndDate!
            .add(Duration(hours: 23, minutes: 59, seconds: 59)),
      );
    }
  }

  void showCustomDateRangePicker() async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: widget.minAllowableDateUnixMs != null
          ? DateTime.fromMillisecondsSinceEpoch(widget.minAllowableDateUnixMs!)
          : defaultFirstDate,
      lastDate: widget.maxAllowableDateUnixMs != null
          ? DateTime.fromMillisecondsSinceEpoch(widget.maxAllowableDateUnixMs!)
          : defaultLastDate,
      initialDateRange: selectedDateRange,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: widget.pickerSelectedDateColor ??
                  Theme.of(context).primaryColor,
              onPrimary: Colors.white,
              surface: widget.pickerBackgroundColor ?? Colors.white,
              onSurface: Colors.black,
            ),
            appBarTheme: AppBarTheme(
              backgroundColor: widget.pickerHeaderColor,
              foregroundColor: Colors.white,
            ),
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: widget.pickerDialogWidth ?? 400.0,
                maxHeight: widget.pickerDialogHeight ??
                    MediaQuery.of(context).size.height * 0.8,
              ),
              child: Padding(
                padding: EdgeInsets.all(widget.pickerDialogPadding ?? 0.0),
                child: child!,
              ),
            ),
          ),
        );
      },
    );
    if (picked != null) {
      final adjustedEndDate = DateTime(
          picked.end.year, picked.end.month, picked.end.day, 23, 59, 59);
      setState(() {
        selectedDateRange =
            DateTimeRange(start: picked.start, end: adjustedEndDate);
      });
      await widget.onDateRangePicked(picked.start, adjustedEndDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? 50.0,
      child: ElevatedButton(
        onPressed: showCustomDateRangePicker,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: selectedDateRange != null
              ? Text(
                  '${DateFormat('yyyy-MM-dd').format(selectedDateRange!.start)} to ${DateFormat('yyyy-MM-dd').format(selectedDateRange!.end)}',
                  style: TextStyle(
                    color: widget.buttonTextColor ??
                        FlutterFlowTheme.of(context).primaryText,
                  ),
                )
              : Text(
                  widget.buttonHintText ?? 'Select Date Range',
                  style: TextStyle(
                    color: widget.buttonTextColor ??
                        FlutterFlowTheme.of(context).primaryText,
                  ),
                ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.buttonBackgroundColor ??
              FlutterFlowTheme.of(context).secondaryBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.buttonCornerRadius ?? 0),
            side: BorderSide(
              color: widget.buttonOutlineColor ?? Colors.transparent,
              width: widget.buttonOutlineWidth ?? 0,
            ),
          ),
          elevation: widget.buttonElevation ?? 1.0,
        ),
      ),
    );
  }
}
