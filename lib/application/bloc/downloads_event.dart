import 'package:freezed_annotation/freezed_annotation.dart';
part 'downloads_event.freezed.dart';

@freezed
class DownloadsEvent with _$DownloadsEvent {
  const factory DownloadsEvent.getDownloadsImage() = _GetDownloadsImage;
}
