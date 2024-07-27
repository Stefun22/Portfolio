import 'package:cloud_firestore/cloud_firestore.dart';

class DevStackViewModel {
  FirebaseFirestore storeDB = FirebaseFirestore.instance;
  // Future<List<Project>> getProjects() async {
  //   try {
  //     List<Project> data = [];
  //     QuerySnapshot temp = await storeDB.collection("projects").get();
  //     temp.docs.map((e) {
  //       data.add(Project.fromJson(e.data() as Map<String, dynamic>));
  //     }).toList();
  //     return data;
  //   } on FirebaseException catch (e) {
  //     debugPrint(e.toString());
  //     return [];
  //   }
  // }

  // static Future<String?> downloadURLExample({required String fileName}) async {
  //   try {
  //     String downloadURL = await FirebaseStorage.instance
  //         .ref("project_images")
  //         .child(fileName)
  //         .getDownloadURL();
  //     return downloadURL;
  //   } on FirebaseException catch (e) {
  //     debugPrint(e.toString());
  //   }
  //   return null;
  // }
}
