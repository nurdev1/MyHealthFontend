
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:masante/modeles/Patient.dart';

import '../../AllFile/repository/patient_repository.dart';
import '../../AllFile/responses/add_patient_response.dart';
import '../../AllFile/responses/patient_response.dart';
import '../base_http_client.dart';
import '../url_paths.dart';

class PatientHttp implements PatientRepository {
  const PatientHttp({
    this.baseHttpClient = const BaseHttpClient(),
  });

  final BaseHttpClient baseHttpClient;

  @override
  Future<AddPatientResponse> addPatient(ModelPatient patient) async {
    try {
      final http.Response response = await baseHttpClient.post(
        UrlPaths.addPatient,
        request: patient.toJson(),
      );
      return compute(addPatientResponseFromJson, response.body);
    } catch (e) {
      rethrow;
    }
  }

  @override
  // TODO: implement all
  Future<PatientResponse> get all => throw UnimplementedError();

/*  @override
  Future<PatientResponse> get all async {
    try {
      final http.Response response = await baseHttpClient.get(
        UrlPaths.allPatient,
      );
      //return compute(patientResponseFromJson, response.body);
    } catch (e) {
      rethrow;
    }
  }*/
}
