import 'package:intl/intl.dart';

class FormatUtils {

}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

extension FormatDate on DateTime? {
  String displayDate() {
    return DateFormat('dd/MM/yyyy').format(this ?? DateTime.now());
  }
}

extension DateToStringMessages on DateTime {
  String parseDataToStringMessages() {
    return DateFormat("dd/MM/yyyy - HH:mm").format(this);
  }
}

extension StringToDateMessages on String {
  DateTime parseStringToDateMessages() {
    String _date = this;
    DateFormat _format = DateFormat("EEE MMM dd HH:mm:ss yyyy");
    return _format.parse(_date);
  }
}