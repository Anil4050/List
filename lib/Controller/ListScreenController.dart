import 'package:get/get.dart';

import '../Model/HeaderModel.dart';

class ListScreenController extends GetxController {
  // late listModel? headerModel;
  bool isLive = true;
  List<listModel> list = [];
  List<Title> title = [];

  @override
  void onInit() async {
    super.onInit();
  }

  checkHeaderEmpty(text) {
    if (text != null && text != "") {
      addHeaderData(text);
      return "add";
    } else {
      return "Empty Not Allow";
    }
  }

  addHeaderData(text) {
    list.add(listModel(header: text));
  }

  addtitle(int index, text) {
    title.add(Title(id: index, title: text));
  }

  removeHeader(index) {
    list.removeAt(index);
  }

  removeTitle(index) {
    title.removeAt(index);
  }
}
