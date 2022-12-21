import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/Model/HeaderModel.dart';

import '../Controller/ListScreenController.dart';

class listScreen extends StatefulWidget {
  const listScreen({Key? key}) : super(key: key);

  @override
  State<listScreen> createState() => _listScreenState();
}

class _listScreenState extends State<listScreen> {
  @override
  Widget build(BuildContext context) {
    // List<String> headerList;
    List<ListData> listPosts = [];

    TextEditingController headText = TextEditingController();
    TextEditingController subHeader = TextEditingController();
    TextEditingController index = TextEditingController();
    ListScreenController logicController = ListScreenController();
    @override
    void initState() {
      super.initState();
      setState(() {
        // headerList;
      });
    }

    @override
    void didChangeDependencies() {
      super.didChangeDependencies();
      setState(() {});
    }

    showDialog(id) {
      return Get.defaultDialog(
          title: "Add New Data",
          middleText: "Fill The Ditail",
          // backgroundColor: Colors.blue.withOpacity(0.1),
          titleStyle: const TextStyle(color: Colors.black),
          middleTextStyle: const TextStyle(color: Colors.grey),

          // barrierDismissible: false,
          radius: 30,
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Title"),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                height: 50,
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Center(
                  child: TextField(
                    controller: subHeader,
                    decoration: const InputDecoration(
                      hintText: 'Title',
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Index"),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                height: 50,
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Center(
                  child: TextField(
                    controller: index,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Index',
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: (() {
                  if (subHeader.text.length > 0 && index.text.length > 0) {
                    setState(() {
                      listPosts.add(ListData(subHead: [
                        SubList(subHeader.text, int.parse(index.text))
                      ]));
                    });
                    subHeader.clear();
                    index.clear();
                    Get.back();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Title Added"),
                    ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Text is empty"),
                    ));
                  }
                }),
                child: Center(
                  child: Container(
                    //  margin: const EdgeInsets.only(right: 20),
                    // padding: const EdgeInsets.symmetric(
                    //     vertical: 50, horizontal: 10),
                    height: 45,
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                        color: Colors.deepPurple.withOpacity(0.9),
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Center(
                      child: Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ));
    }

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Center(
                      child: TextField(
                        controller: headText,
                        decoration: const InputDecoration(
                          hintText: 'Header',
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    // behavior: HitTestBehavior.opaque,
                    onTap: (() async {
                      showDialog(index);
                      if (headText.text.length > 0) {
                        setState(() {
                          // headerList.add(headText.text);
                          listPosts.add(
                              ListData(header: headText.text, subHead: []));
                          // print(listPosts[0].header);
                        });
                        headText.clear();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Header Added"),
                        ));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Text is empty"),
                        ));
                      }

                      // String res =
                      //     await logicController.checkHeaderEmpty(headText.text);
                      // if (res == "add") {
                      //   headText.text = "";
                      //   print(headText.text);
                      // }
                    }),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.orange),
                          borderRadius: BorderRadius.circular(7.0)),
                      child: const Icon(
                        Icons.add,
                        color: Colors.green,
                        size: 30,
                      ),
                    ),
                  )
                ],
              ),
              const Text("List"),
              const VerticalDivider(),

              Container(
                height: 500,
                width: 500,
                child: GridView.count(
                  //use GridView.count for independent to silver layout
                  crossAxisCount: 2, //
                  //scrollDirection: Axis.horizontal, //set this for horizontal scroll direction
                  shrinkWrap: true,
                  children: listPosts.map((people) {
                    //user peoplelist.map to loop over the list
                    return Card(
                        elevation: 10, //shadow elevation for card
                        margin: EdgeInsets.all(8),
                        child: Container(
                            color: Colors.orange[100],
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment
                                  .center, //main axix alignemnt to center
                              children: <Widget>[
                                Text(people.header.toString(),
                                    style: const TextStyle(fontSize: 20)),
                                //  Text(people.address, style: TextStyle(fontSize:13)),

                                //  Container(
                                //    margin: EdgeInsets.only(top:20),
                                //    child:RaisedButton.icon(
                                //       onPressed: (){
                                //           print('Clicked on view details: ' + people.id);
                                //           //add more action for this button
                                //           //Navigator.push() to show details in new page
                                //       },
                                //       icon: Icon(Icons.person),
                                //       label: Text("View Details"),
                                //       color: Colors.redAccent,
                                //       colorBrightness: Brightness.dark,
                                //        //color brightness is dark becaause its background is dark color
                                //     )
                                //  ),

                                Container(
                                  margin: EdgeInsets.only(top: 0),
                                  //  child:RaisedButton.icon(
                                  //     onPressed: (){
                                  //         print('Clicked on send email: ' + people.id);
                                  //         //add more action for this button
                                  //         //Navigator.push() to show details in new page
                                  //     },
                                  //     icon: Icon(Icons.mail),
                                  //     label: Text("Send Email"),
                                  //     color: Colors.blueAccent,
                                  //     colorBrightness: Brightness.dark,
                                  //      //color brightness is dark becaause its background is dark color
                                  // )
                                )
                              ],
                            )));
                  }).toList(), //don't forget to to add .toList() at last of map
                ),
              )
              // Center(
              //   child: Container(
              //     color: Colors.amber,
              //     height: MediaQuery.of(context).size.height * 0.8,
              //     width: MediaQuery.of(context).size.height * 0.7,
              //     child: ListView.builder(
              //       itemCount: listPosts.length,
              //       itemBuilder: (BuildContext context, int index) {
              //         return Container(
              //           decoration: BoxDecoration(border: Border.all()),
              //           padding: const EdgeInsets.all(5.0),
              //           child: Column(
              //             children: [
              //               Row(
              //                 mainAxisAlignment: MainAxisAlignment.center,
              //                 children: [
              //                   Text(listPosts[index].header.toString()),
              //                   IconButton(
              //                       onPressed: () {},
              //                       icon: const Icon(
              //                         Icons.add,
              //                         color: Colors.green,
              //                       )),
              //                   IconButton(
              //                       onPressed: () {},
              //                       icon: const Icon(
              //                         Icons.remove,
              //                         color: Colors.red,
              //                       ))
              //                 ],
              //               ),
              //               Container(
              //                 height: 100,
              //                 child: ListView.builder(
              //                   itemCount: 2,
              //                   itemBuilder: (BuildContext context, int index) {
              //                     return Container(
              //                       child: const Text("data"),
              //                     );
              //                   },
              //                 ),
              //               ),
              //             ],
              //           ),
              //         );
              //       },
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
