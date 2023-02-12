import 'package:flutter/material.dart';

import '../repositories/students_repository.dart';

class StudentsPage extends StatefulWidget {
  final StudentsRepository studentsRepository;
  const StudentsPage(this.studentsRepository, {Key? key}) : super(key: key);

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Öğrenciler"),
        ),
        body: Column(
          children: [
             PhysicalModel(
              color: Colors.white,
              elevation: 20,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 32.0),
                  child: Text("${widget.studentsRepository.students.length} Öğrenci"),
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index)
                => StudentRow(widget.studentsRepository.students[index], widget.studentsRepository),

                separatorBuilder: (context, index) => const Divider(),
                itemCount: widget.studentsRepository.students.length,
              ),
            )
          ],
        ));
  }
}

class StudentRow extends StatefulWidget {
  final Student student;
  final StudentsRepository studentsRepository;
  const StudentRow(this.student, this.studentsRepository, {
    super.key,
  });

  @override
  State<StudentRow> createState() => _StudentRowState();
}

class _StudentRowState extends State<StudentRow> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("${widget.student.firstName} ${widget.student.lastName}"),
      leading: Icon(widget.student.gender == "Erkek" ? Icons.man : Icons.woman),
      trailing:IconButton(
          onPressed: () {
            setState(() {
              widget.studentsRepository.like(widget.student);

            });

      },
          icon: Icon(widget.student.isLiked == true ? Icons.favorite : Icons.favorite_border)) ,
    );
  }
}
