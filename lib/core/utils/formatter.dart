class Formatter {
  static String formatDate(String date) {
    try {
      final parsedDate = DateTime.parse(date);
      return '${parsedDate.day.toString().padLeft(2, '0')}/'
          '${parsedDate.month.toString().padLeft(2, '0')}/'
          '${parsedDate.year}';
    } catch (_) {
      return date;
    }
  }

  static String formatPhone(String phone) {
    return '+${phone.substring(0, 2)} (${phone.substring(2, 4)}) ${phone.substring(4, 5)} ${phone.substring(5, 9)}-${phone.substring(9)}';
  }
}
