part of 'recording_bloc.dart';

abstract class RecordingEvent extends Equatable {
  const RecordingEvent();
}

class StartRecordingEvent extends RecordingEvent {
  @override
  List<Object?> get props => [];
}

class StopRecordingEvent extends RecordingEvent {
  const StopRecordingEvent({required this.isSend});
  final bool isSend;

  @override
  List<Object?> get props => [isSend];
}

class TimerEvent extends RecordingEvent {
  final _id = const Uuid().v4();

  @override
  List<Object> get props => [_id];
}

class CheckPermissionEvent extends RecordingEvent {
  @override
  List<Object> get props => [];
}

class CancelRecordingEvent extends RecordingEvent {
  final _id = const Uuid().v4();

  @override
  List<Object> get props => [_id];
}
