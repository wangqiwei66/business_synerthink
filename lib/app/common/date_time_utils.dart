import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:intl/intl.dart';

class DateTimeUtils {
  /// The default format is 'yyyy-MM-dd HH:mm'
  static String format(DateTime? time, {String format = 'yyyy-MM-dd HH:mm'}) {
    if (time == null) {
      return '';
    }
    return DateFormat(format).format(time);
  }

  /// The format is 'yyyy-MM-dd HH:mm:ss'
  static String formatYYYYMMDDHHMMSS(DateTime time) =>
      format(time, format: 'yyyy-MM-dd HH:mm:ss');

  static String formatYYYYMMDD(DateTime? time) =>
      format(time, format: 'yyyy-MM-dd');

  static String formatYMD0(DateTime time) =>
      format(time, format: 'yyyy-MM-dd 00:00:00');

  /// Convert string format (default is 'yyyy-MM-dd HH:mm:ss') time to [DateTime]
  static DateTime str2DateTime(String time,
      {String format = 'yyyy-MM-dd HH:mm', utc = false}) {
    return DateFormat(format).parse(time, utc);
  }

  static String str2str(
    String time, {
    String format = 'yyyy-MM-dd',
    toForMat = 'dd-MM-yyyy',
    utc = false,
  }) {
    if (time == '') {
      return '';
    }
    DateTime t = DateFormat(format).parse(time, utc);

    return DateFormat(toForMat).format(t);
  }

  ///傳入時間戳，addMinutes +分鐘
  static String getTimeStrWithTimestamp(int timestamp,
      {int addSecond = 0, String format = 'MM-dd HH點', utc = false}) {
    int tamp = (timestamp + addSecond) * 1000;
    // DateTime time = DateTime.fromMicrosecondsSinceEpoch(tamp);

    DateTime time = DateTime.fromMillisecondsSinceEpoch(tamp, isUtc: utc);
    return DateFormat(format).format(time);
  }

  ///傳入時間戳，addMinutes +分鐘
  static String getTimeStrWithTimestampMill(int timestamp,
      {int addSecond = 0, String format = 'MM-dd HH點', utc = false}) {
    // DateTime time = DateTime.fromMicrosecondsSinceEpoch(tamp);

    DateTime time = DateTime.fromMillisecondsSinceEpoch(timestamp, isUtc: utc);
    return DateFormat(format).format(time);
  }

  ///傳入時間字符串，返回當前時間是否大於等於傳入時間
  static bool getTimeWithNowTime(String? timeStr,
      {String format = 'yyyy-MM-dd'}) {
    if (timeStr == null) {
      return false;
    }
    return DateTime.now().microsecondsSinceEpoch >=
        DateFormat(format).parse(timeStr).microsecondsSinceEpoch;
  }

  ///傳入時間字符串，返回當前時間是否大於傳入時間
  static bool getTimeAWithNowTime(String? timeStr,
      {String format = 'yyyy-MM-dd'}) {
    if (timeStr == null) {
      return false;
    }
    return DateTime.now().microsecondsSinceEpoch >
        DateFormat(format).parse(timeStr).microsecondsSinceEpoch;
  }

  static getBirthDay(String timeStr) {
    if (timeStr.isEmpty) return '';
    DateTime brt = DateTimeUtils.str2DateTime(timeStr, format: 'yyyy-MM-dd');
    int age = 0;
    int month = 0;
    DateTime dateTime = DateTime.now();
    // if (dateTime.isAfter(brt)) {
    //   return '';
    // }

    // DateTime caTime = DateTime.fromMillisecondsSinceEpoch(dateTime.difference(brt).inMilliseconds);
    // return '${caTime.year}年${caTime.month}月${caTime.month}日';

    int yearNow = dateTime.year; //當前年份
    int monthNow = dateTime.month; //當前月份
    int dayOfMonthNow = dateTime.day; //當前日期

    int yearBirth = brt.year;
    int monthBirth = brt.month;
    int dayOfMonthBirth = brt.day;
    age = yearNow - yearBirth; //計算整歲數

    if (monthNow <= monthBirth) {
      if (monthNow == monthBirth) {
        if (dayOfMonthNow < dayOfMonthBirth) {
          age--; //當前日期在生日之前，年齡減一

          return '$age${'歲'.tr}11${'個月'.tr}';
        } else {
          return '$age${'歲'.tr}';
        }
      } else {
        age--; //當前月份在生日之前，年齡減一
        month = 12 - monthBirth + monthNow;
        return '$age${'歲'.tr}$month${'個月'.tr}';
      }
    } else {
      month = monthNow - monthBirth;
      return '$age${'歲'.tr}$month${'個月'.tr}';
    }
  }

  //去秒
  static String deleteSs(String dateStr) {
    DateTime date = DateFormat('yyyy-MM-dd HH:mm:ss').parse(dateStr);

    return DateFormat('yyyy-MM-dd HH:mm').format(date);
  }

  //去秒
  static String deleteSsHMS(String dateStr) {
    DateTime date = DateFormat('HH:mm:ss').parse(dateStr);

    return DateFormat('HH:mm').format(date);
  }

  static DateTime nextOrAddDay(DateTime m, bool isAdd) {
    int a = 0;
    a = isAdd
        ? m.millisecondsSinceEpoch + 24 * 60 * 60 * 1000
        : m.millisecondsSinceEpoch - 24 * 60 * 60 * 1000;
    DateTime b = DateTime.fromMillisecondsSinceEpoch(a);

    return b;
  }

  static DateTime getMonthFirstDay() {
    DateTime now = DateTime.now();

    return DateTime(now.year, now.month, 1);
  }

  static DateTime getMonthLastDay() {
    DateTime now = DateTime.now();
    var dateTime =
        DateTime.fromMillisecondsSinceEpoch(now.millisecondsSinceEpoch);
    //通過DateTime獲取當月的下個月第一天。
    DateTime dateNextMonthDate = DateTime(dateTime.year, dateTime.month + 1, 1);
    //下一個月的第一天時間戳減去一天的時間戳就是當前月的最後一天的時間戳
    int nextTimeSamp =
        dateNextMonthDate.millisecondsSinceEpoch - 24 * 60 * 60 * 1000;
    //取得了下一個月1號碼時間戳
    var dateTimeeee = DateTime.fromMillisecondsSinceEpoch(nextTimeSamp);

    return DateTime(now.year, now.month, dateTimeeee.day);
  }

  // int WEEK_DAY = DateTime.thursday;

  static String getWeek(DateTime dateTime) {
    ///當前選中時間 周幾
    var currentWeekDay = dateTime.weekday;

    ///週四
    int weekday = DateTime.thursday;

    DateTime epoch = DateTime.utc(dateTime.year);

    int offset = weekday - currentWeekDay;

    int delta = -offset;

    int week = (dateTime.difference(epoch).inDays - delta) ~/ 7 + 1;
    return (week < 10) ? "0$week" : "$week";
  }

  static String intToStr(int v) {
    return (v < 10) ? "0$v" : "$v";
  }

  static const num oneMinute = 60000;
  static const num oneHour = 3600000;
  static const num oneDay = 86400000;
  static const num oneWeek = 604800000;

  static const String oneSecoudAgo = "s";

  ///
  static const String oneMinuteAgo = "m";

  //小時
  static const String oneHourAgo = "h"; //
  static const String oneDayAgo = " day ago";
  static const String oneMonthAgo = " month ago";
  static const String oneYearAgo = " year ago";
// /距離現在多少多久
  static String getNowTiemformat(DateTime date) {
    num delta =
        DateTime.now().millisecondsSinceEpoch - date.millisecondsSinceEpoch;
    if (delta < 1 * oneMinute) {
      num seconds = toSeconds(delta);
      return (seconds <= 0 ? 1 : seconds).toInt().toString() + oneSecoudAgo;
    }
    if (delta < 45 * oneMinute) {
      num minutes = toMinutes(delta);
      return (minutes <= 0 ? 1 : minutes).toInt().toString() + oneMinuteAgo;
    }
    if (delta < 24 * oneHour) {
      num hours = toHours(delta);
      return (hours <= 0 ? 1 : hours).toInt().toString() + oneHourAgo;
    }
    // if (delta < 48 * ONE_HOUR) {
    //   return "";
    // }
    if (delta < 30 * oneDay) {
      num days = toDays(delta);
      return (days <= 0 ? 1 : days).toInt().toString() + oneDayAgo;
    }
    if (delta < 12 * 4 * oneWeek) {
      num months = toMonths(delta);
      return (months <= 0 ? 1 : months).toInt().toString() + oneMonthAgo;
    } else {
      num years = toYears(delta);
      return (years <= 0 ? 1 : years).toInt().toString() + oneYearAgo;
    }
  }

  static num toSeconds(num date) {
    return date / 1000;
  }

  static num toMinutes(num date) {
    return toSeconds(date) / 60;
  }

  static num toHours(num date) {
    return toMinutes(date) / 60;
  }

  static num toDays(num date) {
    return toHours(date) / 24;
  }

  static num toMonths(num date) {
    return toDays(date) / 30;
  }

  static num toYears(num date) {
    return toMonths(date) / 365;
  }
}
