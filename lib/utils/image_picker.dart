import 'package:image_picker/image_picker.dart';

Future<XFile?> pickerImage(ImageSource source) async {
  return await ImagePicker().pickImage(source: source);
}
