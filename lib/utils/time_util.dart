class TimeUtil {
  static String intervalTimeAsHour(int timestamp) {
    DateTime now = DateTime.now();
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    Duration diff = now.difference(date);
    return diff.inHours.toString();
  }
}
