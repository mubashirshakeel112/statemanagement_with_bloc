import 'package:bloc/bloc.dart';
import 'package:bloc_example_02/presentation/home/bloc/capture_image_event.dart';
import 'package:bloc_example_02/presentation/home/bloc/capture_image_state.dart';
import 'package:bloc_example_02/utilities/pick_image.dart';
import 'package:image_picker/image_picker.dart';

class CaptureImageBloc extends Bloc<CaptureImageEvent, CaptureImageState> {
  final PickImage _pickImage = PickImage();

  CaptureImageBloc() : super(CaptureImageState()) {
    on<CaptureImageFromCamera>(_onCaptureImageFromCamera);
    on<CaptureImageFromGallery>(_onCaptureImageFromGallery);
  }

  Future<void> _onCaptureImageFromCamera(CaptureImageEvent event, Emitter<CaptureImageState> emit) async {
    emit(state.copyWith(status: CaptureImageEnum.loading));
    try {
      XFile? file = await _pickImage.pickImageFrom(ImageSource.camera);
      emit(state.copyWith(status: CaptureImageEnum.success, file: file));
    } catch (e) {
      emit(state.copyWith(status: CaptureImageEnum.failure, errorMessage: e.toString()));
    }
  }

  Future<void> _onCaptureImageFromGallery(CaptureImageFromGallery event, Emitter<CaptureImageState> emit) async {
    emit(state.copyWith(status: CaptureImageEnum.loading));
    try {
      XFile? file = await _pickImage.pickImageFrom(ImageSource.gallery);
      emit(state.copyWith(status: CaptureImageEnum.success, file: file));
    } catch (e) {
      emit(state.copyWith(status: CaptureImageEnum.failure, errorMessage: e.toString()));
    }
  }
}
