import 'package:image_picker/image_picker.dart';

Future<XFile?> PickerImage(ImageSource source) async {
  return await ImagePicker().pickImage(source: source);
}
