import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/teachers_repository.dart';


class TeachersPage extends ConsumerWidget {
  const TeachersPage( {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teachersRepository = ref.watch(teachersProvider);
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
                  child: Text("${teachersRepository.teachers.length} Öğretmen"),
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index)
                => TeacherRow(teachersRepository.teachers[index]),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: teachersRepository.teachers.length,
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
