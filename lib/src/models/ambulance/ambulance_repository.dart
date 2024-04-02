import 'package:hospital_mang2/src/models/ambulance/patient_data.dart';

class AmbulanceRepository {
  Future<List<Patient>> getLastPatient() async {
    List<Patient> patients = [
      Patient(
          patientImage:
              "https://th.bing.com/th/id/R.cd11bbffa7058e1e537714db756fd292?rik=S4NZoZfqS3il%2bQ&pid=ImgRaw&r=0",
          patientName: "test 1",
          patientAddress: "السويداء",
          patientBirthDate: "2024-02-01",
          patientBirthPlace: "السويداء",
          patientGender: "Man",
          patientMothersDay: "test 1",
          patientStatus: "حادث سير",
          patientDepartment: "القلبية",
          suggestedTreatment: "سيتامول"),
      Patient(
          patientImage:
              "https://th.bing.com/th/id/R.cd11bbffa7058e1e537714db756fd292?rik=S4NZoZfqS3il%2bQ&pid=ImgRaw&r=0",
          patientName: "test 2",
          patientStatus: "موت",
          patientAddress: "السويداء",
          patientBirthDate: "2024-02-01",
          patientBirthPlace: "السويداء",
          patientGender: "Man",
          patientMothersDay: "test 1",
          patientDepartment: "الهضمية",
          suggestedTreatment: "سيتامول"),
      Patient(
          patientImage:
              "https://th.bing.com/th/id/R.cd11bbffa7058e1e537714db756fd292?rik=S4NZoZfqS3il%2bQ&pid=ImgRaw&r=0",
          patientName: "test 3",
          patientStatus: "حادث ",
          patientAddress: "السويداء",
          patientBirthDate: "2024-02-01",
          patientBirthPlace: "السويداء",
          patientGender: "Man",
          patientMothersDay: "test 1",
          patientDepartment: "اسعاف",
          suggestedTreatment: "سيتامول"),
    ];
    return patients;
  }

  Future<List<Patient>> searchPatients(String patientName) async {
    List<Patient> patients = [
      Patient(
          patientImage:
              "https://th.bing.com/th/id/R.cd11bbffa7058e1e537714db756fd292?rik=S4NZoZfqS3il%2bQ&pid=ImgRaw&r=0",
          patientName: "test 1",
          patientAddress: "السويداء",
          patientBirthDate: "2024-02-01",
          patientBirthPlace: "السويداء",
          patientGender: "Man",
          patientMothersDay: "test 1",
          patientStatus: "حادث سير",
          patientDepartment: "القلبية",
          suggestedTreatment: "سيتامول"),
      Patient(
          patientImage:
              "https://th.bing.com/th/id/R.cd11bbffa7058e1e537714db756fd292?rik=S4NZoZfqS3il%2bQ&pid=ImgRaw&r=0",
          patientName: "test 2",
          patientStatus: "موت",
          patientAddress: "السويداء",
          patientBirthDate: "2024-02-01",
          patientBirthPlace: "السويداء",
          patientGender: "Man",
          patientMothersDay: "test 1",
          patientDepartment: "الهضمية",
          suggestedTreatment: "سيتامول"),
      Patient(
          patientImage:
              "https://th.bing.com/th/id/R.cd11bbffa7058e1e537714db756fd292?rik=S4NZoZfqS3il%2bQ&pid=ImgRaw&r=0",
          patientName: "test 3",
          patientStatus: "حادث ",
          patientAddress: "السويداء",
          patientBirthDate: "2024-02-01",
          patientBirthPlace: "السويداء",
          patientGender: "Man",
          patientMothersDay: "test 1",
          patientDepartment: "اسعاف",
          suggestedTreatment: "سيتامول"),
      Patient(
          patientImage:
              "https://th.bing.com/th/id/R.cd11bbffa7058e1e537714db756fd292?rik=S4NZoZfqS3il%2bQ&pid=ImgRaw&r=0",
          patientName: "test 3",
          patientStatus: "حادث ",
          patientAddress: "السويداء",
          patientBirthDate: "2024-02-01",
          patientBirthPlace: "السويداء",
          patientGender: "Man",
          patientMothersDay: "test 1",
          patientDepartment: "اسعاف",
          suggestedTreatment: "سيتامول"),
      Patient(
          patientImage:
              "https://th.bing.com/th/id/R.cd11bbffa7058e1e537714db756fd292?rik=S4NZoZfqS3il%2bQ&pid=ImgRaw&r=0",
          patientName: "test 3",
          patientStatus: "حادث ",
          patientAddress: "السويداء",
          patientBirthDate: "2024-02-01",
          patientBirthPlace: "السويداء",
          patientGender: "Man",
          patientMothersDay: "test 1",
          patientDepartment: "اسعاف",
          suggestedTreatment: "سيتامول"),
    ];
    return patients;
  }
}
