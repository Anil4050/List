class ListData {
  final String? header;
  final List<SubList>? subHead;

  ListData({this.header, this.subHead});
}

class SubList {
  final String header;
  final int id;

  SubList(this.header, this.id);
}

// class listModel {
//   String? header;

//   List<String>? subHeader;

//   listModel({
//     required this.header,
//     required this.subHeader,
//   });

//   listModel.fromJson(Map<String, dynamic> json) {
//     header = json['state'];
//     subHeader = json['lgas'].cast<String>();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['header'] = this.header;
//     data['subHeader'] = this.subHeader;

//     return data;
//   }
// }
