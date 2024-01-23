import 'package:image_picker/image_picker.dart';

class ImagePickerUtitls {
  final ImagePicker _picker = ImagePicker();

  Future<XFile?> pickCameraImage() async {
    XFile? image = await _picker.pickImage(source: ImageSource.camera);
    return image;
  }

  Future<XFile?> pickGalleryImage() async {
    XFile? image = await _picker.pickImage(source: ImageSource.camera);
    return image;
  }
}
