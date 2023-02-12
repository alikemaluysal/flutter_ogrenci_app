import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/students_repository.dart';
import 'package:ogrenci_app/models/student.dart';

class StudentsPage extends ConsumerWidget {
  const StudentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  padding: const EdgeInsets.symmetric(
                      vertical: 32.0, horizontal: 32.0),
                  child: Text(
                      "${ref.watch(studentsProvider).students.length} Öğrenci"),
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) =>
                    StudentRow(ref.watch(studentsProvider).students[index]),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: ref.watch(studentsProvider).students.length,
              ),
            )
          ],
        ));
  }
}

class StudentRow extends ConsumerStatefulWidget {
  final Student student;

  const StudentRow(
    this.student, {
    super.key,
  });

  @override
  ConsumerState<StudentRow> createState() => _StudentRowState();
}

class _StudentRowState extends ConsumerState<StudentRow> {
  @override
  Widget build(BuildContext context) {
    bool isLiked = ref.watch(studentsProvider).isLiked(widget.student);
    return ListTile(
      title: Text("${widget.student.firstName} ${widget.student.lastName}"),
      leading: Icon(widget.student.gender == "Erkek" ? Icons.man : Icons.woman),
      trailing: IconButton(
          onPressed: () {
            setState(() {
              ref.read(studentsProvider).like(widget.student);
            });
          },
          icon: Icon(isLiked == true ? Icons.favorite : Icons.favorite_border)),
    );
  }
}
