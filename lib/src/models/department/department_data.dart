class Department {
  final int departmentId;
  final String departmentName;

  Department({required this.departmentId, required this.departmentName});

  factory Department.fromMap(Map<String, dynamic> json) =>
      Department(departmentId: json[""], departmentName: json[""]);
}
