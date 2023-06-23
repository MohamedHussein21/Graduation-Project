// import 'package:brain_tumor/core/utils/constant.dart';
// import 'package:brain_tumor/core/utils/images_mange.dart';
// import 'package:brain_tumor/core/utils/mediaQuery.dart';
// import 'package:brain_tumor/features/forget_Password/widgets/default_appBar.dart';
// import 'package:brain_tumor/features/patient-data/presentation/pages/result.dart';
// import 'package:flutter/material.dart';
//
// import '../../../core/utils/color_mange.dart';
// import '../../../core/utils/font_mange.dart';
// import '../../authentication/presentation/widgets/defauldButton.dart';
//
// class UploadFile extends StatelessWidget {
//   const UploadFile({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: defaultAppBar(text: 'Upload File'),
//       body: Padding(
//         padding: EdgeInsets.all(context.toPadding),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(child: Image.asset(ImageAssets.upload)),
//             SizedBox(
//               height: context.heigh * 0.03,
//             ),
//             Text(
//               'Upload from :',
//               style: TextStyle(
//                   fontSize: 18,
//                   color: ColorManger.defaultColor,
//                   fontWeight: FontWeightManger.bold),
//             ),
//             buildfixedform(
//               context,
//               onTap: () {},
//               text: 'Google Drive',
//               widget: Image.asset(ImageAssets.googleDrive),
//             ),
//             buildfixedform(
//               context,
//               onTap: () {},
//               text: 'Your Device',
//               widget: Image.asset(ImageAssets.smartphone),
//             ),
//             const Spacer(),
//             DefaultButton(
//               width: context.width,
//               submit: () {
//                 Constants.navigateTo(context, ResultScreen());
//               },
//               title: 'Done',
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   InkWell buildfixedform(BuildContext context,
//       {GestureTapCallback? onTap, String? text, Widget? widget}) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         margin: const EdgeInsets.all(10.0),
//         padding: const EdgeInsets.all(10.0),
//         height: 50,
//         decoration: BoxDecoration(
//             border: Border.all(color: Colors.grey),
//             borderRadius: BorderRadius.circular(10)),
//         child: Row(
//           children: [
//             widget!,
//             SizedBox(
//               width: context.width * 0.05,
//             ),
//             Text(
//               text!,
//               style: TextStyle(color: ColorManger.defaultColor),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
