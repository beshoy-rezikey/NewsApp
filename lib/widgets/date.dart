import 'package:intl/intl.dart';

String date(String date) {
  var inputFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
  var inputDate = inputFormat.parse(date); // <-- dd/MM 24H format

  var outputFormat = DateFormat('dd/MM/yyyy HH:mm a');
  var outputDate = outputFormat.format(inputDate);
  return outputDate;
}
