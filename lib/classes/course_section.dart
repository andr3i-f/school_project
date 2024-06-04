import 'package:enum_flag/enum_flag.dart';

enum Day with EnumFlag {
  monday, //1
  tuesday, //2
  wednesday, //4
  thursday, //8
  friday, //16
  saturday, //32
  sunday //64
}

class CourseSection {
  CourseSection(this.id, this.name, this.startTime, this.endTime, this.days,
      this.term, this.instructor);

  String? id;
  String? name;
  String? term;
  String? instructor;
  // Minutes normalized at 0 for 7AM.
  double? startTime;
  double? endTime;
  Set<Day>? days;
}
