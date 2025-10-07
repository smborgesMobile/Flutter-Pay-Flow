import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'barcode_scanner_status.dart';

class BarcodeScannerController {
  final statusNotifier = ValueNotifier<BarcodeScannerStatus>(
    BarcodeScannerStatus(),
  );

  BarcodeScannerStatus get status => statusNotifier.value;
  set status(BarcodeScannerStatus status) => statusNotifier.value = status;

  final BarcodeScanner barcodeScanner = BarcodeScanner();
  CameraController? cameraController;

  Future<void> getAvailableCameras() async {
    try {
      final cameras = await availableCameras();
      final backCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.back,
      );

      cameraController = CameraController(
        backCamera,
        ResolutionPreset.medium,
        enableAudio: false,
      );

      await cameraController!.initialize();
      scanWithCamera();
      listenCamera();
    } catch (e) {
      status = BarcodeScannerStatus.error(e.toString());
    }
  }

  Future<void> scannerBarCode(InputImage inputImage) async {
    try {
      final barcodes = await barcodeScanner.processImage(inputImage);
      String? barcode;

      for (final barcodeItem in barcodes) {
        final value = barcodeItem.displayValue;
        if (value != null && value.isNotEmpty) {
          barcode = value;
          break;
        }
      }

      if (barcode != null && status.barcode.isEmpty) {
        status = BarcodeScannerStatus.barcode(barcode);
        await stopCamera();
      }
    } catch (e) {
      debugPrint("Erro ao ler o código: $e");
      status = BarcodeScannerStatus.error("Erro ao ler o código: $e");
    }
  }

  Future<void> scanWithImagePicker() async {
    final XFile? file = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (file == null) return;

    final inputImage = InputImage.fromFile(File(file.path));
    await scannerBarCode(inputImage);
  }

  void scanWithCamera() {
    status = BarcodeScannerStatus.available();
    Future.delayed(const Duration(seconds: 20)).then((_) {
      if (!status.hasBarcode) {
        status = BarcodeScannerStatus.error(
          "Tempo de leitura excedido (timeout)",
        );
      }
    });
  }

  void listenCamera() {
    if (cameraController == null || cameraController!.value.isStreamingImages) {
      return;
    }

    cameraController!.startImageStream((CameraImage cameraImage) async {
      if (!status.stopScanner) {
        try {
          final WriteBuffer allBytes = WriteBuffer();
          for (final plane in cameraImage.planes) {
            allBytes.putUint8List(plane.bytes);
          }

          final bytes = allBytes.done().buffer.asUint8List();
          final Size imageSize = Size(
            cameraImage.width.toDouble(),
            cameraImage.height.toDouble(),
          );

          final camera = cameraController!.description;
          final rotation =
              InputImageRotationValue.fromRawValue(camera.sensorOrientation) ??
              InputImageRotation.rotation0deg;

          // Para evitar o erro "Invalid format of image", garanta um formato compatível
          final format = Platform.isAndroid
              ? InputImageFormat.nv21
              : InputImageFormat.bgra8888;

          final plane = cameraImage.planes.first;
          final metadata = InputImageMetadata(
            size: imageSize,
            rotation: rotation,
            format: format,
            bytesPerRow: plane.bytesPerRow,
          );

          final inputImage = InputImage.fromBytes(
            bytes: bytes,
            metadata: metadata,
          );

          await scannerBarCode(inputImage);
        } catch (e) {
          debugPrint('Erro no processamento da câmera: $e');
        }
      }
    });
  }

  Future<void> stopCamera() async {
    try {
      await cameraController?.stopImageStream();
      await cameraController?.dispose();
      await barcodeScanner.close();
    } catch (e) {
      debugPrint("Erro ao parar a câmera: $e");
    }
  }

  void dispose() {
    statusNotifier.dispose();
    stopCamera();
  }
}
