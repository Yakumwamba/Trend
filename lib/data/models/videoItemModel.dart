import 'package:algolia/algolia.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VideoItemModel {
  String vid;
  String title;
  String videoUrl;

  VideoItemModel({vid, name, videoUrl});

  VideoItemModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    this.vid = doc['vid'];
    this.title = doc['title'];
    this.videoUrl = doc['video_url'];
  }

  //  VideoItemModel.fromAlgoliaSnapshot(AlgoliaQuerySnapshot algo) {
  //   this.vid = algo;
  //   this.title = algo['title'];
  //   this.videoUrl = algo['video_url'];
  // }
}
