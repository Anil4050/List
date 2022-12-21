import 'package:get/get.dart';

class ListScreenController extends GetxController {
  List headerList = [];
  bool isLive = true;
  checkHeaderEmpty(text) {
    if (text != null && text != "") {
      addHeaderData(text);
      return "add";
    } else {
      return "Empty Not Allow";
    }
  }

  addHeaderData(header) {
    headerList!.add(header);
  }
}
