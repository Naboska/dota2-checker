import 'package:get/get.dart';

import 'package:dota2checker/models/dota_dictionary/dota_dictionary.dart';

class DotaDictionaryController extends GetxController {
  DotaDictionary? dictionary;

  void change(DotaDictionary dotaDictionary) {
    dictionary = dotaDictionary;
    update();
  }
}
