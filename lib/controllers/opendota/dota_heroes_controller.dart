import 'package:get/get.dart';
import 'package:dota2checker/models/opendota/dota_heroes.dart';

class DotaHeroesController extends GetxController {
  RxList<DotaHeroes> heroes = [
    DotaHeroes(
        id: 0,
        name: '',
        localizedName: '',
        primaryAttr: '',
        attackType: '',
        roles: [],
        legs: 0)
  ].obs;

  void change(List<DotaHeroes> newHeroes) => heroes.value = newHeroes;
}
