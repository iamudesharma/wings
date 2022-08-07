import 'package:file_selector/file_selector.dart';

Future<XFile?> pickerImageMacos() async {
  final XTypeGroup typeGroup = XTypeGroup(
    label: 'images',
    extensions: <String>['jpg', 'png'],
  );
  final XFile? file =
      await openFile(acceptedTypeGroups: <XTypeGroup>[typeGroup]);

  return file;
}



Future<XFile?> videoPickerMacos() async {
  final XTypeGroup typeGroup = XTypeGroup(
    label: 'images',
    extensions: <String>['mp4', 'avi'],
  );
  final XFile? file =
      await openFile(acceptedTypeGroups: <XTypeGroup>[typeGroup]);

  return file;
}

