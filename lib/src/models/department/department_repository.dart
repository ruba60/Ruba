import 'package:hospital_mang2/src/models/ambulance/patient_data.dart';
import 'package:hospital_mang2/src/models/department/department_data.dart';

class DepartmentRepository {
  Future<List<Department>> getDepartments() async {
    List<Department> departments = [
      Department(departmentId: 0, departmentName: "القلبية"),
      Department(departmentId: 1, departmentName: "الهضمية"),
      Department(departmentId: 2, departmentName: "الصدرية"),
    ];
    return departments;
  }

  Future<List<Patient>> getListOfPatientDetails() async {
    List<Patient> patients = [
      Patient(
        id:0,
          patientImage:
              "https://th.bing.com/th/id/R.cd11bbffa7058e1e537714db756fd292?rik=S4NZoZfqS3il%2bQ&pid=ImgRaw&r=0",
          patientName: "test 1",
          patientAddress: "السويداء",
          patientBirthDate: "2024-02-01",
          patientBirthPlace: "السويداء",
          patientGender: "ذكر",
          patientMothersDay: "test 1",
          patientStatus: "حادث سير",
          patientDepartment: "القلبية",
          suggestedTreatment: "سيتامول"),
      Patient(
        id:1,
          patientImage:
              "https://th.bing.com/th/id/R.cd11bbffa7058e1e537714db756fd292?rik=S4NZoZfqS3il%2bQ&pid=ImgRaw&r=0",
          patientName: "test 2",
          patientStatus: "موت",
          patientAddress: "السويداء",
          patientBirthDate: "2024-02-01",
          patientBirthPlace: "السويداء",
          patientGender: "ذكر",
          patientMothersDay: "test 1",
          patientDepartment: "الهضمية",
          suggestedTreatment: "سيتامول"),
      Patient(
        id:2,
          patientImage:
              "https://th.bing.com/th/id/R.cd11bbffa7058e1e537714db756fd292?rik=S4NZoZfqS3il%2bQ&pid=ImgRaw&r=0",
          patientName: "test 3",
          patientStatus: "حادث ",
          patientAddress: "السويداء",
          patientBirthDate: "2024-02-01",
          patientBirthPlace: "السويداء",
          patientGender: "ذكر",
          patientMothersDay: "test 1",
          patientDepartment: "اسعاف",
          suggestedTreatment: "سيتامول"),
    ];
    return patients;
  }
    Future<List<Patient>> getAllPatients() async {
    List<Patient> patients = [
      Patient(
        id:0,
          patientImage:
              "https://th.bing.com/th/id/R.cd11bbffa7058e1e537714db756fd292?rik=S4NZoZfqS3il%2bQ&pid=ImgRaw&r=0",
          patientName: "test 1",
          patientAddress: "السويداء",
          patientBirthDate: "2024-02-01",
          patientBirthPlace: "السويداء",
          patientGender: "ذكر",
          patientMothersDay: "test 1",
          patientStatus: "حادث سير",
          patientDepartment: "القلبية",
          suggestedTreatment: "سيتامول"),
      Patient(
        id:1,
          patientImage:
              "https://th.bing.com/th/id/R.cd11bbffa7058e1e537714db756fd292?rik=S4NZoZfqS3il%2bQ&pid=ImgRaw&r=0",
          patientName: "test 2",
          patientStatus: "موت",
          patientAddress: "السويداء",
          patientBirthDate: "2024-02-01",
          patientBirthPlace: "السويداء",
          patientGender: "ذكر",
          patientMothersDay: "test 1",
          patientDepartment: "الهضمية",
          suggestedTreatment: "سيتامول"),
      Patient(
        id:2,
          patientImage:
              "https://th.bing.com/th/id/R.cd11bbffa7058e1e537714db756fd292?rik=S4NZoZfqS3il%2bQ&pid=ImgRaw&r=0",
          patientName: "test 3",
          patientStatus: "حادث ",
          patientAddress: "السويداء",
          patientBirthDate: "2024-02-01",
          patientBirthPlace: "السويداء",
          patientGender: "ذكر",
          patientMothersDay: "test 1",
          patientDepartment: "اسعاف",
          suggestedTreatment: "سيتامول"),
    ];
    return patients;
  }
}
