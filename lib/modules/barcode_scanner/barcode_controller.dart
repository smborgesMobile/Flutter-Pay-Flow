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

  /// Inicializa as câmeras disponíveis e começa o stream da câmera traseira.
  Future<void> getAvailableCameras() async {
    try {
      final cameras = await availableCameras();
      final backCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.back,
      );

      cameraController = CameraController(
        backCamera,
        ResolutionPreset.max,
        enableAudio: false,
      );

      await cameraController!.initialize();
      scanWithCamera();
      listenCamera();
    } catch (e) {
      status = BarcodeScannerStatus.error(e.toString());
    }
  }

  /// Realiza a leitura de um código de barras a partir de uma imagem.
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

  /// Permite ao usuário escolher uma imagem da galeria para escanear.
  Future<void> scanWithImagePicker() async {
    final XFile? file = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (file == null) return;

    final inputImage = InputImage.fromFile(File(file.path));
    await scannerBarCode(inputImage);
  }

  /// Ativa o status de câmera disponível e inicia o timeout de 20s.
  void scanWithCamera() {
    status = BarcodeScannerStatus.available();
    Future.delayed(Duration(seconds: 20)).then((_) {
      if (!status.hasBarcode) {
        status = BarcodeScannerStatus.error(
          "Tempo de leitura excedido (timeout)",
        );
      }
    });
  }

  /// Inicia o stream da câmera para processar imagens em tempo real.
  void listenCamera() {
    if (cameraController == null || cameraController!.value.isStreamingImages)
      return;

    cameraController!.startImageStream((CameraImage cameraImage) async {
      if (!status.stopScanner) {
        try {
          final WriteBuffer allBytes = WriteBuffer();
          for (Plane plane in cameraImage.planes) {
            allBytes.putUint8List(plane.bytes);
          }
          final bytes = allBytes.done().buffer.asUint8List();

          final Size imageSize = Size(
            cameraImage.width.toDouble(),
            cameraImage.height.toDouble(),
          );

          final camera = cameraController!.description;
          final imageRotation =
              InputImageRotationValue.fromRawValue(camera.sensorOrientation) ??
              InputImageRotation.rotation0deg;

          final inputImageFormat =
              InputImageFormatValue.fromRawValue(cameraImage.format.raw) ??
              InputImageFormat.nv21;

          final inputImageData = InputImageMetadata(
            size: imageSize,
            rotation: imageRotation,
            format: inputImageFormat,
            bytesPerRow: cameraImage.planes[0].bytesPerRow,
          );

          final inputImage = InputImage.fromBytes(
            bytes: bytes,
            metadata: inputImageData,
          );

          await scannerBarCode(inputImage);
        } catch (e) {
          debugPrint('Erro no processamento da câmera: $e');
        }
      }
    });
  }

  /// Para a câmera e fecha o scanner.
  Future<void> stopCamera() async {
    try {
      await cameraController?.stopImageStream();
      await cameraController?.dispose();
      await barcodeScanner.close();
    } catch (e) {
      debugPrint("Erro ao parar a câmera: $e");
    }
  }

  /// Libera recursos.
  void dispose() {
    statusNotifier.dispose();
    stopCamera();
  }
}
