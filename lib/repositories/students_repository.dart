class StudentsRepository{
  List<Student> students =[
    Student("Ali", "Uysal", 21, "Erkek"),
    Student("Kemal", "Uysal", 21, "Erkek"),
    Student("Ayşe", "Kaya", 21, "Kadın"),
    Student("Fatma", "Yıldız", 21, "Kadın"),
  ];

  void like(Student student){
    student.isLiked = student.isLiked ? false : true;
  }

}

class Student{
  String firstName;
  String lastName;
  int age;
  String gender;
  bool isLiked = false;
  Student(this.firstName,this.lastName,this.age,this.gender);

}

