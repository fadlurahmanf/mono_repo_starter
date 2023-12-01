class OpenviduRemoteParticipant {
  final String id;
  final String? streamId;
  final bool? isVideoActive;
  final bool? isAudioActive;

  OpenviduRemoteParticipant({
    required this.id,
    this.streamId,
    this.isVideoActive,
    this.isAudioActive,
  });

  Map<String, dynamic> toJson() =>
      {'id': id, 'streamId': streamId, 'isVideoActive': isVideoActive, 'isAudioActive': isAudioActive};
}
