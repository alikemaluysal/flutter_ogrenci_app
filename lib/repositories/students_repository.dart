
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StudentsRepository extends ChangeNotifier{
  List<Student> students =[
    Student("Ali", "Uysal", 21, "Erkek"),
    Student("Kemal", "Uysal", 21, "Erkek"),
    Student("Ayşe", "Kaya", 21, "Kadın"),
    Student("Fatma", "Yıldız", 21, "Kadın"),
  ];

  final Set<Student> likedStudents = {};

  void like(Student student){
    !likedStudents.contains(student) ? likedStudents.add(student) : likedStudents.remove(student);
  }

  bool isLiked(Student student){
    return likedStudents.contains(student);
  }


}


final studentsProvider = ChangeNotifierProvider((ref){
  return StudentsRepository();
});

class Student{
  String firstName;
  String lastName;
  int age;
  String gender;
  Student(this.firstName,this.lastName,this.age,this.gender);

}

