part of 'video_call_bloc.dart';

@freezed
class VideoCallEvent with _$VideoCallEvent {
  const factory VideoCallEvent.setLocalParticipant({required String id}) = _SetLocalParticipant;
}
