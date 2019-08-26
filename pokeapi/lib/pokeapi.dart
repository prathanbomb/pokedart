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
    return Api.fromJson(map);
  }

  static dynamic _mapJson<T>(Http.Response response) {
    Map map = json.decode(response.body);

    if (T == Ability) Ability.fromJson(map) as T;
    if (T == Berry) Berry.fromJson(map) as T;
    if (T == BerryFirmness) BerryFirmness.fromJson(map) as T;
    if (T == BerryFlavor) BerryFlavor.fromJson(map) as T;
    if (T == Characteristic) Characteristic.fromJson(map) as T;
    if (T == EggGroup) EggGroup.fromJson(map) as T;
    if (T == Gender) Gender.fromJson(map) as T;
    if (T == GrowthRate) GrowthRate.fromJson(map) as T;
    if (T == Item) Item.fromJson(map) as T;
    if (T == ItemAbility) ItemAbility.fromJson(map) as T;
    if (T == ItemCategory) ItemCategory.fromJson(map) as T;
    if (T == ItemFlingEffect) ItemFlingEffect.fromJson(map) as T;
    if (T == ItemPocket) ItemPocket.fromJson(map) as T;
    if (T == Nature) Nature.fromJson(map) as T;
    if (T == PokeAthlonStat) PokeAthlonStat.fromJson(map) as T;
    if (T == Pokemon) Pokemon.fromJson(map) as T;
    if (T == PokemonColor) PokemonColor.fromJson(map) as T;
    if (T == PokemonForm) PokemonForm.fromJson(map) as T;
    if (T == PokemonHabitat) PokemonHabitat.fromJson(map) as T;
    if (T == PokemonShape) PokemonShape.fromJson(map) as T;
    if (T == PokemonSpecie) PokemonSpecie.fromJson(map) as T;
    if (T == Stat) Stat.fromJson(map) as T;
    if (T == Type) Type.fromJson(map) as T;
    if (T == ContestEffect) ContestEffect.fromJson(map) as T;
    if (T == ContestType) ContestType.fromJson(map) as T;
    if (T == SuperContestEffect) SuperContestEffect.fromJson(map) as T;
    if (T == EncounterCondition) EncounterCondition.fromJson(map) as T;
    if (T == EncounterConditionValue)
      EncounterConditionValue.fromJson(map) as T;
    if (T == EncounterMethod) EncounterMethod.fromJson(map) as T;
    if (T == EvolutionChain) EvolutionChain.fromJson(map) as T;
    if (T == EvolutionTrigger) EvolutionTrigger.fromJson(map) as T;
    if (T == Generation) Generation.fromJson(map) as T;
    if (T == Pokedex) Pokedex.fromJson(map) as T;
    if (T == Version) Version.fromJson(map) as T;
    if (T == VersionGroup) VersionGroup.fromJson(map) as T;
    if (T == Location) Location.fromJson(map) as T;
    if (T == LocationArea) LocationArea.fromJson(map) as T;
    if (T == PalParkArea) PalParkArea.fromJson(map) as T;
    if (T == Region) Region.fromJson(map) as T;
    if (T == Machine) Machine.fromJson(map) as T;
    if (T == Move) Move.fromJson(map) as T;
    if (T == MoveAilment) MoveAilment.fromJson(map) as T;
    if (T == MoveBattleStyle) MoveBattleStyle.fromJson(map) as T;
    if (T == MoveCategory) MoveCategory.fromJson(map) as T;
    if (T == MoveDamageClass) MoveDamageClass.fromJson(map) as T;
    if (T == MoveLearnMethod) MoveLearnMethod.fromJson(map) as T;
    if (T == MoveTarget) MoveTarget.fromJson(map) as T;
  }

  static Future<List<NamedAPIResource>> getCommonList<T>(
      int offset, int limit) async {
    String url = await getBaseUrl<T>();

    url += "?offset=${offset - 1}&limit=$limit";
    var response = await Http.get(url);
    Map listMap = json.decode(response.body);
    List<NamedAPIResource> commonResultList = Common.fromJson(listMap).results;

    return commonResultList;
  }

  static Future<List<T>> getObjectList<T>(int offset, int limit) async {
    List<T> objectList = new List();
    var url = await getBaseUrl<T>();

    url += "?offset=${offset - 1}&limit=$limit";
    var response = await Http.get(url);
    Map listMap = json.decode(response.body);
    List<NamedAPIResource> commonResultList = Common.fromJson(listMap).results;

    for (NamedAPIResource result in commonResultList) {
      response = await Http.get(result.url);
      objectList.add(_mapJson<T>(response));
    }
    return objectList;
  }

  static Future<T> getObject<T>(int id) async {
    String url = await getBaseUrl<T>();
    url += "?offset=${id - 1}&limit=1";
    var response = await Http.get(url);
    Map listMap = json.decode(response.body);
    List<NamedAPIResource> commonResultList = Common.fromJson(listMap).results;

    if (commonResultList.isNotEmpty) {
      response = await Http.get(commonResultList[0].url);
      return _mapJson<T>(response);
    } else {
      return null;
    }
  }

  static getBaseUrl<T>() async {
    var api = await _getAPI();
    String url;

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
