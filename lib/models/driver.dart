class Driver{
  late String id;
  late String name;
  late String img;
  late String phone;
  late String pass_word;

  Driver.fromMap(Map map){
    id = map["id"];
    name = map["name"];
    img = map["img"];
    phone= map["phone"];
    pass_word= map["pass_word"];
  }

  Map toMap(){
    Map map = {
      "id": id,
      "name":name,
      "img":img,
      "phone":phone,
      "pass_word":pass_word
    };
    return map;
  }

}