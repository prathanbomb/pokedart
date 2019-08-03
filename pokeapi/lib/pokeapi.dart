library pokeapi;

import 'dart:convert';

import 'package:http/http.dart' as Http;
import 'package:pokeapi/model/berry/berry-firmness.dart';
import 'package:pokeapi/model/berry/berry-flavor.dart';
import 'package:pokeapi/model/berry/berry.dart';
import 'package:pokeapi/model/item/item-ability.dart';
import 'package:pokeapi/model/item/item-category.dart';
import 'package:pokeapi/model/item/item-fling-effect.dart';
import 'package:pokeapi/model/item/item-pocket.dart';
import 'package:pokeapi/model/item/item.dart';
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
      default:
        {
          return null;
        }
    }
  }

  static Future<List<T>> getObjectList<T>(int offset, int limit) async {
    List<T> objectList = new List();
    var api = await _getAPI();
    var url;
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
    }
    url += "?offset=${offset - 1}&limit=$limit";
    var response = await Http.get(url);
    Map listMap = json.decode(response.body);
    List<NamedAPIResource> commonResultList = Common
        .fromJson(listMap)
        .results;
    for (NamedAPIResource result in commonResultList) {
      response = await Http.get(result.url);
      objectList.add(_mapJson<T>(response));
    }
    return objectList;
  }

  static Future<T> getObject<T>(int id) async {
    var api = await _getAPI();
    var url;
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
    }
    url += "?offset=${id - 1}&limit=1";
    var response = await Http.get(url);
    Map listMap = json.decode(response.body);
    List<NamedAPIResource> commonResultList = Common
        .fromJson(listMap)
        .results;
    if (commonResultList.isNotEmpty) {
      response = await Http.get(commonResultList[0].url);
      return _mapJson<T>(response);
    } else {
      return null;
    }
  }
}
