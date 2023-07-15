import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  RxBool textScanning = false.obs;
  XFile? imageFile;
  RxString scannedText = RxString('');

  getImage(ImageSource source) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage != null) {
        textScanning.value = true;
        imageFile = pickedImage;
        getRecognisedText(pickedImage);
      }
    } catch (e) {
      textScanning.value = false;
      imageFile = null;
      scannedText.value = "Error occured when scanning";
    }
  }

  // cameraImage() async {
  //   try {
  //     final pickedImage =
  //         await ImagePicker().pickImage(source: ImageSource.camera);
  //     if (pickedImage != null) {
  //       textScanning.value = true;
  //       imageFile = pickedImage;
  //     }
  //   } catch (e) {
  //     textScanning.value = false;
  //     imageFile = null;
  //     scannedText.value = "Error occured when scanning";
  //   }
  // }

  // void getRecognisedText(XFile image) async {
  //   final inputImage = InputImage.fromFilePath(image.path);
  //   final textRecognizer = GoogleMlKit.vision.textDetector();
  //   RecognizedText recognizedText =
  //       await textRecognizer.processImage(inputImage);
  //   await textRecognizer.close();
  //   scannedText.value = "";
  //   for (TextBlock block in recognizedText.blocks) {
  //     for (TextLine line in block.lines) {
  //       scannedText.value = scannedText + line.text + "\n";
  //     }
  //   }
  //   textScanning.value = false;
  // }

  void getRecognisedText(XFile image) async {
    final inputImage = InputImage.fromFilePath(image.path);
    final textRecognizer = GoogleMlKit.vision.textRecognizer();
    final RecognizedText recognisedText =
        await textRecognizer.processImage(inputImage);
    await textRecognizer.close();

    String scannedText = "";
    for (TextBlock block in recognisedText.blocks) {
      for (TextLine line in block.lines) {
        scannedText += line.text + "\n";
      }
    }
    //scannedText.value="";
    //scannedText.value = scannedText; // Assuming scannedText is a state or variable to hold the scanned text
    textScanning.value =
        false; // Assuming textScanning is a state or variable to track the scanning status
  }

// void getRecognisedText(XFile image) async {
//   final FirebaseVisionImage visionImage = FirebaseVisionImage.fromFilePath(image.path);
//   final TextRecognizer textRecognizer = FirebaseVision.instance.textRecognizer();
//   final VisionText visionText = await textRecognizer.processImage(visionImage);
//   await textRecognizer.close();

//   String scannedText = "";
//   for (TextBlock block in visionText.blocks) {
//     for (TextLine line in block.lines) {
//       scannedText += line.text + "\n";
//     }
//   }

//   scannedText.value = scannedText; // Assuming scannedText is a state or variable to hold the scanned text
//   textScanning.value = false; // Assuming textScanning is a state or variable to track the scanning status
// }
}
