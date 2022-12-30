import 'package:flutter/cupertino.dart';

class listModel {
  String? header;

  listModel({
    required this.header,
  });

  // listModel.fromJson(Map<String, dynamic> json) {
  //   if (json['header'] != null) {
  //     header = <Header>[];
  //     json['header'].forEach((v) {
  //       header!.add(new Header.fromJson(v));
  //     }
  //   );
  // }
  // }
}

class Title {
  int? id;

  String? title;

  Title({this.id, this.title});

  Title.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    title = json['title'];
  }
}
