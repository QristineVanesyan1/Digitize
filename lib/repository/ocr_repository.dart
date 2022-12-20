import 'dart:convert';
import 'package:diplomayin/models/ocr.dart';
import 'package:diplomayin/repository/db_repository.dart';
import 'package:diplomayin/utils/utils.dart';
import 'package:image_picker/image_picker.dart';

class OCRRepository {
  OCRRepository({required this.dbRepository});
  final DbRepository dbRepository;

  Future<OCR?> fetchOcr(XFile file) async {
    // var json =
    //     '''{"status":"success","id":"ef057ca2-9606-4893-988d-38c004a3f7c6","documents":[{"id":"1189602","version":"1.2","type":"ocr","pages":[{"fileIdx":0,"offset":0,"count":1}],"categorizedUrl":"https://dkseun49-msqjdnsd.s3.eu-central-1.amazonaws.com/sdf/prod/users/4026/document/2022-11-19T18_56_17_681Z_c4cc55f4-3f5c-4648-90a1-3a1808ae9672_splitted.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAV3WNTZDYXELUKXI3%2F20221119%2Feu-central-1%2Fs3%2Faws4_request&X-Amz-Date=20221119T000000Z&X-Amz-Expires=86400&X-Amz-SignedHeaders=host&recognizingFinished=1668884187046&X-Amz-Signature=b8f625b1d9e7cddd1a3d1a94024701fc378720cbbf1a49ce21f7defd8166c74c","plainTextBase64":"IExJT04KICAgICAgICDCsAogICAgICAgICAg1YYKICAgICAgICAgICAgICAg1LnVvNW51bbVqyDUv9Wh1akK","validationChecks":{"result":0,"validations":{"recognitionStatusCheck":{"type":"boolean","value":true}}},"textAnnotation":{"Pages":[{"ClockwiseOrientation":356.65,"Words":[{"Id":"0HMMABUGDN2TU","Text":"LION","Outline":[0.0285,0.08781,0.14755,0.08781,0.14755,0.14217,0.0285,0.14217],"Confidence":0.3116,"Lang":"eng"},{"Id":"0HMMABUGDN2U0","Text":"°","Outline":[0.22078,0.29032,0.22547,0.29032,0.22547,0.2963,0.22078,0.2963],"Confidence":0.3252,"Lang":"eng"},{"Id":"0HMMABUGDN2U2","Text":"Ն","Outline":[0.29762,0.37515,0.33045,0.37515,0.33045,0.41219,0.29762,0.41219],"Confidence":0.3353,"Lang":"hye"},{"Id":"0HMMABUGDN2U4","Text":"Թռչնի","Outline":[0.42496,0.48626,0.62374,0.48626,0.62374,0.62605,0.42496,0.62605],"Confidence":0.9181,"Lang":"hye"},{"Id":"0HMMABUGDN2U6","Text":"Կաթ","Outline":[0.63817,0.48686,0.76768,0.48686,0.76768,0.62545,0.63817,0.62545],"Confidence":0.9722,"Lang":"hye"}]}]}}]}''';

    final json = await Utils.makeRequest(file.path);
    final ocr = OCR.fromJson(jsonDecode(json));
    // final directory= await getApplicationDocumentsDirectory();
    // final filePath = '${directory.path}/file_${ocr.id}.txt';
    // final imagePath = '${directory.path}/image_${ocr.id}.jpg';

    // final filePathFile = File(filePath);
    // final imagePathFile = File(imagePath);
    // await filePathFile.writeAsString(json);
    // await imagePathFile.writeAsBytes(data);

    // var json =
    //     '''{"status":"success","id":"e6700433-abc7-4884-9132-09ece13b93bc","documents":[{"id":"1188133","version":"1.2","type":"ocr","pages":[{"fileIdx":0,"offset":0,"count":1}],"categorizedUrl":"https://dkseun49-msqjdnsd.s3.eu-central-1.amazonaws.com/sdf/prod/users/4008/document/2022-11-18T16_40_44_273Z_f36c464d-ba97-4b6a-8673-db90b0f7fe4a_splitted.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAV3WNTZDYXELUKXI3%2F20221118%2Feu-central-1%2Fs3%2Faws4_request&X-Amz-Date=20221118T000000Z&X-Amz-Expires=86400&X-Amz-SignedHeaders=host&recognizingFinished=1668789653787&X-Amz-Signature=b81fa236f9a7f71b627c4b5f3252a7bf811a08510d62b902b9c773f20e1a5700","plainTextBase64":"ICAgMDIKICAgICAgICAgICAgICAgICAgICAgICAgICAgICBCZQogICAgICAgICAgICAgIEYgPWYgICAgICAgOwogICAgICAgICAgICAgSSAgICAoCiAgICAgICAgIElOIE1VU0sKICAgICAgICAgIFdFIFRSVVNUCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQiBuVgogICAgICAgICAgICAgICAgICAgICAgICAgICAgfCBHRUYhCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEdUWAo=","validationChecks":{"result":0,"validations":{"recognitionStatusCheck":{"type":"boolean","value":true}}},"textAnnotation":{"Pages":[{"ClockwiseOrientation":0.519989,"Words":[{"Id":"0HMM9G153442I","Text":"02","Outline":[0.28044,0.12255,0.34262,0.12255,0.34262,0.17956,0.28044,0.17956],"Confidence":0.7369,"Lang":"eng"},{"Id":"0HMM9G153442K","Text":"Be","Outline":[0.89119,0.27471,0.99935,0.27471,0.99935,0.32284,0.89119,0.32284],"Confidence":0.6008,"Lang":"eng"},{"Id":"0HMM9G153442M","Text":"F","Outline":[0.42098,0.31433,0.47992,0.31433,0.47992,0.3732,0.42098,0.3732],"Confidence":0.0058,"Lang":"eng"},{"Id":"0HMM9G153442O","Text":"=f","Outline":[0.51425,0.36172,0.55829,0.36172,0.55829,0.37727,0.51425,0.37727],"Confidence":0.2074,"Lang":"eng"},{"Id":"0HMM9G153442Q","Text":";","Outline":[0.74806,0.36394,0.75259,0.36394,0.75259,0.36875,0.74806,0.36875],"Confidence":0.1289,"Lang":"eng"},{"Id":"0HMM9G153442S","Text":"(","Outline":[0.54534,0.40726,0.55764,0.40726,0.55764,0.43762,0.54534,0.43762],"Confidence":0.2535,"Lang":"eng"},{"Id":"0HMM9G153442U","Text":"I","Outline":[0.41451,0.42096,0.41516,0.42096,0.41516,0.42466,0.41451,0.42466],"Confidence":0.4081,"Lang":"eng"},{"Id":"0HMM9G1534430","Text":"IN","Outline":[0.2921,0.46168,0.38277,0.46168,0.38277,0.49537,0.2921,0.49537],"Confidence":0.9525,"Lang":"eng"},{"Id":"0HMM9G1534432","Text":"MUSK","Outline":[0.40803,0.46242,0.67163,0.46242,0.67163,0.49759,0.40803,0.49759],"Confidence":0.917,"Lang":"eng"},{"Id":"0HMM9G1534434","Text":"TRUST","Outline":[0.45402,0.50907,0.6535,0.50907,0.6535,0.53165,0.45402,0.53165],"Confidence":0.8803,"Lang":"eng"},{"Id":"0HMM9G1534436","Text":"WE","Outline":[0.32124,0.50944,0.43782,0.50944,0.43782,0.53165,0.32124,0.53165],"Confidence":0.9349,"Lang":"eng"},{"Id":"0HMM9G1534438","Text":"B","Outline":[0.88083,0.56979,0.90997,0.56979,0.90997,0.58534,0.88083,0.58534],"Confidence":0.2971,"Lang":"eng"},{"Id":"0HMM9G153443A","Text":"nV","Outline":[0.94301,0.57238,0.99935,0.57238,0.99935,0.58756,0.94301,0.58756],"Confidence":0.4539,"Lang":"eng"},{"Id":"0HMM9G153443C","Text":"|","Outline":[0.8614,0.60385,0.8899,0.60385,0.8899,0.6716,0.8614,0.6716],"Confidence":0.9573,"Lang":"eng"},{"Id":"0HMM9G153443E","Text":"GEF","Outline":[0.89443,0.63791,0.98575,0.63791,0.98575,0.66013,0.89443,0.66013],"Confidence":0.8547,"Lang":"eng"},{"Id":"0HMM9G153443G","Text":"!","Outline":[0.98575,0.63828,0.99935,0.63828,0.99935,0.65939,0.98575,0.65939],"Confidence":0.3774,"Lang":"eng"},{"Id":"0HMM9G153443I","Text":"GTX","Outline":[0.90026,0.66605,0.99935,0.66605,0.99935,0.68789,0.90026,0.68789],"Confidence":0.9794,"Lang":"eng"}]}]}}]}''';
    // await DbRepository.getDb();
    // await dbRepository.insertData(filePath, imagePath);
    return ocr;
  }
}
