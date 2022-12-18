import 'dart:async';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uuid/uuid.dart';

part 'recording_event.dart';
part 'recording_state.dart';

extension BlocTransform on Bloc {
  /// This method will transform some of bloc event streams.
  EventTransformer<T> debounce<T>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }
}

class RecordingBloc extends Bloc<RecordingEvent, RecordingState> {
  RecordingBloc() : super(RecordingInitial()) {
    on<CheckPermissionEvent>(_checkPermissionEventToState);
    on<TimerEvent>(_timerEventToState);
    on<StartRecordingEvent>(_startRecordingEventToState,
        transformer: debounce(const Duration(milliseconds: 400)));
    on<StopRecordingEvent>(_stopRecordingEventToState,
        transformer: debounce(const Duration(milliseconds: 400)));
    on<CancelRecordingEvent>(_cancelRecordingEventToState);
  }

  Future<void> _checkPermissionEventToState(
      CheckPermissionEvent event, Emitter<RecordingState> emit) async {
    final status = await Permission.microphone.status;
    emit(PermissionState(status: status));
  }

  Future<void> _timerEventToState(
      TimerEvent event, Emitter<RecordingState> emit) async {
    emit(TimerState());
  }

  Future<void> _startRecordingEventToState(
      StartRecordingEvent event, Emitter<RecordingState> emit) async {
    try {
      audioRecorder = Record();
      _cancel = false;
      record = true;
      final isRecording = await audioRecorder?.isRecording();
      if (isRecording == false) {
        var tempDir = await getApplicationDocumentsDirectory();
        final path =
            '${tempDir.path}/AudioFile:${DateTime.now().toIso8601String()}.mp3';
        await audioRecorder?.start(path: path);
        _path = path;
        recordDuration = 0;
        _startTimer();
        emit(StartedState());
      }
    } catch (e) {
      emit(ErrorState());
      throw Exception(e.toString());
    }
  }

  Future<void> _stopRecordingEventToState(
      StopRecordingEvent event, Emitter<RecordingState> emit) async {
    record = false;
    try {
      final isRecording = await audioRecorder?.isRecording();
      if (isRecording == true) {
        _timer?.cancel();
        await audioRecorder?.stop();
        await audioRecorder?.dispose();
        add(TimerEvent());
        if (_cancel != true) {
          emit(StoppedState(
              audioFile: File(_path),
              durationSeconds: recordDuration,
              isSend: event.isSend));
        }
        recordDuration = 0;
      }
    } catch (e) {
      emit(ErrorState());
      throw Exception(e.toString());
    }
  }

  Future<void> _cancelRecordingEventToState(
      CancelRecordingEvent event, Emitter<RecordingState> emit) async {
    _cancel = true;
  }

  void _startTimer() {
    add(TimerEvent());
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      add(TimerEvent());
      recordDuration++;
    });
  }

  var _path = '';
  var _cancel = false;
  var record = false;
  var recordDuration = 0;
  Record? audioRecorder;
  Timer? _timer;
}
