import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TeachersRepository extends ChangeNotifier {
  List<Teacher> teachers =[
    Teacher("Mustafa", "Akgün", 36, "Erkek"),
    Teacher("Cemal", "Taş", 30, "Erkek"),
    Teacher("Ezgi", "Kaya", 34, "Kadın"),
    Teacher("Ceyda", "Yıldız", 45, "Kadın"),
  ];
}

final teachersProvider = ChangeNotifierProvider((ref){
  return TeachersRepository();
});

class Teacher{
  String firstName;
  String lastName;
  int age;
  String gender;
  Teacher(this.firstName,this.lastName,this.age,this.gender);

}