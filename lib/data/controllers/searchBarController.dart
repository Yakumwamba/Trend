import 'package:Trend/data/models/videoItemModel.dart';
import 'package:algolia/algolia.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBarController extends GetxController {
  final searched = false.obs;
  final showCancel = false.obs;
  final searching = false.obs;

  final query = "".obs;
  final Rx<TextEditingController> searchTextController =
      TextEditingController().obs;
  Algolia algolia;
  final List<dynamic> results = [];

  void setSearching(value) => searching.value = value;

  @override
  void onInit() {
    super.onInit();
    algolia = Algolia.init(
      applicationId: 'KOIQ0KB89Y',
      apiKey: '0a2bc213fda02eb628ec510554890b3c',
    );
  }

  Future<AlgoliaQuerySnapshot> _algoSearch(String searchTerm) async {
    AlgoliaQuery query = algolia.instance.index('videos').search(searchTerm);
    AlgoliaQuerySnapshot snap = await query.getObjects();

    //snap.hits.map((e) => null)
    print("Algolia information ${snap.nbHits}");
    print("The result at index 0 is : ${snap.hits[0].data}");
    if(snap.nbHits > 0 ) {
      snap.hits.map((result) {
        results.add(result.data);
        print("${result.data}");
      });

    }
    return snap;
  }

  void search() {
    setSearching(true);
    debounce(query, (_) {
      Get.log("Starting the search API...${query}");

      try {
        _algoSearch(query.value).then((value) {
          print("Finished searching");

          if (value.hits.length == 0) {
            print("No results found");
            setSearching(false);
            return;
          } else {

            setSearching(false);
          }
        });
      } catch (e) {}
    }, time: Duration(seconds: 2));
      print(results);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();

    ///searchTextController.clear();
  }
}
