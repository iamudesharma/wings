// import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:image_picker_for_web/image_picker_for_web.dart';

Future<XFile?> pickerImage(ImageSource source) async {
  return await ImagePicker().pickImage(source: source);
}
