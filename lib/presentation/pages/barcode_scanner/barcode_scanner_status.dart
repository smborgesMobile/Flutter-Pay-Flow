class BarcodeScannerStatus {
  final bool showCamera;
  final bool hasError;
  final String error;
  final String barcode;
  final bool stopScanner;

  BarcodeScannerStatus({
    this.showCamera = false,
    this.hasError = false,
    this.error = '',
    this.barcode = '',
    this.stopScanner = false,
  });

  bool get hasBarcode => barcode.isNotEmpty;

  bool get showError => hasError && error.isNotEmpty;

  factory BarcodeScannerStatus.available() => BarcodeScannerStatus(showCamera: true);
  factory BarcodeScannerStatus.error(String msg) => BarcodeScannerStatus(hasError: true, error: msg);
  factory BarcodeScannerStatus.barcode(String code) => BarcodeScannerStatus(barcode: code, stopScanner: true);
}
