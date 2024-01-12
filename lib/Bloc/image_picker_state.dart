import 'package:image_picker/image_picker.dart';

abstract class ImagePickerState{}

class ImagePickerInitialState extends ImagePickerState{}

class ImagePickerLoadingState extends ImagePickerState{}

class ImagePickerLoadedState extends ImagePickerState{
  final XFile? pickedFile;

  ImagePickerLoadedState({required this.pickedFile});
}