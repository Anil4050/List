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
    ListScreenController logicController = Get.put(ListScreenController());
    // List<String> headerList;
    // List<Mymodel> listPosts = [];

    TextEditingController headText = TextEditingController();
    TextEditingController subHeader = TextEditingController();
    TextEditingController titleIndex = TextEditingController();

    @override
    void initState() {
      super.initState();
      logicController = Get.put(ListScreenController());
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
                    controller: titleIndex,
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
                  if (subHeader.text.length > 0 && titleIndex.text.length > 0) {
                    logicController.addtitle(id, subHeader.text);
                    setState(() {});
                    subHeader.clear();
                    titleIndex.clear();
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
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 2),
                            blurRadius: 12,
                            color: Color.fromRGBO(0, 0, 0, 0.16),
                          )
                        ],
                        color: Colors.white,
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
                      // showDialog(titleIndex);
                      if (headText.text.length > 0) {
                        setState(() {
                          logicController.checkHeaderEmpty(headText.text);
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
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(0, 2),
                              blurRadius: 12,
                              color: Color.fromRGBO(0, 0, 0, 0.16),
                            )
                          ],
                          color: Colors.white,
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

              // Container(
              //   height: 500,
              //   width: 500,
              //   child: GridView.count(
              //     //use GridView.count for independent to silver layout
              //     crossAxisCount: 2, //
              //     //scrollDirection: Axis.horizontal, //set this for horizontal scroll direction
              //     shrinkWrap: true,
              //     children: logicController.map((people) {
              //       //user peoplelist.map to loop over the list
              //       return Card(
              //           elevation: 10, //shadow elevation for card
              //           margin: EdgeInsets.all(8),
              //           child: Container(
              //               color: Colors.orange[100],
              //               child: Column(
              //                 mainAxisAlignment: MainAxisAlignment
              //                     .center, //main axix alignemnt to center
              //                 children: <Widget>[
              //                   Text(people.header.toString(),
              //                       style: const TextStyle(fontSize: 20)),
              //                   //  Text(people.address, style: TextStyle(fontSize:13)),

              //                   //  Container(
              //                   //    margin: EdgeInsets.only(top:20),
              //                   //    child:RaisedButton.icon(
              //                   //       onPressed: (){
              //                   //           print('Clicked on view details: ' + people.id);
              //                   //           //add more action for this button
              //                   //           //Navigator.push() to show details in new page
              //                   //       },
              //                   //       icon: Icon(Icons.person),
              //                   //       label: Text("View Details"),
              //                   //       color: Colors.redAccent,
              //                   //       colorBrightness: Brightness.dark,
              //                   //        //color brightness is dark becaause its background is dark color
              //                   //     )
              //                   //  ),

              //                   Container(
              //                     margin: EdgeInsets.only(top: 0),
              //                     //  child:RaisedButton.icon(
              //                     //     onPressed: (){
              //                     //         print('Clicked on send email: ' + people.id);
              //                     //         //add more action for this button
              //                     //         //Navigator.push() to show details in new page
              //                     //     },
              //                     //     icon: Icon(Icons.mail),
              //                     //     label: Text("Send Email"),
              //                     //     color: Colors.blueAccent,
              //                     //     colorBrightness: Brightness.dark,
              //                     //      //color brightness is dark becaause its background is dark color
              //                     // )
              //                   )
              //                 ],
              //               )));
              //     }).toList(), //don't forget to to add .toList() at last of map
              //   ),
              // )
              Center(
                child: Container(
                  // color: Colors.amber,
                  margin: EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: MediaQuery.of(context).size.height * 0.7,
                  child: ListView.builder(
                    itemCount: logicController.list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.only(top: 10.0),
                        decoration: BoxDecoration(
                            // border: Border.all(),
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0, 2),
                                blurRadius: 12,
                                color: Color.fromRGBO(0, 0, 0, 0.16),
                              )
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0)),
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  logicController.list[index].header.toString(),
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 20),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: IconButton(
                                      onPressed: () {
                                        showDialog(index);
                                      },
                                      icon: const Icon(
                                        Icons.add,
                                        color: Colors.green,
                                      )),
                                ),
                                IconButton(
                                    onPressed: () {
                                      logicController.removeHeader(index);
                                      setState(() {});
                                    },
                                    icon: const Icon(
                                      Icons.remove,
                                      color: Colors.red,
                                    ))
                              ],
                            ),
                            VerticalDivider(),
                            Container(
                              height: 100,
                              child: ListView.builder(
                                itemCount: logicController.title.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: Text(logicController
                                              .title[index].title
                                              .toString()),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              logicController
                                                  .removeTitle(index);
                                              setState(() {});
                                            },
                                            icon: const Icon(
                                              Icons.remove,
                                              color: Colors.red,
                                            ))
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
