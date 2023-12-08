import 'dart:core';

import 'package:flutter/material.dart';

class AppDateUtils {
  static String currentTimeStamp({bool includeNano = false}) {
    DateTime now = DateTime.now();

    if (includeNano) {
      return "${now.year}${now.month}${now.day}${now.hour}${now.minute}${now.second}${now.millisecondsSinceEpoch}${now.microsecondsSinceEpoch}";
    } else {
      return "${now.year}${now.month}${now.day}${now.hour}${now.minute}${now.second}";
    }
  }

  static String getCurrentDateTime({bool isYMD = true}) {
    return getCurrentDate(isYMD: isYMD) + " " + getCurrentTime();
  }

  static String getCurrentDate({bool isYMD = true, DateTime? now = null}) {
    if (now == null) {
      now = DateTime.now();
    }
    return isYMD
        ? "${now.year}-${now.month > 9 ? now.month : "0${now.month}"}-${now.day > 9 ? now.day : "0${now.day}"}"
        : "${now.day > 9 ? now.day : "0${now.day}"}-${now.month > 9 ? now.month : "0${now.month}"}-${now.year}";
  }

  static String getCurrentTime({DateTime? now = null}) {
    if (now == null) {
      now = DateTime.now();
    }

    return "${now.hour > 9 ? now.hour : "0${now.hour}"}:${now.minute > 9 ? now.minute : "0${now.minute}"}:${now.second > 9 ? now.second : "0${now.second}"}";
  }

  static String getCurrTimestamp({bool includeMillisecond = true}) {
    DateTime now = DateTime.now();
    return includeMillisecond
        ? "${now.day}${now.month}${now.year}${now.hour}${now.minute}${now.second}${now.millisecond}"
        : "${now.day}${now.month}${now.year}${now.hour}${now.minute}${now.second}";
  }

  static String getWeekDay(DateTime dateTime) => dateTime == null
      ? ""
      : <String>[
          "MONDAY",
          "TUESDAY",
          "WEDNESDAY",
          "THURSDAY",
          "FRIDAY",
          "SATURDAY",
          "SUNDAY"
        ][dateTime.weekday - 1];

  static String timeToString(TimeOfDay timeOfDay) {
    return timeOfDay == null
        ? "00:00"
        : "${timeOfDay.hour}:${timeOfDay.minute}";
  }

  static DateTime? getFormattedDateObj(String dmy, {bool isYMD = false}) {
    // only accept  yyyy/mm/dd or yyyy-mm-dd
    if ("$dmy".isEmpty || "$dmy" == "0000-00-00") {
      return null;
    } else {
      List<String> format = dmy.contains("/") ? dmy.split("/") : dmy.split("-");

      return isYMD
          ? DateTime(
              int.parse(format[0]), int.parse(format[1]), int.parse(format[2]))
          : DateTime(
              int.parse(format[2]), int.parse(format[1]), int.parse(format[0]));
    }
  }

  static String getFormattedDmyString(DateTime dateTime) =>
      dateTime == null ? "" : getDisplayDate(dateTime, isYMD: false);

  static String getDisplayDate(DateTime dateTime, {bool isYMD = true}) => isYMD
      ? "${dateTime.year}-${dateTime.month > 9 ? dateTime.month : "0${dateTime.month}"}-${dateTime.day > 9 ? dateTime.day : "0${dateTime.day}"}"
      : "${dateTime.day > 9 ? dateTime.day : "0${dateTime.day}"}-${dateTime.month > 9 ? dateTime.month : "0${dateTime.month}"}-${dateTime.year}";

  static String getFormattedDate({bool isYMD = true, DateTime? now = null}) {
    if (now == null) {
      now = DateTime.now();
    }
    return isYMD
        ? "${now.year}-${now.month > 9 ? now.month : "0${now.month}"}-${now.day > 9 ? now.day : "0${now.day}"}"
        : "${now.day > 9 ? now.day : "0${now.day}"}/${now.month > 9 ? now.month : "0${now.month}"}/${now.year}";
  }

  static String getFormattedDmyHSString(DateTime dateTime,
          {bool isYMD = false}) =>
      dateTime == null
          ? ""
          : getDisplayDate(dateTime, isYMD: isYMD) +
              " " +
              timeToString(
                  TimeOfDay(hour: dateTime.hour, minute: dateTime.minute));
}

class FinancialYear {
  DateTime startDate;
  DateTime endDate;

  FinancialYear(this.startDate, this.endDate);
}

enum DateTimeFormat { dmy, ymd, mdy }

enum DateSeparator { slash, dash, colon, dot }

extension DateSeparatorStr on DateSeparator {
  String get toStr {
    switch (this) {
      case DateSeparator.slash:
        return "/";
      case DateSeparator.dash:
        return "-";
      case DateSeparator.colon:
        return ":";
      case DateSeparator.dot:
        return ".";
      default:
        return "";
    }
  }
}

abstract class CboDateUtils {
  static Future<DateTime?> openDatePicker(
    BuildContext context, {
    required DateTime initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
  }) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate ?? DateTime(1940, 8),
      lastDate: lastDate ?? DateTime(2101),
    );
    return picked;
  }

  static DateTime get get00Date => DateTime(0000);

  static DateTime now({bool onlyDate = true}) {
    final now = DateTime.now();
    return onlyDate ? DateTime(now.year, now.month, now.day) : now;
  }

  static String nowStr({
    DateTimeFormat format = DateTimeFormat.dmy,
    DateSeparator separator = DateSeparator.slash,
  }) {
    return CboDateUtils.format(
      CboDateUtils.now(),
      format: format,
      separator: separator,
    );
  }

  static bool isSame(DateTime? date1, DateTime? date2) {
    if (date1 != null && date2 != null) {
      /*
     * Compares this DateTime object to other, returning zero if the values are equal.
Returns a negative value if this DateTime isBefore other. It returns 0 if it isAtSameMomentAs other, and returns a positive value otherwise (when this isAfter other)
     *
     * */

      final _d1 = DateTime(date1.year, date1.month, date1.day);
      final _d2 = DateTime(date2.year, date2.month, date2.day);
      return _d1.compareTo(_d2) == 0;
    } else {
      return false;
    }
  }

  static bool isBeforeFrom(
    DateTime date, {
    required DateTime today,
  }) {
    /*
     * Compares this DateTime object to other, returning zero if the values are equal.
Returns a negative value if this DateTime isBefore other. It returns 0 if it isAtSameMomentAs other, and returns a positive value otherwise (when this isAfter other)
     *
     * */
    final _d2 = DateTime(today.year, today.month, today.day);
    final _d1 = DateTime(date.year, date.month, date.day);
    return _d1.isBefore(_d2);
  }

  static bool isAfterFrom(DateTime date, {required DateTime today}) {
    /*
     * Compares this DateTime object to other, returning zero if the values are equal.
Returns a negative value if this DateTime isBefore other. It returns 0 if it isAtSameMomentAs other, and returns a positive value otherwise (when this isAfter other)
     *
     * */
    final _d2 = DateTime(today.year, today.month, today.day);
    final _d1 = DateTime(date.year, date.month, date.day);
    return _d1.isAfter(_d2);
  }

  static DateTime? toObject(
    String dateString, {
    DateTimeFormat format = DateTimeFormat.dmy,
  }) {
    try {
      if (dateString.isEmpty) {
        return null;
      }
      //dcr data case => month/day/year
      //non dcr date case => day/month/year
      //timeStamp case =>  "2021-04-30T00:00:00"

      bool isTimeStamp = dateString.contains("T");
      dateString = dateString.split("T").first;

      int _dayPos = 0;
      int _monthPos = 1;
      int _yearPos = 2;

      switch (format) {
        case DateTimeFormat.dmy:
          _dayPos = 0;
          _monthPos = 1;
          _yearPos = 2;
          break;
        case DateTimeFormat.ymd:
          _dayPos = 2;
          _monthPos = 1;
          _yearPos = 0;
          break;
        case DateTimeFormat.mdy:
          _dayPos = 1;
          _monthPos = 0;
          _yearPos = 2;
          break;
      }

      int _day, _month, _year;

      if (dateString.isNotEmpty && !isTimeStamp) {
        if (dateString.contains("/")) {
          List<String> _splitted = dateString.split("/");
          _year = int.parse(_splitted[_yearPos]);
          _month = int.parse(_splitted[_monthPos]);
          _day = int.parse(_splitted[_dayPos]);
        } else {
          //expected
          List<String> _splitted = dateString.split("-");
          _year = int.parse(_splitted[_yearPos]);
          _month = int.parse(_splitted[_monthPos]);
          _day = int.parse(_splitted[_dayPos]);
        }
        return DateTime(_year, _month, _day);
      } else if (isTimeStamp) {
        List<String> _splitted = dateString.split("-");
        _year = int.parse(_splitted[0]);
        _month = int.parse(_splitted[1]);
        _day = int.parse(_splitted[2]);
        return DateTime(_year, _month, _day);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  static String format(
    DateTime? now, {
    DateTimeFormat format = DateTimeFormat.dmy,
    DateSeparator separator = DateSeparator.slash,
    bool returnBlankIfNull = false,
  }) {
    if (now == null && returnBlankIfNull) {
      return "";
    } else {
      now ??= DateTime.now();
      final __year = now.year.toString();
      final __month = now.month.toString().padLeft(2, "0");
      final __day = now.day.toString().padLeft(2, "0");

      switch (format) {
        case DateTimeFormat.dmy:
          return "$__day${separator.toStr}$__month${separator.toStr}$__year";
        case DateTimeFormat.ymd:
          return "$__year${separator.toStr}$__month${separator.toStr}$__day";
        case DateTimeFormat.mdy:
          return "$__month${separator.toStr}$__day${separator.toStr}$__year";
      }
    }
  }

  static String formatWithTime(
    DateTime? now, {
    DateTimeFormat format = DateTimeFormat.dmy,
    DateSeparator separator = DateSeparator.slash,
    bool returnBlankIfNull = false,
  }) {
    if (now == null && returnBlankIfNull) {
      return "";
    } else {
      now ??= DateTime.now();
      final __year = now.year.toString();
      final __month = now.month.toString().padLeft(2, "0");
      final __day = now.day.toString().padLeft(2, "0");
      final __hour = now.hour.toString().padLeft(2, "0");
      final __minute = now.minute.toString().padLeft(2, "0");
      final __secoand = now.second.toString().padLeft(2, "0");

      switch (format) {
        case DateTimeFormat.dmy:
          return "$__day${separator.toStr}$__month${separator.toStr}$__year $__hour${DateSeparator.colon.toStr}$__minute${DateSeparator.colon.toStr}$__secoand";
        case DateTimeFormat.ymd:
          return "$__year${separator.toStr}$__month${separator.toStr}$__day";
        case DateTimeFormat.mdy:
          return "$__month${separator.toStr}$__day${separator.toStr}$__year";
      }
    }
  }

  static String currentTime24Format({
    DateTime? now,
    bool withSeconds = false,
    bool returnBlankOnNull = false,
    DateSeparator separator = DateSeparator.colon,
  }) {
    if (returnBlankOnNull && now == null) {
      return "";
    }

    now ??= DateTime.now();

    final _hours = now.hour.toString().padLeft(2, '0');
    final _minutes = now.minute.toString().padLeft(2, '0');
    final _sec = now.second.toString().padLeft(2, '0');

    String fTime = "";

    if (withSeconds) {
      fTime = "$_hours${separator.toStr}$_minutes${separator.toStr}$_sec";
    } else {
      fTime = "$_hours${separator.toStr}$_minutes";
    }
    return fTime;
  }

  static String getWeekDay(DateTime dateTime) => <String>[
        "MONDAY",
        "TUESDAY",
        "WEDNESDAY",
        "THURSDAY",
        "FRIDAY",
        "SATURDAY",
        "SUNDAY"
      ][dateTime.weekday - 1];

  static DateTime get getDefaultDate => DateTime(1900, 01, 01, 01, 01, 01);

  static DateTime getDateTime({DateTime? dateTime}) {
    dateTime ??= DateTime.now();
    return DateTime(
      dateTime.year,
      dateTime.month,
      dateTime.day,
      dateTime.hour,
      dateTime.minute,
      dateTime.second,
    );
  }
}
