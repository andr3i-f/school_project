import 'requisites.dart';

class Course {
  Course(this.identifier, this.number, this.name, this.description);

  String? identifier;
  String? number;
  String? name;
  String? description;

  List<Requisite> prereqs = <Requisite>[];
  List<Requisite> coreqs = <Requisite>[];
}
