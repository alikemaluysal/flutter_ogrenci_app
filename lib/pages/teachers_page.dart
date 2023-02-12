import 'package:flutter/material.dart';

import '../repositories/teachers_repository.dart';


class TeachersPage extends StatefulWidget {
  final TeachersRepository teachersRepository;
  const TeachersPage(this.teachersRepository, {Key? key}) : super(key: key);

  @override
  State<TeachersPage> createState() => _TeachersPageState();
}

class _TeachersPageState extends State<TeachersPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Öğretmenler"),
      ),
        body: Column(
          children: [
            PhysicalModel(
              color: Colors.white,
              elevation: 20,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 32.0),
                  child: Text("${widget.teachersRepository.teachers.length} Öğretmen"),
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index)
                => TeacherRow(widget.teachersRepository.teachers[index]),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: widget.teachersRepository.teachers.length,
              ),
            )
          ],
        ));

  }
}

class TeacherRow extends StatelessWidget {
  final Teacher teacher;
  const TeacherRow(this.teacher, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("${teacher.firstName} ${teacher.lastName}"),
      leading: Icon(teacher.gender == "Erkek" ? Icons.man : Icons.woman),
    );
  }
}
