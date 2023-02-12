import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ogrenci_app/models/teacher.dart';
import 'package:ogrenci_app/services/data_service.dart';

class TeachersRepository extends ChangeNotifier {
  List<Teacher> teachers = [
    Teacher("Mustafa", "Akgün", 36, "Erkek"),
    Teacher("Cemal", "Taş", 30, "Erkek"),
    Teacher("Ezgi", "Kaya", 34, "Kadın"),
    Teacher("Ceyda", "Yıldız", 45, "Kadın"),
  ];
  final DataService dataService;

  TeachersRepository(this.dataService);

  Future<void> download() async {

    Teacher teacher = await dataService.downloadTeacher();


    teachers.add(teacher);
    notifyListeners();
  }
}

final teachersProvider = ChangeNotifierProvider((ref) {
  return TeachersRepository(ref.watch(dataServiceProvider));
});
