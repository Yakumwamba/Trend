import 'package:Trend/data/models/userModel.dart';
import 'package:Trend/data/models/videoItemModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


//place for algolia

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<bool> createUser(UserModel user) async {
    try {
      await _firestore
          .collection("users")
          .doc(user.id)
          .set({"name": user.name, "email": user.email});
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection("users").doc(uid).get();

      return UserModel.fromDocumentSnapshot(doc);
    } catch (e) {
      print(e);
      rethrow;
    }
  }


  addVideoItem(VideoItemModel video){

  }

  getVideoItem() {
    
  }

  getVideos() {

  }
}
