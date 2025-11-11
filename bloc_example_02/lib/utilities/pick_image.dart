import 'package:image_picker/image_picker.dart';

class PickImage{
  final ImagePicker _instance = ImagePicker();
  Future<XFile?> pickImageFrom(ImageSource source) async{
    XFile? file = await _instance.pickImage(source: source);
    return file;
  }
}