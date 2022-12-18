part of 'recording_bloc.dart';

abstract class RecordingState extends Equatable {
  const RecordingState();

  @override
  List<Object> get props => [];
}

class RecordingInitial extends RecordingState {
  @override
  List<Object> get props => [];
}

class StartedState extends RecordingState {
  @override
  List<Object> get props => [];
}

class ErrorState extends RecordingState {
  @override
  List<Object> get props => [];
}

class StoppedState extends RecordingState {
  StoppedState(
      {required this.audioFile,
      required this.durationSeconds,
      required this.isSend});
  final File audioFile;
  final int durationSeconds;
  final bool isSend;
  final _id = const Uuid().v4();

  @override
  List<Object> get props => [_id];
}

class TimerState extends RecordingState {
  final _id = const Uuid().v4();

  @override
  List<Object> get props => [_id];
}

class PermissionState extends RecordingState {
  PermissionState({required this.status});
  final PermissionStatus status;
  final _id = const Uuid().v4();

  @override
  List<Object> get props => [_id];
}
