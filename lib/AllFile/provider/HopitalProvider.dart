import 'package:flutter/cupertino.dart';
import 'package:masante/modeles/Hopital.dart';

import '../../VarBlobale.dart';
import '../repository/Hopital.dart';


class HopitalProvider extends ChangeNotifier {
  List<Hopital> hopitals = [];
  Hopital? EditToHopital;
  int pagesNumber = 0;

  final HopitalRepository hopitalRepository = HopitalRepository();

  getHopital(int page, String? searchValue, SortTypes? sortType,
      GetTypes getTypes) async {
    Map<String, dynamic> returnedData =
    await hopitalRepository.getProductsList(page, searchValue, sortType);
    List<Hopital> pageHopital = returnedData["Hopital list"];
    pagesNumber = returnedData["pages number"];
    if (getTypes == GetTypes.PAGING) {
      hopitals = hopitals + pageHopital;
    } else if (getTypes == GetTypes.FILTER) {
      hopitals = pageHopital;
    }
    notifyListeners();
  }

  addHopital(Hopital hopital) async {
    Hopital savedHopital = await hopitalRepository.addHopital(hopital);
    hopitals.add(savedHopital);
    notifyListeners();
  }

  editHopital(Hopital hopital) async {
    Hopital editedHopital = await hopitalRepository.editHopital(hopital);
    hopitals[hopitals.indexOf(hopital)] = editedHopital;
    notifyListeners();
  }

  deleteHopital(Hopital hopital) async {
    await hopitalRepository.deleteHopital(hopital);
    hopitals.remove(hopital);
    notifyListeners();
  }
}
