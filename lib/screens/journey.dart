import 'package:bus_services/models/dummydata.dart';
import 'package:bus_services/models/student.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bus_services/globals.dart' as globals;
import 'package:string_validator/string_validator.dart';

import '../models/bus.dart';

class JourneyDetailPage extends StatefulWidget {
  final Bus bus;

  const JourneyDetailPage({Key? key, required this.bus}) : super(key: key);

  @override
  State<JourneyDetailPage> createState() => _JourneyDetailPageState();
}

class _JourneyDetailPageState extends State<JourneyDetailPage> {
  double screenwidth = 100, screenheight = 100;
  List<String> _items = [
    "Pich Home",
    "Drop School",
    "Pick School",
    "Drop Home",
    "Absent",
  ];

  List selected = [];
  bool searchOn = false;
  int idSel = -1;
  List stuDetails = [];
  List studentsOnBoard = <Student>[];
  bool loading = true;
  bool noData = false;
  TextEditingController stuId = TextEditingController(text: "");

  @override
  void initState() {
    List stuIds = widget.bus.students.map((e) => e["id"]).toList();
    stuDetails = widget.bus.students.map((e) => e["id"]).toList();
    for (int i = 0; i < students.length; i++) {
      if (stuIds.contains(students[i]["Gr_num"])) {
        studentsOnBoard.add(Student.fromMap(students[i]));
      }
      String select = "Absent";
      selected.add(select);

      setState(() {
        loading = false;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenheight = size.height;
    screenwidth = size.width;
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Ride Details"),
          excludeHeaderSemantics: true,
          primary: true,
          centerTitle: true,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(40),
                  bottomLeft: Radius.circular(40))),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(screenheight * 0.11),
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(40),
                      bottomLeft: Radius.circular(40))),
              child: Padding(
                padding:
                    const EdgeInsets.only(bottom: 25.0, left: 25, right: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Bus No: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            widget.bus.bus_num,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Batch: ",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            widget.bus.batch,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Timing: ",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            widget.bus.time,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        floatingActionButton: Visibility(
          visible: loading || noData || searchOn,
            child: FloatingActionButton(

              onPressed: (){
                setState(() {
                  stuId.clear();
                  idSel = -1;
                  loading = false;
                  noData = false;
                  searchOn = false;

                });
              },
              backgroundColor: Colors.red,
              child: Icon(
                Icons.clear,
                color: Colors.white,
              ),
            ),
        ),

        //body
        body: loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: stuId,
                      onSubmitted: (str) {
                        setState(() {
                          loading = true;
                        });

                        if (isNumeric(stuId.text)) {
                          if (stuDetails.contains(stuId.text)) {
                            setState(() {
                              noData = false;
                              idSel = int.tryParse(stuId.text) ?? -1;
                              searchOn = true;
                            });
                          } else {
                            setState(() {
                              noData = true;
                              idSel = -1;
                            });
                          }
                        }
                        setState(() {
                          loading = false;
                        });
                      },
                      decoration: InputDecoration(
                          hintText: "Search Gr no.",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () {
                              setState(() {
                                loading = true;
                              });

                              if (isNumeric(stuId.text)) {
                                if (stuDetails.contains(stuId.text)) {
                                  setState(() {
                                    noData = false;
                                    idSel = int.tryParse(stuId.text) ?? -1;
                                    searchOn = true;
                                  });
                                } else {
                                  setState(() {
                                    noData = true;
                                    idSel = -1;
                                  });
                                }
                              }

                              setState(() {
                                loading = false;
                              });
                            },
                          )),
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        ListView.builder(
                          itemCount: widget.bus.students.length,
                          itemBuilder: (context, index) {
                            String img = studentsOnBoard[index].student_img;
                            return Visibility(
                              visible: (!searchOn) ||
                                  (searchOn &&
                                      (idSel ==
                                          int.parse(
                                              studentsOnBoard[index].Gr_num))),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: screenwidth < 640
                                          ? [
                                              Expanded(child: Container()),
                                              Container(
                                                width: 70,
                                                height: 80,
                                                color: globals.primary
                                                    .withOpacity(0.3),
                                                child: Image.network(
                                                  img,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              Expanded(child: Container()),
                                              Expanded(child: Container()),
                                              SizedBox(
                                                width: screenwidth * 0.6,
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      width: screenwidth * 0.7,
                                                      child: Text(
                                                          studentsOnBoard[index]
                                                              .Name,
                                                          overflow: TextOverflow
                                                              .clip),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Text(
                                                                "Sr. no: ${index + 1}"),
                                                            Text(
                                                                "Gr no: ${studentsOnBoard[index].Gr_num}"),
                                                          ],
                                                        ),
                                                        Container(
                                                          height: 40,
                                                          color:
                                                              globals.primary,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child:
                                                                SingleChildScrollView(
                                                              physics:
                                                                  NeverScrollableScrollPhysics(),
                                                              child:
                                                                  DropdownButton<
                                                                      String>(
                                                                value: selected[
                                                                    index],
                                                                items: _items
                                                                    .map(
                                                                      (e) => DropdownMenuItem<
                                                                              String>(
                                                                          value:
                                                                              e,
                                                                          child:
                                                                              Text(
                                                                            e,
                                                                            style:
                                                                                TextStyle(
                                                                              color: Colors.white,
                                                                              fontSize: 15,
                                                                            ),
                                                                          )),
                                                                    )
                                                                    .toList(),
                                                                onChanged:
                                                                    (String?
                                                                        value) {
                                                                  setState(() {
                                                                    selected[
                                                                            index] =
                                                                        value!;
                                                                  });
                                                                },
                                                                icon: const Icon(
                                                                    Icons
                                                                        .arrow_drop_down,
                                                                    color: Colors
                                                                        .white),
                                                                underline: Visibility(
                                                                    visible:
                                                                        false,
                                                                    child:
                                                                        Container()),
                                                                dropdownColor:
                                                                    globals
                                                                        .primary,
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                isDense: true,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(child: Container()),
                                            ]
                                          : [
                                              Expanded(child: Container()),
                                              Container(
                                                width: 70,
                                                height: 80,
                                                color: globals.primary
                                                    .withOpacity(0.3),
                                                child: Image.network(
                                                  img,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              Expanded(child: Container()),
                                              Expanded(child: Container()),
                                              SizedBox(
                                                width: screenwidth * 0.3,
                                                child: Text(
                                                    studentsOnBoard[index].Name,
                                                    overflow:
                                                        TextOverflow.clip),
                                              ),
                                              Expanded(child: Container()),
                                              Text("Sr. no: ${index + 1}"),
                                              Expanded(child: Container()),
                                              Text(
                                                  "Gr no: ${studentsOnBoard[index].Gr_num}"),
                                              Expanded(child: Container()),
                                              Container(
                                                height: 40,
                                                color: globals.primary,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: SingleChildScrollView(
                                                    physics:
                                                        const NeverScrollableScrollPhysics(),
                                                    child:
                                                        DropdownButton<String>(
                                                      value: selected[index],
                                                      items: _items
                                                          .map(
                                                            (e) =>
                                                                DropdownMenuItem<
                                                                        String>(
                                                                    value: e,
                                                                    child: Text(
                                                                      e,
                                                                      style:
                                                                          const TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            15,
                                                                      ),
                                                                    )),
                                                          )
                                                          .toList(),
                                                      onChanged:
                                                          (String? value) {
                                                        setState(() {
                                                          selected[index] =
                                                              value!;
                                                        });
                                                      },
                                                      icon: const Icon(
                                                          Icons.arrow_drop_down,
                                                          color: Colors.white),
                                                      underline: Visibility(
                                                          visible: false,
                                                          child: Container()),
                                                      dropdownColor:
                                                          globals.primary,
                                                      alignment:
                                                          Alignment.center,
                                                      isDense: true,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Expanded(child: Container()),
                                            ],
                                    ),
                                  ),
                                  Divider(),
                                ],
                              ),
                            );
                          },
                        ),
                        Visibility(
                          visible: loading,
                          child: Container(
                            color: Colors.white,
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: noData,
                          child: Container(
                            color: Colors.white,
                            child: const Center(
                              child: Text("NO Such Student Exists"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
