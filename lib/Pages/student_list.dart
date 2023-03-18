import 'package:flutter/material.dart';
class Student_list extends StatefulWidget {

  const Student_list({Key? key}) : super(key: key);

  @override
  State<Student_list> createState() => _Student_listState();
}

class _Student_listState extends State<Student_list> {
  @override
  
  List<String> list=<String>["Pick Home ","Drop Home","Pick School","Drop School","Absent"];

  List<Map<String, dynamic>> studentist = [
    {"name": "SHAIKH MOHAMMAD RAIYAN SUFIYAN", "Enroll no": "127"},
    {"name": "Prasad Harshita Lallu", "Enroll no": "327"},
    {"name": "JAVHERI SAATVIK AMIT", "Enroll no": "522"},
    {"name": "NAJMI NAQIYA ABBAS", "Enroll no": "530"},
    {"name": "NAJMI INSIYA ABBAS", "Enroll no": "757"},
    {"name": "SHAIKH MOHAMMAD RAIYAN SUFIYAN", "Enroll no": "127"},
    {"name": "Prasad Harshita Lallu", "Enroll no": "327"},
    {"name": "JAVHERI SAATVIK AMIT", "Enroll no": "522"},
    {"name": "NAJMI NAQIYA ABBAS", "Enroll no": "530"},
    {"name": "NAJMI INSIYA ABBAS", "Enroll no": "757"},
    {"name": "SHAIKH MOHAMMAD RAIYAN SUFIYAN", "Enroll no": "127"},
    {"name": "Prasad Harshita Lallu", "Enroll no": "327"},
    {"name": "JAVHERI SAATVIK AMIT", "Enroll no": "522"},
    {"name": "NAJMI NAQIYA ABBAS", "Enroll no": "530"},
    {"name": "NAJMI INSIYA ABBAS", "Enroll no": "757"},
    {"name": "SHAIKH MOHAMMAD RAIYAN SUFIYAN", "Enroll no": "127"},
    {"name": "Prasad Harshita Lallu", "Enroll no": "327"},
    {"name": "JAVHERI SAATVIK AMIT", "Enroll no": "522"},
    {"name": "NAJMI NAQIYA ABBAS", "Enroll no": "530"},
    {"name": "NAJMI INSIYA ABBAS", "Enroll no": "757"},
  ];



  Widget build(BuildContext context) {
    var _value1;
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Student', style: TextStyle(color: Colors.black,fontSize: 25),),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.cancel,color: Colors.black,size: 30,),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body:  Center(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 0)
              ),
              height: 100,
              width: 300,
              child: Padding(
                padding: const EdgeInsets.only(left: 10,top: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(child: Text("Bus No.",style: TextStyle(fontSize: 20)),width: MediaQuery.of(context).size.width*.35,),
                        Text(": ",style: TextStyle(fontSize: 20)),
                        Text("MH04HY5133",style: TextStyle(fontSize: 20),),
                      ],
                    ),
                    Row(
                      children: [
                        Container(child: Text("Batch",style: TextStyle(fontSize: 20),),width: MediaQuery.of(context).size.width*.35,),
                        Text(": ",style: TextStyle(fontSize: 20)),
                        Text("batch_one",style: TextStyle(fontSize: 20),),
                      ],
                    ),
                    Row(
                      children: [
                        Container(child: Text("Timing",style: TextStyle(fontSize: 20),),width: MediaQuery.of(context).size.width*.35,),
                        Text(": ",style: TextStyle(fontSize: 20)),
                        Text("08:00",style: TextStyle(fontSize: 20),),
                      ],
                    ),
                  ],
                ),

              ),
            ),
            SizedBox(height: 10,),
            Divider(
              thickness: 1,
            ),
            Expanded(
              child: ListView.builder(itemCount: studentist.length,
                  itemBuilder:(context, index){
                    return Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 0,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage("assets/images/images.png"),
                          ),
                          SizedBox(width: 5,),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Name:",style: TextStyle(fontWeight: FontWeight.bold),),
                                      Expanded(child: Text("${studentist[index]['name']}")),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("No  :",style: TextStyle(fontWeight: FontWeight.bold)),
                                      Expanded(child: Text("${studentist[index]['Enroll no']}"))
                                    ],
                                  ),
                                  DropdownButton(
                                      hint: Text("Select"),
                                      value: _value1 != null ? _value1 : null,
                                      items: list.map((String val) {
                                        return DropdownMenuItem(
                                          value: val,
                                          child: Text(val),
                                        );
                                      }).toList(),

                                      onChanged: (newval){
                                        setState(() {
                                          _value1= newval!;
                                        });
                                      })
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            SizedBox(height: 20,),


          ],
        ),
      ),

    );
  }
}
