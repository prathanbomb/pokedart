library pokeapi;

import 'dart:convert';

import 'package:http/http.dart' as Http;
import 'package:pokeapi/model/berry/berry-firmness.dart';
import 'package:pokeapi/model/berry/berry-flavor.dart';
import 'package:pokeapi/model/berry/berry.dart';
import 'package:pokeapi/model/contest/contest-effect.dart';
import 'package:pokeapi/model/contest/contest-type.dart';
import 'package:pokeapi/model/contest/super-contest-effect.dart';
import 'package:pokeapi/model/encounter/encounter-condition-value.dart';
import 'package:pokeapi/model/encounter/encounter-condition.dart';
import 'package:pokeapi/model/encounter/encounter-method.dart';
import 'package:pokeapi/model/evolution/evolution-chain.dart';
import 'package:pokeapi/model/evolution/evolution-trigger.dart';
import 'package:pokeapi/model/game/generation.dart';
import 'package:pokeapi/model/game/pokedex.dart';
import 'package:pokeapi/model/game/version-group.dart';
import 'package:pokeapi/model/game/version.dart';
import 'package:pokeapi/model/item/item-attribute.dart';
import 'package:pokeapi/model/item/item-category.dart';
import 'package:pokeapi/model/item/item-fling-effect.dart';
import 'package:pokeapi/model/item/item-pocket.dart';
import 'package:pokeapi/model/item/item.dart';
import 'package:pokeapi/model/location/location-area.dart';
import 'package:pokeapi/model/location/location.dart';
import 'package:pokeapi/model/location/pal-park-area.dart';
import 'package:pokeapi/model/location/region.dart';
import 'package:pokeapi/model/machine/machine.dart';
import 'package:pokeapi/model/move/move-ailment.dart';
import 'package:pokeapi/model/move/move-battle-style.dart';
import 'package:pokeapi/model/move/move-category.dart';
import 'package:pokeapi/model/move/move-damage-class.dart';
import 'package:pokeapi/model/move/move-learn-method.dart';
import 'package:pokeapi/model/move/move-target.dart';
import 'package:pokeapi/model/move/move.dart';
import 'package:pokeapi/model/pokemon/ability.dart';
import 'package:pokeapi/model/pokemon/characteristic.dart';
import 'package:pokeapi/model/pokemon/egg-group.dart';
import 'package:pokeapi/model/pokemon/gender.dart';
import 'package:pokeapi/model/pokemon/growth-rate.dart';
import 'package:pokeapi/model/pokemon/nature.dart';
import 'package:pokeapi/model/pokemon/pokeathlon-stat.dart';
import 'package:pokeapi/model/pokemon/pokemon-color.dart';
import 'package:pokeapi/model/pokemon/pokemon-form.dart';
import 'package:pokeapi/model/pokemon/pokemon-habitat.dart';
import 'package:pokeapi/model/pokemon/pokemon-shape.dart';
import 'package:pokeapi/model/pokemon/pokemon-specie.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokeapi/model/pokemon/stat.dart';
import 'package:pokeapi/model/pokemon/type.dart';
import 'package:pokeapi/model/utils/api.dart';
import 'package:pokeapi/model/utils/common.dart';

class PokeAPI {
  static get _baseUrl => "https://pokeapi.co/api/v2/";

  static Future<Api> _getAPI() async {
    var response = await Http.get(_baseUrl);
    Map map = json.decode(response.body);
    return Api.fromJson(map as Map<String, dynamic>);
  }

  static dynamic _mapJson<T>(Http.Response response) {
    Map? map = json.decode(response.body);

    if (T == Ability) return Ability.fromJson(map as Map<String, dynamic>) as T;
    if (T == Berry) return Berry.fromJson(map as Map<String, dynamic>) as T;
    if (T == BerryFirmness) return BerryFirmness.fromJson(map as Map<String, dynamic>) as T;
    if (T == BerryFlavor) return BerryFlavor.fromJson(map as Map<String, dynamic>) as T;
    if (T == Characteristic) return Characteristic.fromJson(map as Map<String, dynamic>) as T;
    if (T == EggGroup) return EggGroup.fromJson(map as Map<String, dynamic>) as T;
    if (T == Gender) return Gender.fromJson(map as Map<String, dynamic>) as T;
    if (T == GrowthRate) return GrowthRate.fromJson(map as Map<String, dynamic>) as T;
    if (T == Item) return Item.fromJson(map as Map<String, dynamic>) as T;
    if (T == ItemAbility) return ItemAbility.fromJson(map as Map<String, dynamic>) as T;
    if (T == ItemCategory) return ItemCategory.fromJson(map as Map<String, dynamic>) as T;
    if (T == ItemFlingEffect) return ItemFlingEffect.fromJson(map as Map<String, dynamic>) as T;
    if (T == ItemPocket) return ItemPocket.fromJson(map as Map<String, dynamic>) as T;
    if (T == Nature) return Nature.fromJson(map as Map<String, dynamic>) as T;
    if (T == PokeAthlonStat) return PokeAthlonStat.fromJson(map as Map<String, dynamic>) as T;
    if (T == Pokemon) return Pokemon.fromJson(map as Map<String, dynamic>) as T;
    if (T == PokemonColor) return PokemonColor.fromJson(map as Map<String, dynamic>) as T;
    if (T == PokemonForm) return PokemonForm.fromJson(map as Map<String, dynamic>) as T;
    if (T == PokemonHabitat) return PokemonHabitat.fromJson(map as Map<String, dynamic>) as T;
    if (T == PokemonShape) return PokemonShape.fromJson(map as Map<String, dynamic>) as T;
    if (T == PokemonSpecie) return PokemonSpecie.fromJson(map as Map<String, dynamic>) as T;
    if (T == Stat) return Stat.fromJson(map as Map<String, dynamic>) as T;
    if (T == Type) return Type.fromJson(map as Map<String, dynamic>) as T;
    if (T == ContestEffect) return ContestEffect.fromJson(map as Map<String, dynamic>) as T;
    if (T == ContestType) return ContestType.fromJson(map as Map<String, dynamic>) as T;
    if (T == SuperContestEffect) return SuperContestEffect.fromJson(map as Map<String, dynamic>) as T;
    if (T == EncounterCondition) return EncounterCondition.fromJson(map as Map<String, dynamic>) as T;
    if (T == EncounterConditionValue)
      return EncounterConditionValue.fromJson(map as Map<String, dynamic>) as T;
    if (T == EncounterMethod) return EncounterMethod.fromJson(map as Map<String, dynamic>) as T;
    if (T == EvolutionChain) return EvolutionChain.fromJson(map as Map<String, dynamic>) as T;
    if (T == EvolutionTrigger) return EvolutionTrigger.fromJson(map as Map<String, dynamic>) as T;
    if (T == Generation) return Generation.fromJson(map as Map<String, dynamic>) as T;
    if (T == Pokedex) return Pokedex.fromJson(map as Map<String, dynamic>) as T;
    if (T == Version) return Version.fromJson(map as Map<String, dynamic>) as T;
    if (T == VersionGroup) return VersionGroup.fromJson(map as Map<String, dynamic>) as T;
    if (T == Location) return Location.fromJson(map as Map<String, dynamic>) as T;
    if (T == LocationArea) return LocationArea.fromJson(map as Map<String, dynamic>) as T;
    if (T == PalParkArea) return PalParkArea.fromJson(map as Map<String, dynamic>) as T;
    if (T == Region) return Region.fromJson(map as Map<String, dynamic>) as T;
    if (T == Machine) return Machine.fromJson(map as Map<String, dynamic>) as T;
    if (T == Move) return Move.fromJson(map as Map<String, dynamic>) as T;
    if (T == MoveAilment) return MoveAilment.fromJson(map as Map<String, dynamic>) as T;
    if (T == MoveBattleStyle) return MoveBattleStyle.fromJson(map as Map<String, dynamic>) as T;
    if (T == MoveCategory) return MoveCategory.fromJson(map as Map<String, dynamic>) as T;
    if (T == MoveDamageClass) return MoveDamageClass.fromJson(map as Map<String, dynamic>) as T;
    if (T == MoveLearnMethod) return MoveLearnMethod.fromJson(map as Map<String, dynamic>) as T;
    if (T == MoveTarget) return MoveTarget.fromJson(map as Map<String, dynamic>) as T;
  }

  static Future<List<NamedAPIResource>?> getCommonList<T>(
      int offset, int limit) async {
    String url = await getBaseUrl<T>();

    url += "?offset=${offset - 1}&limit=$limit";
    var response = await Http.get(Uri.parse(url));
    Map listMap = json.decode(response.body);
    List<NamedAPIResource>? commonResultList = Common.fromJson(listMap as Map<String, dynamic>).results;

    return commonResultList;
  }

  static Future<List<T?>> getObjectList<T>(int offset, int limit) async {
    List<T?> objectList =  [];
    var url = await getBaseUrl<T>();

    url += "?offset=${offset - 1}&limit=$limit";
    var response = await Http.get(url);
    Map listMap = json.decode(response.body);
    List<NamedAPIResource> commonResultList = Common.fromJson(listMap as Map<String, dynamic>).results!;

    for (NamedAPIResource result in commonResultList) {
      response = await Http.get(Uri.parse(result.url!));
      objectList.add(_mapJson<T>(response));
    }
    return objectList;
  }

  static Future<T?> getObject<T>(int id) async {
    String url = await getBaseUrl<T>();
    url += "?offset=${id - 1}&limit=1";
    var response = await Http.get(Uri.parse(url));
    Map listMap = json.decode(response.body);
    List<NamedAPIResource> commonResultList = Common.fromJson(listMap as Map<String, dynamic>).results!;

    if (commonResultList.isNotEmpty) {
      response = await Http.get(Uri.parse(commonResultList[0].url!));
      return _mapJson<T>(response);
    } else {
      return null;
    }
  }

  static getBaseUrl<T>() async {
    var api = await _getAPI();
    String? url;

    if (T == Ability) url = api.ability;
    if (T == Berry) url = api.berry;
    if (T == BerryFirmness) url = api.berryFirmness;
    if (T == BerryFlavor) url = api.berryFlavor;
    if (T == Characteristic) url = api.characteristic;
    if (T == EggGroup) url = api.eggGroup;
    if (T == Gender) url = api.gender;
    if (T == GrowthRate) url = api.growthRate;
    if (T == Item) url = api.item;
    if (T == ItemAbility) url = api.itemAttribute;
    if (T == ItemCategory) url = api.itemCategory;
    if (T == ItemFlingEffect) url = api.itemFlingEffect;
    if (T == ItemPocket) url = api.itemPocket;
    if (T == Nature) url = api.nature;
    if (T == PokeAthlonStat) url = api.pokeathlonStat;
    if (T == Pokemon) url = api.pokemon;
    if (T == PokemonColor) url = api.pokemonColor;
    if (T == PokemonForm) url = api.pokemonForm;
    if (T == PokemonHabitat) url = api.pokemonHabitat;
    if (T == PokemonShape) url = api.pokemonShape;
    if (T == PokemonSpecie) url = api.pokemonSpecies;
    if (T == Stat) url = api.stat;
    if (T == Type) url = api.type;
    if (T == ContestEffect) url = api.contestEffect;
    if (T == ContestType) url = api.contestType;
    if (T == SuperContestEffect) url = api.superContestEffect;
    if (T == EncounterCondition) url = api.encounterCondition;
    if (T == EncounterConditionValue) url = api.encounterConditionValue;
    if (T == EncounterMethod) url = api.encounterMethod;
    if (T == EvolutionChain) url = api.evolutionChain;
    if (T == EvolutionTrigger) url = api.evolutionTrigger;
    if (T == Generation) url = api.generation;
    if (T == Pokedex) url = api.pokedex;
    if (T == Version) url = api.version;
    if (T == VersionGroup) url = api.versionGroup;
    if (T == Location) url = api.location;
    if (T == LocationArea) url = api.locationArea;
    if (T == PalParkArea) url = api.palParkArea;
    if (T == Region) url = api.region;
    if (T == Machine) url = api.machine;
    if (T == Move) url = api.move;
    if (T == MoveAilment) url = api.moveAilment;
    if (T == MoveBattleStyle) url = api.moveBattleStyle;
    if (T == MoveCategory) url = api.moveCategory;
    if (T == MoveDamageClass) url = api.moveDamageClass;
    if (T == MoveLearnMethod) url = api.moveLearnMethod;
    if (T == MoveTarget) url = api.moveTarget;

    return url;
  }
}
