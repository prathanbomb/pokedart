library pokeapi;

import 'dart:convert';

import 'package:http/http.dart' as Http;
import 'package:pokeapi/model/berry/berry.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokeapi/model/utils/api.dart';
import 'package:pokeapi/model/utils/common.dart';

class PokeAPI {
  static final baseUrl = "https://pokeapi.co/api/v2/";

  static Future<Api> getAPI() async {
    var url = baseUrl;
    var response = await Http.get(url);
    Map map = json.decode(response.body);
    return Api.fromJson(map);
  }

  static Future<Common> getAbility() async {
    var baseAPI = await getAPI();
    var response = await Http.get(baseAPI.ability);
    Map map = json.decode(response.body);
    return Common.fromJson(map);
  }

  static Future<List<Berry>> getBerryList(int offset, int limit) async {
    List<Berry> berryList = new List();
    var baseAPI = await getAPI();
    var url = baseAPI.berry + "?offset=$offset&limit=$limit";
    var response = await Http.get(url);
    Map berryListMap = json.decode(response.body);
    List<NamedAPIResource> commonResultList =
        Common
            .fromJson(berryListMap)
            .results;
    for (NamedAPIResource result in commonResultList) {
      response = await Http.get(result.url);
      Map berryMap = json.decode(response.body);
      berryList.add(Berry.fromJson(berryMap));
    }
    return berryList;
  }

  static Future<Berry> getBerry(int id) async {
    var baseAPI = await getAPI();
    var url = baseAPI.berry + "?offset=${id + 1}&limit=1";
    var response = await Http.get(url);
    Map berryListMap = json.decode(response.body);
    List<NamedAPIResource> commonResultList =
        Common
            .fromJson(berryListMap)
            .results;
    if (commonResultList.isNotEmpty) {
      response = await Http.get(commonResultList[0].url);
      Map berryMap = json.decode(response.body);
      return Berry.fromJson(berryMap);
    } else {
      return null;
    }
  }

  static Future<List<Pokemon>> getPokemonList(int offset, int limit) async {
    List<Pokemon> pokemonList = new List();
    var baseAPI = await getAPI();
    var url = baseAPI.pokemon + "?offset=$offset&limit=$limit";
    var response = await Http.get(url);
    Map pokemonListMap = json.decode(response.body);
    List<NamedAPIResource> commonResultList =
        Common
            .fromJson(pokemonListMap)
            .results;
    for (NamedAPIResource result in commonResultList) {
      response = await Http.get(result.url);
      Map pokemonMap = json.decode(response.body);
      pokemonList.add(Pokemon.fromJson(pokemonMap));
    }
    return pokemonList;
  }

  static Future<Pokemon> getPokemon(int id) async {
    var baseAPI = await getAPI();
    var url = baseAPI.pokemon + "?offset=${id + 1}&limit=1";
    var response = await Http.get(url);
    Map pokemonListMap = json.decode(response.body);
    List<NamedAPIResource> commonResultList =
        Common
            .fromJson(pokemonListMap)
            .results;
    if (commonResultList.isNotEmpty) {
      response = await Http.get(commonResultList[0].url);
      Map pokemonMap = json.decode(response.body);
      return Pokemon.fromJson(pokemonMap);
    } else {
      return null;
    }
  }
}
