
// import 'package:flutter/material.dart';


// final String url = 'https://drive.google.com/uc?export=download&id=11tvMYat1qXzrPujVhzpnrscKCaJm55co';

// Future<void> _launchUrl(BuildContext context, String url) async {
//   final Uri uri = Uri.parse(url);
//   try {
//     if (await canLaunchUrl(uri)) {
//       await launchUrl(uri, mode: LaunchMode.externalApplication );
//     } else {
//       throw 'Could not launch $url';
//     }
//   } catch (e) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Failed to open URL: $e')),
//     );
//   }
// }

import 'package:flutter/material.dart';

class Resumea extends StatefulWidget {
  const Resumea({super.key});

  @override
  State<Resumea> createState() => _ResumeaState();
}

class _ResumeaState extends State<Resumea> {


  @override
  Widget build(BuildContext context) {
//     final double screenWidth = MediaQuery.of(context).size.width;
//     final double a4AspectRatio = 210 / 297;
//     final double pdfWidth = screenWidth * 0.9;
//     final double pdfHeight = pdfWidth / a4AspectRatio;

    return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: const Color.fromARGB(255, 255, 255, 255),
//         onPressed: () => _launchUrl(context, url),
//         child: Icon(
//           Icons.download_rounded,
//           color: const Color.fromARGB(255, 0, 0, 0),
//         ),
//       ),
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(0, 173, 114, 114),
//         leading: IconButton(
//           onPressed: () {
//             setState(() {
//               WidgetsBinding.instance.addPostFrameCallback(
//                 (_) {
//                   swipeUP.value = 0 ;
//                   iconToShowFurtherDetailOfEducation1.value = false;
//                   iconToShowFurtherDetailOfEducation2.value = false;
//                   iconToShowFurtherDetailOfEducation3.value = false;
//                   education.value = false ;
//                   color.value = 0 ;
//                 }
//               );
//             });
//           },
//           icon: Icon(
//             Icons.arrow_back_ios,
//             color: const Color.fromARGB(255, 255, 255, 255),
//           ),
//         ),
//       ),
//       body: Center(
//         child: Container(
//           width: double.infinity,
//           height: double.infinity,
//           child: PDFView(
//             filePath: 'assets/pdfs/your_pdf_file.pdf',
//           ),
//         ),
//       ),
    );
  }
}


/*
import 'dart:typed_data';
import 'package:flu123456/My_Portfolio_Build/Let_See_my_Profile/ValueNotifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';


final String url = 'https://drive.google.com/uc?export=download&id=11tvMYat1qXzrPujVhzpnrscKCaJm55co';

Future<void> _launchUrl(BuildContext context, String url) async {
  final Uri uri = Uri.parse(url);
  try {
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication );
    } else {
      throw 'Could not launch $url';
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Failed to open URL: $e')),
    );
  }
}

// Future<String> loadAssetPdfToLocalStorage(String assetPath) async {
//   final data = await rootBundle.load(assetPath);
//   final bytes = data.buffer.asUint8List();

//   final directory = await getApplicationDocumentsDirectory();
//   final file = File('${directory.path}/temp_pdf.pdf');
//   await file.writeAsBytes(bytes);

//   return file.path;
// }

class Resumea extends StatefulWidget {
  const Resumea({super.key});

  @override
  State<Resumea> createState() => _ResumeaState();
}

class _ResumeaState extends State<Resumea> {
  String? localFilePath;

  // @override
  // void initState() {
  //   super.initState();
  //   loadPdf();
  // }

  // Future<void> loadPdf() async {
  //   final path = await loadAssetPdfToLocalStorage('assets/pdfs/GiridharanRavi_SoftwareEngineer_resumea.pdf');
  //   setState(() {
  //     localFilePath = path;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double a4AspectRatio = 210 / 297;
    final double pdfWidth = screenWidth * 0.9;
    final double pdfHeight = pdfWidth / a4AspectRatio;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        onPressed: () => _launchUrl(context, url),
        child: Icon(
          Icons.download_rounded,
          color: const Color.fromARGB(255, 0, 0, 0),
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 173, 114, 114),
        leading: IconButton(
          onPressed: () {
            setState(() {
              WidgetsBinding.instance.addPostFrameCallback(
                (_) {
                  swipeUP.value = 0 ;
                  iconToShowFurtherDetailOfEducation1.value = false;
                  iconToShowFurtherDetailOfEducation2.value = false;
                  iconToShowFurtherDetailOfEducation3.value = false;
                  education.value = false ;
                  color.value = 0 ;
                }
              );
            });
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
      body:
      // localFilePath == null
      //     ? const Center(
      //         child: CircularProgressIndicator(
      //           color: Color.fromARGB(255, 0, 255, 234),
      //         ),
      //       )
          // :
          //  Center(
              // child: Container(
              //   width: pdfWidth,
              //   height: pdfHeight,
                // child: 
                SfPdfViewer.asset(
                  'assets/pdfs/GiridharanRavi_SoftwareEngineer_resumea.pdf'
                )
                // 
                // PDFView(
                //   filePath: localFilePath,
                //   enableSwipe: true,
                //   swipeHorizontal: false,
                //   onError: (error) {
                //     ScaffoldMessenger.of(context).showSnackBar(
                //       SnackBar(content: Text('Error loading PDF: $error')),
                //     );
                //   },
                // ),
              // ),
            // ),
    );
  }
}



*/