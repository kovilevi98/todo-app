import 'dart:io';

import 'package:csv/csv.dart';
import 'package:intl/intl.dart';
import 'package:localization/localization.dart';
import 'package:path_provider/path_provider.dart';
import 'package:random_string/random_string.dart';
import 'package:todo_app/models/board.dart';
import 'package:todo_app/services/firestore_service.dart';

class CsvExportService {
  generateCsv(BoardData board) async {
   try{
     List<List<String>> data = [
       ["UUID", "COLUMN_NAME", "TITLE", "TIME"],
     ];
     board.data!.forEach((element) {
       element.items!.forEach((element2) {
         data.add([
           element2.uuid,
           element.title!,
           element2.title!,
           element2.currentTimeSpent.toString(),
         ]);
       });
     });

     String csvData = ListToCsvConverter().convert(data);
     final String directory = (await getExternalStorageDirectory())!.path;
     final path = "$directory/csv-${DateTime.now()}.csv";

     final File file = File(path);
     await file.writeAsString(csvData);

     return "success_export".i18n() + path;
   } catch(e) {
     return "error_export".i18n();
   }
  }
}
