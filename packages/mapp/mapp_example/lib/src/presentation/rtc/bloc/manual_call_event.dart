part of 'manual_call_bloc.dart';

@freezed
class ManualCallEvent with _$ManualCallEvent {
  const factory ManualCallEvent.init({required String roomId}) = _Init;
  const factory ManualCallEvent.createOffer({required bool isCaller}) = _CreateOffer;
  const factory ManualCallEvent.setRemoteDescription({required bool isCaller}) = _SetRemoteDescription;
  const factory ManualCallEvent.answerOffer() = _AnswerOffer;
  const factory ManualCallEvent.addRemoteStream({required MediaStream stream}) = _AddRemoteStream;
  const factory ManualCallEvent.addCandidate({required bool isCaller}) = _AddCandidate;
  const factory ManualCallEvent.muteMic(bool mute) = _MuteMic;
  const factory ManualCallEvent.triggerMicIos(bool enableSpeaker) = TriggerMicIos;
  const factory ManualCallEvent.disposeAll() = _DisposeAll;
}