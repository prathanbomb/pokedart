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
    switch (T) {
      case Ability:
        {
          return Ability.fromJson(map) as T;
        }
      case Berry:
        {
          return Berry.fromJson(map) as T;
        }
      case BerryFirmness:
        {
          return BerryFirmness.fromJson(map) as T;
        }
      case BerryFlavor:
        {
          return BerryFlavor.fromJson(map) as T;
        }
      case Characteristic:
        {
          return Characteristic.fromJson(map) as T;
        }
      case EggGroup:
        {
          return EggGroup.fromJson(map) as T;
        }
      case Gender:
        {
          return Gender.fromJson(map) as T;
        }
      case GrowthRate:
        {
          return GrowthRate.fromJson(map) as T;
        }
      case Item:
        {
          return Item.fromJson(map) as T;
        }
      case ItemAbility:
        {
          return ItemAbility.fromJson(map) as T;
        }
      case ItemCategory:
        {
          return ItemCategory.fromJson(map) as T;
        }
      case ItemFlingEffect:
        {
          return ItemFlingEffect.fromJson(map) as T;
        }
      case ItemPocket:
        {
          return ItemPocket.fromJson(map) as T;
        }
      case Nature:
        {
          return Nature.fromJson(map) as T;
        }
      case PokeAthlonStat:
        {
          return PokeAthlonStat.fromJson(map) as T;
        }
      case Pokemon:
        {
          return Pokemon.fromJson(map) as T;
        }
      case PokemonColor:
        {
          return PokemonColor.fromJson(map) as T;
        }
      case PokemonForm:
        {
          return PokemonForm.fromJson(map) as T;
        }
      case PokemonHabitat:
        {
          return PokemonHabitat.fromJson(map) as T;
        }
      case PokemonShape:
        {
          return PokemonShape.fromJson(map) as T;
        }
      case PokemonSpecie:
        {
          return PokemonSpecie.fromJson(map) as T;
        }
      case Stat:
        {
          return Stat.fromJson(map) as T;
        }
      case Type:
        {
          return Type.fromJson(map) as T;
        }
      case ContestEffect:
        {
          return ContestEffect.fromJson(map) as T;
        }
      case ContestType:
        {
          return ContestType.fromJson(map) as T;
        }
      case SuperContestEffect:
        {
          return SuperContestEffect.fromJson(map) as T;
        }
      case EncounterCondition:
        {
          return EncounterCondition.fromJson(map) as T;
        }
      case EncounterConditionValue:
        {
          return EncounterConditionValue.fromJson(map) as T;
        }
      case EncounterMethod:
        {
          return EncounterMethod.fromJson(map) as T;
        }
      case EvolutionChain:
        {
          return EvolutionChain.fromJson(map) as T;
        }
      case EvolutionTrigger:
        {
          return EvolutionTrigger.fromJson(map) as T;
        }
      case Generation:
        {
          return Generation.fromJson(map) as T;
        }
      case Pokedex:
        {
          return Pokedex.fromJson(map) as T;
        }
      case Version:
        {
          return Version.fromJson(map) as T;
        }
      case VersionGroup:
        {
          return VersionGroup.fromJson(map) as T;
        }
      case Location:
        {
          return Location.fromJson(map) as T;
        }
      case LocationArea:
        {
          return LocationArea.fromJson(map) as T;
        }
      case PalParkArea:
        {
          return PalParkArea.fromJson(map) as T;
        }
      case Region:
        {
          return Region.fromJson(map) as T;
        }
      case Machine:
        {
          return Machine.fromJson(map) as T;
        }
      case Move:
        {
          return Move.fromJson(map) as T;
        }
      case MoveAilment:
        {
          return MoveAilment.fromJson(map) as T;
        }
      case MoveBattleStyle:
        {
          return MoveBattleStyle.fromJson(map) as T;
        }
      case MoveCategory:
        {
          return MoveCategory.fromJson(map) as T;
        }
      case MoveDamageClass:
        {
          return MoveDamageClass.fromJson(map) as T;
        }
      case MoveLearnMethod:
        {
          return MoveLearnMethod.fromJson(map) as T;
        }
      case MoveTarget:
        {
          return MoveTarget.fromJson(map) as T;
        }
      default:
        {
          return null;
        }
    }
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
    switch (T) {
      case Ability:
        {
          url = api.ability;
          break;
        }
      case Berry:
        {
          url = api.berry;
          break;
        }
      case BerryFirmness:
        {
          url = api.berryFirmness;
          break;
        }
      case BerryFlavor:
        {
          url = api.berryFlavor;
          break;
        }
      case Characteristic:
        {
          url = api.characteristic;
          break;
        }
      case EggGroup:
        {
          url = api.eggGroup;
          break;
        }
      case Gender:
        {
          url = api.gender;
          break;
        }
      case GrowthRate:
        {
          url = api.growthRate;
          break;
        }
      case Item:
        {
          url = api.item;
          break;
        }
      case ItemAbility:
        {
          url = api.itemAttribute;
          break;
        }
      case ItemCategory:
        {
          url = api.itemCategory;
          break;
        }
      case ItemFlingEffect:
        {
          url = api.itemFlingEffect;
          break;
        }
      case ItemPocket:
        {
          url = api.itemPocket;
          break;
        }
      case Nature:
        {
          url = api.nature;
          break;
        }
      case PokeAthlonStat:
        {
          url = api.pokeathlonStat;
          break;
        }
      case Pokemon:
        {
          url = api.pokemon;
          break;
        }
      case PokemonColor:
        {
          url = api.pokemonColor;
          break;
        }
      case PokemonForm:
        {
          url = api.pokemonForm;
          break;
        }
      case PokemonHabitat:
        {
          url = api.pokemonHabitat;
          break;
        }
      case PokemonShape:
        {
          url = api.pokemonShape;
          break;
        }
      case PokemonSpecie:
        {
          url = api.pokemonSpecies;
          break;
        }
      case Stat:
        {
          url = api.stat;
          break;
        }
      case Type:
        {
          url = api.type;
          break;
        }
      case ContestEffect:
        {
          url = api.contestEffect;
          break;
        }
      case ContestType:
        {
          url = api.contestType;
          break;
        }
      case SuperContestEffect:
        {
          url = api.superContestEffect;
          break;
        }
      case EncounterCondition:
        {
          url = api.encounterCondition;
          break;
        }
      case EncounterConditionValue:
        {
          url = api.encounterConditionValue;
          break;
        }
      case EncounterMethod:
        {
          url = api.encounterMethod;
          break;
        }
      case EvolutionChain:
        {
          url = api.evolutionChain;
          break;
        }
      case EvolutionTrigger:
        {
          url = api.evolutionTrigger;
          break;
        }
      case Generation:
        {
          url = api.generation;
          break;
        }
      case Pokedex:
        {
          url = api.pokedex;
          break;
        }
      case Version:
        {
          url = api.version;
          break;
        }
      case VersionGroup:
        {
          url = api.versionGroup;
          break;
        }
      case Location:
        {
          url = api.location;
          break;
        }
      case LocationArea:
        {
          url = api.locationArea;
          break;
        }
      case PalParkArea:
        {
          url = api.palParkArea;
          break;
        }
      case Region:
        {
          url = api.region;
          break;
        }
      case Machine:
        {
          url = api.machine;
          break;
        }
      case Move:
        {
          url = api.move;
          break;
        }
      case MoveAilment:
        {
          url = api.moveAilment;
          break;
        }
      case MoveBattleStyle:
        {
          url = api.moveBattleStyle;
          break;
        }
      case MoveCategory:
        {
          url = api.moveCategory;
          break;
        }
      case MoveDamageClass:
        {
          url = api.moveDamageClass;
          break;
        }
      case MoveLearnMethod:
        {
          url = api.moveLearnMethod;
          break;
        }
      case MoveTarget:
        {
          url = api.moveTarget;
          break;
        }
    }
    return url;
  }
}
