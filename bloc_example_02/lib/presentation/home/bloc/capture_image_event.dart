import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

abstract class CaptureImageEvent extends Equatable {
  const CaptureImageEvent();

  @override
  List<Object?> get props => [];
}

class CaptureImageFromCamera extends CaptureImageEvent {}

class CaptureImageFromGallery extends CaptureImageEvent {}
