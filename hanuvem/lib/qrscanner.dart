import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class QRScannerPage extends StatefulWidget {
  @override
  _QRScannerPageState createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? qrController;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      qrController?.pauseCamera();
    }
    qrController?.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scanner'),
      ),
      body: QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      qrController = controller;
    });

    qrController!.scannedDataStream.listen((scanData) async {
      final scannedValue = scanData.code;
      if (scannedValue != null) {
        // Send scanned value to endpoint
        await _sendScannedValue(scannedValue);

        // Stop scanning
        await controller.pauseCamera();
      }
    });
  }

  Future<void> _sendScannedValue(String value) async {
    final url = 'https://your-endpoint.com/scan'; // Replace with your endpoint
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'value': value}),
    );

    if (response.statusCode == 200) {
      print('Value sent successfully');
    } else {
      print('Failed to send value');
    }
  }

  @override
  void dispose() {
    qrController?.dispose();
    super.dispose();
  }
}
