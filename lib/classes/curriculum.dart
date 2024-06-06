import 'course.dart';

class Curriculum {
  Curriculum(this.name, this.required_courses, this.elective_courses);

  String? name;
  List<Course>? required_courses;
  List<Course>? elective_courses;
}
