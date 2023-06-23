import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../core/network/api_constant.dart';
import '../../../authentication/presentation/widgets/defauldButton.dart';
import '../../data/models/patientModel.dart';

class ResultScreen extends StatelessWidget {
  final PatientModel patientModel;

  const ResultScreen({Key? key, required this.patientModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.download)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DefaultButton(
              width: double.infinity,
              submit: () {
                downloadAndOpenPdf(
                    context: context,
                    classLabel: patientModel.predictedLabel,
                    tumorSize: patientModel.tumorSize);
              },
              title: 'Show PDF',
            ),
            const Spacer(),
            DefaultButton(
              width: double.infinity,
              submit: () {},
              title: 'Done',
            ),
          ],
        ),
      ),
    );
  }

  void downloadAndOpenPdf(
      {required BuildContext context,
      required String classLabel,
      required double tumorSize}) async {
    try {
      Dio dio = Dio();
      Response response = await dio.post(ApiConstant.uploadPatientData,
          options: Options(
            headers: ApiConstant.headers,
          ),
          data: {
            'class_label': classLabel,
            'tumor_size': tumorSize,
          });

      // Save the PDF file
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String filePath = '${appDocDir.path}/result.pdf';
      File file = File(filePath);
      await file.writeAsBytes(response.data);

      // Open the PDF file
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PDFView(
            filePath: filePath,
          ),
        ),
      );
    } catch (error) {
      // Handle any errors that occur during the download process
      print('Error downloading PDF: $error');
    }
  }
}
