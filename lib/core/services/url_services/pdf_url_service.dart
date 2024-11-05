import 'dart:async';

import 'package:fl_downloader/fl_downloader.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

abstract class PdfUrlService {
  Future<bool> get isDownloaded;
}
@LazySingleton(as: PdfUrlService)
 class DownloadPdfUrl implements PdfUrlService{
  late StreamSubscription progressStream;


  void pdfUrlServiceInit(String pdfUrl, int shipmentId) {
    FlDownloader.initialize();
    progressStream = FlDownloader.progressStream.listen((event) {
      if (event.status == DownloadStatus.successful) {
        // This is a way of auto-opening downloaded file right after a download is completed
        FlDownloader.openFile(filePath: event.filePath);
      } else if (event.status == DownloadStatus.running) {
      } else if (event.status == DownloadStatus.failed) {
      } else if (event.status == DownloadStatus.paused) {
        Future.delayed(
          const Duration(milliseconds: 250),
          () => FlDownloader.attachDownloadProgress(event.downloadId),
        );
      } else if (event.status == DownloadStatus.pending) {}
    });
    _downloadPdfFile(pdfUrl, shipmentId);
  }

  _downloadPdfFile(String pdfUrl, int shipmentId) async {
    final permission = await FlDownloader.requestPermission();
    if (permission == StoragePermissionStatus.granted) {
      await FlDownloader.download(
        pdfUrl,
        fileName: 'Saayer-Shipment-$shipmentId.pdf',
      );
    } else {
      debugPrint('Permission denied =(');
    }
  }

  void dispose() {
    progressStream.cancel();
  }

  @override
  // TODO: implement isDownloaded
  Future<bool> get isDownloaded => throw UnimplementedError();
}
