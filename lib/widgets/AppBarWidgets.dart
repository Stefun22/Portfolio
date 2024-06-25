// import 'package:flutter/material.dart';

// List<Widget> appBar({required List<String> cont}) {
//  return cont.map((e) {
//                 bool selected = e == selectedTile;
//                 return TextButton(
//                   style: ButtonStyle(
//                       backgroundColor: WidgetStatePropertyAll(selected
//                           ? Colors.green.withOpacity(0.3)
//                           : Colors.transparent)),
//                   onPressed: () {
//                     selectedTile = e;
//                     RenderObject? renderObject =
//                         keyForFrames[e]!.currentContext!.findRenderObject();
//                     renderObject!.showOnScreen(
//                         duration: const Duration(seconds: 2),
//                         curve: Curves.fastOutSlowIn)
//                   },
//                   child: Text(
//                     e,
//                     style: TextStyle(
//                         color: Colors.black.withOpacity(0.8),
//                         fontWeight: FontWeight.w600,
//                         letterSpacing: 0.5),
//                   ),
//                 );
//               }).toList(),
// }
