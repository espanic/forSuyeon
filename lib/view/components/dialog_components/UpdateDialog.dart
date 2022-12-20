// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:for_suyeon/colors.dart';
// import 'package:for_suyeon/view/components/dialog_components/BelowButton.dart';
// import 'package:for_suyeon/view/components/dialog_components/icon_text_row.dart';
// import 'package:image_picker/image_picker.dart';
//
// import '../../../const.dart';
//
// class UpdateDialog extends StatefulWidget {
//   final HistoryBlock currentBlock;
//
//   const UpdateDialog({Key? key, required this.currentBlock}) : super(key: key);
//
//   @override
//   State<UpdateDialog> createState() => _CustomDialogState();
// }
//
// class _CustomDialogState extends State<UpdateDialog> {
//   final ImagePicker _picker = ImagePicker();
//   final _textController = TextEditingController();
//   // final _dataController = Get.put(DataController());
//   File? _newImageFile;
//
//   @override
//   Widget build(BuildContext context) {
//     _textController.text = widget.currentBlock.content;
//     var _width = MediaQuery.of(context).size.width;
//     return AlertDialog(
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.all(Radius.circular(10)),
//       ),
//       insetPadding: const EdgeInsets.all(mainPadVal),
//       scrollable: true,
//       title: Text(
//         "사진 편집하기",
//         style: Theme.of(context).textTheme.headline4,
//       ),
//       content:
//           _newImageFile == null ? _beforePickImage(_width) : _afterPickImage(),
//       actions: [
//         _belowButtons(context),
//       ],
//     );
//   }
//
//   Widget _belowButtons(BuildContext context) {
//     return BelowButton(
//       text1: "확인",
//       text2: "취소",
//       onPressed1: () async {
//         await _dataController.updateData(
//             widget.currentBlock, _textController.text, _newImageFile);
//         Navigator.pop(context);
//       },
//       onPressed2:  () {
//         _newImageFile = null;
//         Navigator.pop(context);
//       },
//     );
//
//   }
//
//   Widget _afterPickImage() {
//     return Column(
//       children: [
//         ClipRRect(
//           borderRadius: BorderRadius.circular(5),
//           child: Image.file(
//             _newImageFile!,
//           ),
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         Form(
//           child: TextFormField(
//             maxLines: 4,
//             controller: _textController,
//             autofocus: true,
//             cursorColor: buttonPrimary,
//             decoration: const InputDecoration(
//               labelText: "내용을 입력하세요.",
//               labelStyle: TextStyle(color: buttonPrimary),
//               enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(width: 2, color: buttonPrimary),
//               ),
//               focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(width: 2, color: buttonPrimary)),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _beforePickImage(double width) {
//     return SizedBox(
//       width: width - 100,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(10),
//             child: widget.currentBlock.image,
//           ),
//           SimpleDialogOption(
//             padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
//             child: const IconTextRow(text: "앨범에서 선택하기", icon: Icons.image),
//             onPressed: _pickImgFromGallery,
//           ),
//           SimpleDialogOption(
//             padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
//             child: const IconTextRow(text: "카메라로 촬영하기", icon: Icons.camera_alt),
//             onPressed: _pickImgFromCamera,
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Form(
//             child: TextFormField(
//               maxLines: 3,
//               controller: _textController,
//               autofocus: false,
//               cursorColor: buttonPrimary,
//               decoration: const InputDecoration(
//                 labelText: "내용을 입력하세요.",
//                 labelStyle: TextStyle(color: buttonPrimary),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(width: 2, color: buttonPrimary),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(width: 2, color: buttonPrimary)),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   void _pickImgFromGallery() async {
//     final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
//     if (image != null) {
//       setState(() {
//         print("setstate");
//         _newImageFile = File(image.path);
//       });
//     }
//   }
//
//   void _pickImgFromCamera() async {
//     final XFile? image = await _picker.pickImage(source: ImageSource.camera);
//     if (image != null) {
//       setState(() {
//         print("setstate");
//         _newImageFile = File(image.path);
//       });
//     }
//   }
// }
