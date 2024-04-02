class Patient {
  final String patientImage;
  final String patientName;
  final String patientAddress;
  final String patientBirthDate;
  final String patientBirthPlace;
  final String patientMothersDay;
  final String patientStatus;
  final String patientGender;
  final String patientDepartment;
  final String suggestedTreatment;

  Patient(
      {required this.patientImage,
      required this.patientName,
      required this.patientAddress,
      required this.patientBirthDate,
      required this.patientBirthPlace,
      required this.patientMothersDay,
      required this.patientStatus,
      required this.patientGender,
      required this.patientDepartment,
      required this.suggestedTreatment});

  factory Patient.fromMap(Map<String, dynamic> json) => Patient(
      patientImage: json["image"],
      patientName: json["user_name"],
      patientAddress: json[""],
      patientMothersDay: json[""],
      patientBirthPlace: json[""],
      patientStatus: json[""],
      patientBirthDate: json[""],
      patientGender: json[""],
      patientDepartment: json[""],
      suggestedTreatment: json[""]);
}
