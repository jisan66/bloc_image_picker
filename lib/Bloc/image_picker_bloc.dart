import 'package:bloc_image_picker/Bloc/image_picker_event.dart';
import 'package:bloc_image_picker/Bloc/image_picker_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  ImagePickerBloc() : super(ImagePickerInitialState()) {
    on<TapImagePickerEvent>((event, emit) async{
      emit(ImagePickerLoadingState());
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
      emit(ImagePickerLoadedState(pickedFile: pickedFile!));
    });
  }
}
