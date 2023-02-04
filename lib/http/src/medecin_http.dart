
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:masante/modeles/Medecin.dart';

import '../../AllFile/repository/medecin_repository.dart';
import '../../AllFile/responses/medecin_response.dart';
import '../base_http_client.dart';
import '../url_paths.dart';

class MedecinHttp implements MedecinRepository {
  const MedecinHttp({
    this.baseHttpClient = const BaseHttpClient(),
  });

  final BaseHttpClient baseHttpClient;

  @override
  Future<MedecinResponse> addMedecin(Medecin medecin) async {
    try {
      final http.Response response = await baseHttpClient.post(
        UrlPaths.addMedecin,
        request: medecin.toJson(),
      );
      return compute(medecinResponseFromJson, response.body);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MedecinResponse> get all async {
    try {
      final http.Response response = await baseHttpClient.get(
        UrlPaths.getMedecin,
      );
      return compute(medecinResponseFromJson, response.body);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MedecinResponse> deleteMedecin(Medecin medecin) async {
    try {
      final http.Response response = await baseHttpClient.post(
        UrlPaths.medecinDone,
        parameters: {'idmedecin': '${medecin.idmedecin}', 'etat': '${medecin.etat}'},
      );
      return compute(medecinResponseFromJson, response.body);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MedecinResponse> medecinByHopital(final int idmedecin) async {
    try {
      final http.Response response = await baseHttpClient.get(
        UrlPaths.medecinbyHopital,
        {'idmedecin': '$idmedecin'},
      );
      return compute(medecinResponseFromJson, response.body);
    } catch (e) {
      rethrow;
    }
  }


}
