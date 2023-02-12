class Teacher {
  String firstName;
  String lastName;
  int age;
  String gender;

  Teacher(this.firstName, this.lastName, this.age, this.gender);

  Teacher.fromMap(Map<String, dynamic> map)
      : this(map['firstName'], map['lastName'], map['age'], map['gender']);


}
