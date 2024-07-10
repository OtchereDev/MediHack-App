import 'package:emergency_alert/AppTheme/app_config.dart';
import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

class DatePickerUtil {
  static pickDateRange(context,
      {String? title,
      Function(DateTime datePicked)? onDatePicked,
      DateTime? lastDate,
      DateTime? firstDate}) async {
    var date = await showDateRangePicker(
      context: context,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.PRIMARYCOLOR,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
      helpText: 'Choose Date Range',
      firstDate: firstDate ?? DateTime.now().add(const Duration(days: 1)),
      lastDate: lastDate ?? DateTime.now().add(const Duration(days: 14)),
    );
    // date = Date;
    return date;
  }

  static pickDate(
    context, {
    String? title,
    DateTime? lastDate,
  }) {
    var date = showDatePicker(
        context: context,
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: AppColors.PRIMARYCOLOR,
                onPrimary: Colors.white,
                onSurface: Colors.black,
                background: AppColors.WHITE,

              ),
            ),
            child: child!,
          );
        },
        helpText: title ?? 'Choose Date of Birth',
        initialDate: DateTime.now(),
        firstDate: DateTime(1900, 1),
        lastDate: DateTime(2101));
    return date;
  }

  static pickTime(context, title) async {
    TimeOfDay? timePicked = await showTimePicker(
      context: context,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.PRIMARYCOLOR,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
      helpText: title ?? 'Choose Trip Date',
      initialTime: TimeOfDay(
          hour: TimeOfDay.now().hour,
          minute: (TimeOfDay.now().minute - TimeOfDay.now().minute % 10 + 10)
              .toInt()),
    );
    return timePicked;
  }
}
