import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_app/module/base_list_entity.dart';
import 'package:flutter_app/module/patient/patient.dart';
import 'package:flutter_app/module/patient/patient_api.dart';

final StateNotifierProvider<PatientListNotifier, List<Patient>>
patientListProvider =
StateNotifierProvider((ref) => PatientListNotifier([]));

class PatientListNotifier extends StateNotifier<List<Patient>> {
  PatientListNotifier(List<Patient> patients) : super(patients);

  Future<void> list() async {
    var response = await PatientApi.list();
    var patients =
        BaseListEntity
            .fromJson(response.data, (x) => Patient.fromJson(x))
            .data;
    this.state = patients;
    return;
  }
}
