// import 'dart:io';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:jotpark_flutter/app/cores/utils/image_compress.dart';
// import 'package:jotpark_flutter/app/data/models/index.dart';
// import 'package:jotpark_flutter/app/index.dart';
// import 'package:jotpark_flutter/app/shared_widgets/custom_dialog.dart';

// class AddPhotoWidget extends StatefulWidget {
//   AddPhotoWidget({
//     super.key,
//     required this.title,
//     required this.onPhotoAdded,
//     required this.onExistedPhotoRemove,
//     required this.maximumPhoto,
//     this.photoUrlList = const [],
//   });
//   final String title;
//   final Function(List<XFile>) onPhotoAdded;
//   final Function(String) onExistedPhotoRemove;

//   List<PhotoResModel> photoUrlList;
//   final int maximumPhoto;

//   @override
//   State<AddPhotoWidget> createState() => _AddPhotoWidgetState();
// }

// class _AddPhotoWidgetState extends State<AddPhotoWidget> {
//   List<XFile> photoPathList = [];

//   @override
//   Widget build(BuildContext context) {
//     final imagePicker = ImagePicker();

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         TextWidget(
//           widget.title,
//           color: AppColors.grey646C7B,
//         ),
//         const SizedBox(height: AppStyle.SPACING_SMALL),
//         SizedBox(
//           height: 140,
//           width: Get.width,
//           child: ListView(
//             scrollDirection: Axis.horizontal,
//             shrinkWrap: true,
//             children: [
//               GestureDetector(
//                 onTap: () async {
//                   await showCupertinoModalPopup<String>(
//                     context: context,
//                     builder: (context) {
//                       return CupertinoActionSheet(
//                         title: const Text('Choose Photo'),
//                         actions: <Widget>[
//                           CupertinoActionSheetAction(
//                             child: TextWidget(
//                               'Camera',
//                               color: AppColors.black262626,
//                             ),
//                             onPressed: () async {
//                               Get.back();
//                               final image = await imagePicker.pickImage(
//                                 source: ImageSource.camera,
//                               );

//                               if (image != null) {
//                                 if (photoPathList.length >=
//                                     widget.maximumPhoto) {
//                                   await CustomDialog.warningMessageDialog(
//                                     message: 'allow_photo_only_ten'.tr,
//                                     buttonFillColor: AppColors.redEB5757,
//                                   );
//                                   return;
//                                 }
//                                 final temp = await ImageCompress.compress(
//                                   File(image.path),
//                                 );
//                                 if (temp != null) {
//                                   photoPathList.add(temp);
//                                   widget.onPhotoAdded(photoPathList);
//                                   setState(() {});
//                                 }
//                               }
//                             },
//                           ),
//                           CupertinoActionSheetAction(
//                             child: TextWidget(
//                               'Gallery',
//                               color: AppColors.black262626,
//                             ),
//                             onPressed: () async {
//                               Get.back();
//                               final imageList =
//                                   await imagePicker.pickMultiImage();

//                               if (imageList.isNotEmpty) {
//                                 imageList.forEach((image) async {
//                                   ///
//                                   final temp = await ImageCompress.compress(
//                                     File(image.path),
//                                   );

//                                   ///
//                                   final sizeBytes = await temp?.length();

//                                   ///
//                                   if (photoPathList.length >=
//                                       widget.maximumPhoto) {
//                                     await CustomDialog.warningMessageDialog(
//                                       message: TranslationData
//                                           .allow_photo_only_three,
//                                       buttonFillColor: AppColors.redEB5757,
//                                     );
//                                     return;
//                                   }
//                                   if (temp != null) {
//                                     photoPathList.add(temp);
//                                     widget.onPhotoAdded(photoPathList);
//                                     setState(() {});
//                                   }
//                                 });
//                               }
//                             },
//                           ),
//                         ],
//                         cancelButton: CupertinoActionSheetAction(
//                           isDefaultAction: true,
//                           onPressed: Get.back,
//                           child: TextWidget(
//                             'Cancel',
//                             color: AppColors.redEB5757,
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 },
//                 child: Container(
//                   decoration: ContainerDecoration.rounded(
//                     borderColor: AppColors.greyE0E0E0,
//                   ),
//                   width: 110,
//                   height: 140,
//                   child: SvgPicture.asset(
//                     SvgAsset.plus,
//                     height: 40,
//                     width: 40,
//                     fit: BoxFit.scaleDown,
//                   ),
//                 ),
//               ),
//               const SizedBox(width: AppStyle.SPACING_SMALL),
//               ListView.separated(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 scrollDirection: Axis.horizontal,
//                 itemCount: widget.photoUrlList.length,
//                 separatorBuilder: (context, index) => const SizedBox(
//                   width: AppStyle.SPACING_SMALL,
//                 ),
//                 itemBuilder: (context, index) {
//                   return Stack(
//                     children: [
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(10),
//                         child: SizedBox(
//                           width: 100,
//                           height: 140,
//                           child: ImageWidget(
//                             photoModel: widget.photoUrlList[index],
//                             height: 50,
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         right: 0,
//                         top: 0,
//                         child: GestureDetector(
//                           onTap: () {
//                             widget.onExistedPhotoRemove(
//                               widget.photoUrlList[index].id,
//                             );
//                             widget.photoUrlList.removeAt(index);
//                             setState(() {});
//                           },
//                           child: Container(
//                             width: 30,
//                             height: 30,
//                             padding: const EdgeInsets.all(6),
//                             decoration: const BoxDecoration(
//                               borderRadius: BorderRadius.only(
//                                 bottomLeft: Radius.circular(10),
//                                 topRight: Radius.circular(10),
//                               ),
//                               color: AppColors.redEB5757,
//                             ),
//                             child: SvgPicture.asset(
//                               SvgAsset.recycleBin,
//                             ),
//                           ),
//                         ),
//                       )
//                     ],
//                   );
//                 },
//               ),
//               const SizedBox(width: AppStyle.SPACING_SMALL),
//               ListView.separated(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 scrollDirection: Axis.horizontal,
//                 itemCount: photoPathList.length,
//                 separatorBuilder: (context, index) => const SizedBox(
//                   width: AppStyle.SPACING_SMALL,
//                 ),
//                 itemBuilder: (context, index) {
//                   return Stack(
//                     children: [
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(10),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             border: Border.all(
//                               color: AppColors.greyE0E0E0,
//                             ),
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           width: 100,
//                           height: 140,
//                           child: Image.file(
//                             File(
//                               photoPathList[index].path,
//                             ),
//                             height: 50,
//                             fit: BoxFit.fitWidth,
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         right: 0,
//                         top: 0,
//                         child: GestureDetector(
//                           onTap: () {
//                             photoPathList.removeAt(index);
//                             setState(() {});
//                           },
//                           child: Container(
//                             width: 30,
//                             height: 30,
//                             padding: const EdgeInsets.all(6),
//                             decoration: const BoxDecoration(
//                               borderRadius: BorderRadius.only(
//                                 bottomLeft: Radius.circular(10),
//                                 topRight: Radius.circular(10),
//                               ),
//                               color: AppColors.redEB5757,
//                             ),
//                             child: SvgPicture.asset(
//                               SvgAsset.recycleBin,
//                             ),
//                           ),
//                         ),
//                       )
//                     ],
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
