class Student{
  late String DOB;
  late String Enroll;
  late String Gr_num;
  late String Medium;
  late String Name;
  late String Section;
  late String Std;
  late String active_status;
  late String address;
  late String adhar_num;
  late String area_code;
  late String birth_place;
  late String caste;
  late String cont_num;
  late String email;
  late String f_name;
  late String gcm_id;
  late String gender;
  late String house;
  late String m_name;
  late String nationality;
  late String pass_word;
  late String religion;
  late String roll_no;
  late String session_time;
  late String student_img;
  late String whatsapp_no;

  Student.fromMap(Map map){
    DOB = map["DOB"];
    Enroll = map["Enroll"];
    Gr_num = map["Gr_num"];
    Medium= map["Medium"];
    Name = map["Name"];
    Section = map["Section"];
    Std = map["Std"];
    active_status= map["active_status"];
    address = map["address"];
    adhar_num = map["adhar_num"];
    area_code = map["area_code"];
    birth_place= map["birth_place"];
    caste = map["caste"];
    cont_num = map["cont_num"];
    email = map["email"];
    f_name= map["f_name"];
    gcm_id = map["gcm_id"];
    gender = map["gender"];
    house = map["house"];
    m_name= map["m_name"];
    nationality = map["nationality"];
    pass_word = map["pass_word"];
    religion = map["religion"];
    roll_no= map["roll_no"];
    session_time = map["session_time"];
    student_img = map["student_img"];
    whatsapp_no = map["whatsapp_no"];
  }

  Map toMap(){
    Map map = {
      "DOB": DOB,
      "Enroll":Enroll,
      "Gr_num":Gr_num,
      "Medium":Medium,
      "Name": Name,
      "Section":Section,
      "Std":Std,
      "active_status":active_status,
      "address": address,
      "adhar_num":adhar_num,
      "area_code":area_code,
      "birth_place":birth_place,
      "caste": caste,
      "cont_num":cont_num,
      "email":email,
      "f_name":f_name,
      "gcm_id": gcm_id,
      "gender":gender,
      "house":house,
      "m_name":m_name,
      "nationality": nationality,
      "pass_word":pass_word,
      "religion":religion,
      "roll_no":roll_no,
      "session_time": session_time,
      "student_img":student_img,
      "whatsapp_no":whatsapp_no,
    };
    return map;
  }
}