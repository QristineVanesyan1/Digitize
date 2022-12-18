import 'package:diplomayin/bloc/record_bloc/recording_bloc.dart';
import 'package:diplomayin/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

class RecordingScreen extends StatefulWidget {
  const RecordingScreen({super.key});

  @override
  State<RecordingScreen> createState() => _RecordingScreenState();
}

class _RecordingScreenState extends State<RecordingScreen> {
  late RecordingBloc _recordingBloc = RecordingBloc();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _recordingBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Utils.appBar(),
        body: BlocProvider<RecordingBloc>(
            create: (context) => _recordingBloc = RecordingBloc(),
            child: BlocListener<RecordingBloc, RecordingState>(
                listener: ((context, state) {
              if (state is PermissionState) {
                if (state.status == PermissionStatus.denied) {
                  _recordingBloc.add(StartRecordingEvent());
                }
              }
              if (state is StoppedState) {
                if (state.isSend == true) {
                  var a = state.audioFile;
                }
              }
            }), child: BlocBuilder<RecordingBloc, RecordingState>(
                    builder: (context, state) {
              return Column(
                children: [
                  TimerWidget(
                    duration:
                        Duration(milliseconds: _recordingBloc.recordDuration),
                    position:
                        Duration(milliseconds: _recordingBloc.recordDuration),
                    textStyle: TextStyle(),
                  ),
                  InkWell(
                    onTap: () => _recordingBloc.record
                        ? _recordingBloc.add(StopRecordingEvent(isSend: true))
                        : _recordingBloc.add(CheckPermissionEvent()),
                    child: _recordingBloc.record
                        ? Container(
                            height: 100,
                            width: 100,
                            child: const Icon(
                              Icons.stop,
                              color: Colors.black87,
                            ),
                          )
                        : Container(
                            height: 100,
                            width: 100,
                            child: const Icon(
                              Icons.play_arrow,
                              color: Colors.black87,
                            ),
                          ),
                  )
                ],
              );
            }))));
  }
}

class TimerWidget extends StatelessWidget {
  const TimerWidget(
      {required this.duration,
      required this.position,
      required this.textStyle,
      Key? key})
      : super(key: key);
  final Duration duration;
  final Duration position;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 50,
        child: Text(
          RegExp(r'(\d{2}:\d{2})\.\d+$').firstMatch('$_remaining')?.group(1) ??
              '$_remaining',
          style: textStyle,
          textAlign: TextAlign.center,
        ));
  }

  Duration get _remaining => duration - position;
}
