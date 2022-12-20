import 'dart:convert';
import 'dart:io';

import 'package:diplomayin/constants/constants.dart';
import 'package:diplomayin/repository/db_repository.dart';
import 'package:diplomayin/repository/ocr_repository.dart';
import 'package:diplomayin/screens/details_screen.dart';
import 'package:diplomayin/utils/utils.dart';
import 'package:diplomayin/view_models/ocr_view_model.dart';
import 'package:diplomayin/widget/app_error_widget.dart';
import 'package:diplomayin/widget/picker_button.dart';
import 'package:diplomayin/widget/save_button.dart';
import 'package:diplomayin/widget/save_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool textScanning = false;

  XFile? imageFile;

  String? scannedText;
  OCRViewModel? ocrViewModel;

  final OCRRepository ocrRepository =
      OCRRepository(dbRepository: DbRepository());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //TODO: REF
        appBar: AppBar(
          centerTitle: true,
          title: const Text(Constants.appTitle),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context)
                .pop(true), //TODO check if something was changes
          ),
          actions: [SaveButton(onTap: _onSavePressed)],
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (textScanning) const CircularProgressIndicator(),
                          if (!textScanning && imageFile == null)
                            Container(
                              width: 300,
                              height: 300,
                              color: Colors.grey[300]!,
                            ),
                        ]),
                    if (imageFile != null) Image.file(File(imageFile!.path)),
                    _renderButtons(),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      scannedText ?? '',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                )),
          ),
        ));
  }

  Widget _renderButtons() =>
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        PickerButton(
            onTap: () => getImage(ImageSource.camera),
            icon: Icons.camera_alt,
            text: 'Camera'),
        PickerButton(
            onTap: () => getImage(ImageSource.gallery),
            icon: Icons.image,
            text: 'Gallery'),
      ]);

  void getImage(ImageSource source) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage != null) {
        textScanning = true;
        imageFile = pickedImage;
        setState(() {});
        getRecognisedText(pickedImage);
      }
    } catch (e) {
      textScanning = false;
      imageFile = null;
      Utils.showAppDialog(
          context, const AppErrorWidget(message: 'Please check permission'));
      setState(() {});
    }
  }

  void getRecognisedText(XFile image) async {
    try {
      var ocrModel = await ocrRepository.fetchOcr(image);
      if (ocrModel != null) {
        ocrViewModel = OCRViewModel.fromModel(ocrModel);
      }
    } catch (e) {
      Utils.showAppDialog(context, const AppErrorWidget());
    }

    // final pdf = obh.documents.first.categorizedUrl;
    // final text = obh.documents.first.plainTextBase64;

    if (ocrViewModel != null) {
      _show(ocrViewModel!);
    }
    // }
    //  else {
    //   print(response.reasonPhrase);
    // }
    // } catch (e) {
    //   print("object");
    // }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  void _show(OCRViewModel? ocrViewModel) {
    Utils.showAppBottomSheet(
        context,
        SaveWidget(
          onSave: _onSave,
          onSaveTxt: _onSaveTxt,
          onSeeResult: _onSeeResult,
        ));
  }

  Future<void> _onSavePressed() async {
    if (ocrViewModel != null) {
      _show(ocrViewModel!);
    } else {
      Utils.showAppDialog(
          context, const AppErrorWidget(message: 'Select Image'));
    }
  }

  Future<void> _onSaveTxt() async {
    if (ocrViewModel != null) {
      final ocr = ocrViewModel!.model;
      try {
        final pickedName = imageFile!.name;
        final directory = await getApplicationDocumentsDirectory();
        var a = '/json_${ocr.id}.txt';
        var b = '/file_${ocr.id}.txt';
        final jsonPath = '${directory.path}$a';
        final filePath = '${directory.path}$b';

        final filePathFile = File(filePath);
        final jsonPathFile = File(jsonPath);
        final textList = ocrViewModel!.recognizedText;
        String content = '';
        for (var text in textList) {
          content += text.toString();
        }
        if (content != '') {
          await filePathFile.writeAsString(content);
          await jsonPathFile.writeAsString(json.encode(ocr.toJson()));

          await DbRepository.getDb();
          await DbRepository().insertDataTxt(
              jsonPathTxt: a, filePathTxt: b, titleStr: pickedName);
          imageFile = null;

          // ignore: use_build_context_synchronously

          Utils.showAppDialog(
              context,
              AppErrorWidget(
                  message: 'File successfully saved',
                  onConfirm: (context) {
                    Navigator.of(context).pop(true);
                  }));
        } else {
          // ignore: use_build_context_synchronously
          Utils.showAppDialog(
              context, const AppErrorWidget(message: 'Empty Content'));
        }
      } catch (e) {
        Utils.showAppDialog(context, const AppErrorWidget());
      }
    } else {
      Utils.showAppDialog(context, const AppErrorWidget());
    }
  }

  Future<void> _onSave() async {
    if (ocrViewModel != null) {
      final ocr = ocrViewModel!.model;
      try {
        final pickedName = imageFile!.name;
        final last = pickedName.split(".").last;
        var data = await imageFile!.readAsBytes();
        final directory = await getApplicationDocumentsDirectory();
        var a = '/json_${ocr.id}.txt';
        var b = '/file_${ocr.id}.txt';
        var c = '/image_${ocr.id}.$last';

        final jsonPath = '${directory.path}$a';
        final filePath = '${directory.path}$b';
        final imagePath = '${directory.path}$c';

        final filePathFile = File(filePath);
        final jsonPathFile = File(jsonPath);
        final imagePathFile = File(imagePath);
        final textList = ocrViewModel!.recognizedText;
        String content = '';
        for (var text in textList) {
          content += text.toString();
        }
        if (content != '') {
          await filePathFile.writeAsString(content);
          await imagePathFile.writeAsBytes(data);
          await jsonPathFile.writeAsString(json.encode(ocr.toJson()));

          await DbRepository.getDb();
          await DbRepository().insertData(
              titleStr: pickedName, jsonPath: a, filePath: b, imagePath: c);
          imageFile = null;
          Utils.showAppDialog(
              context,
              AppErrorWidget(
                  message: 'File successfully saved',
                  onConfirm: (context) {
                    Navigator.of(context).pop(true);
                  }));
        } else {
          Utils.showAppDialog(
              context, const AppErrorWidget(message: 'Empty Content'));
        }
      } catch (e) {
        Utils.showAppDialog(context, const AppErrorWidget());
      }
    } else {
      Utils.showAppDialog(context, const AppErrorWidget());
    }
  }

  Future<void> _onSeeResult() async {
    Navigator.of(context).pop();
    Navigator.of(context).pop();

    if (ocrViewModel != null) {
      Utils.navigatorPush(
          context,
          DetailsScreen(
            result: ocrViewModel!,
          ));
    } else {
      Utils.showAppDialog(context, const AppErrorWidget());
    }
  }
}
