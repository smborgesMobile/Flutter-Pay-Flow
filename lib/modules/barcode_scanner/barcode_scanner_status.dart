import 'package:camera/camera.dart';

class BarcodeScannerStatus {
  final bool isCameraAvailable;
  final String error;
  final String barcode;

  CameraController? cameraController;

  BarcodeScannerStatus({
    required this.isCameraAvailable,
    required this.error,
    required this.barcode,
    this.cameraController
  });

  bool get showCamera => isCameraAvailable & error.isEmpty;
  bool get hasError => error.isNotEmpty;
  bool get hasBarcode => barcode.isNotEmpty;
}
