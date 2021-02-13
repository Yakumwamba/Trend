import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FeaturedVideosController extends GetxController {
  Future getFeaturedVideos() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection("featured_videos").get();
    return snapshot.docs;
  }

  Future<void> addVideoToFavourites(
      String userId, Map<String, dynamic> data) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .collection('favourites').doc().get().then((value) {

     

        });

    //return userRef.collection('favourites').add(data);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
