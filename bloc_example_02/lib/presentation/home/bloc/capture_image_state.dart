import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

enum CaptureImageEnum { initial, loading, success, failure }

class CaptureImageState extends Equatable {
  final CaptureImageEnum status;
  final XFile? file;
  final String errorMessage;

  const CaptureImageState({this.status = CaptureImageEnum.initial, this.file, this.errorMessage = ''});

  CaptureImageState copyWith({CaptureImageEnum? status, XFile? file, String? errorMessage}) {
    return CaptureImageState(
      status: status ?? this.status,
      file: file ?? this.file,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, file, errorMessage];
}
