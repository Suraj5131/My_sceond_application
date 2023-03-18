class Bus{
  late String bus_num;
  late String batch;
  late DateTime timing;
  late String time;
  late List students;

  Bus.fromMap(Map map){
    bus_num = map["bus_num"];
    batch = map["batch"];
    timing = DateTime.fromMillisecondsSinceEpoch(int.parse(map["timing"])*1000);
    students= map["students"];
    String hr = timing.hour.toString().length==1?"0"+timing.hour.toString():timing.hour.toString();
    String min = timing.second.toString().length==1?"0"+timing.second.toString():timing.second.toString();
    time = "$hr:$min";
  }

  Map toMap(){
    Map map = {
      "bus_num": bus_num,
      "batch": batch,
      "timing": (timing.millisecondsSinceEpoch*1000).toString(),
      "students": students
    };
    return map;
  }

}