import 'dart:convert';

import 'package:masante/modeles/Hopital.dart';
import 'package:masante/service/Hopital.dart';
import 'package:http/http.dart' as http;

import '../../VarBlobale.dart';



class HopitalRepository{
  final HopitalService hopitalService = HopitalService();

  Future<Map<String, dynamic>> getProductsList(
      int page, String? searchValue, SortTypes? sortType) async {
    Map<String, String> params = {
      "page": page.toString(),
      "limit": PAGE_LIMIT.toString()
    };
    if (searchValue != null) params["hopitalName"] = searchValue;
    if (sortType != null) {
      params["sortType"] = sortType.toString().split('.').last;
    }
    http.Response response = await hopitalService.get("/afficher", params);
    dynamic responseJson = jsonDecode(response.body);
    final hopitalsData = responseJson['data']['content'] as List;
    List<Hopital> hopitalsList =
    hopitalsData.map((json) => Hopital.fromMap(json)).toList();
    final pagesData = responseJson['data']['totalPages'];
    Map<String, dynamic> returnedData = {
      "products list": hopitalsList,
      "pages number": pagesData
    };
    return returnedData;
  }

  Future<Hopital> addHopital(Hopital hopital) async {
    http.Response response =
    await hopitalService.post("/ajouter", hopital.toJson(hopital));
    dynamic responseJson = jsonDecode(response.body);
    final jsonData = responseJson['data'];
    Hopital savedHopital = Hopital.fromMap(jsonData);
    return savedHopital;
  }

  Future<Hopital> editHopital(Hopital hopital) async {
    http.Response response =
    await hopitalService.put("/products/edit", hopital.toJson(hopital));
    dynamic responseJson = jsonDecode(response.body);
    final jsonData = responseJson['data'];
    Hopital editedHopital = Hopital.fromMap(jsonData);
    return editedHopital;
  }

  Future<dynamic> deleteHopital(Hopital hopital) async {
    http.Response response =
    await hopitalService.delete("supprimer/${hopital.idhopital}");
    dynamic responseJson = jsonDecode(response.body);
    final jsonMessage = responseJson['message'];
  }
}

