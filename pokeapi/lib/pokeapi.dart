library pokeapi;

import 'dart:convert';

import 'package:http/http.dart' as Http;
import 'package:pokeapi/dao/api.dart';
import 'package:pokeapi/dao/berry/berry.dart';
import 'package:pokeapi/dao/common.dart';
import 'package:pokeapi/dao/pokemon/pokemon.dart';

class PokeAPI {
  static final baseUrl = "https://pokeapi.co/api/v2/";

  static Future<Api> getAPI() async {
    var url = baseUrl;
    var response = await Http.get(url);
    Map map = json.decode(response.body);
    return Api.fromJson(map);
  }

  static Future<CommonDAO> getAbility() async {
    var baseAPI = await getAPI();
    var response = await Http.get(baseAPI.ability);
    Map map = json.decode(response.body);
    return CommonDAO.fromJson(map);
  }

  static Future<List<Berry>> getBerryList(int offset, int limit) async {
    List<Berry> berryList = new List();
    var baseAPI = await getAPI();
    var url = baseAPI.berry + "?offset=$offset&limit=$limit";
    var response = await Http.get(url);
    Map berryListMap = json.decode(response.body);
    List<CommonResult> commonResultList =
        CommonDAO.fromJson(berryListMap).results;
    for (CommonResult result in commonResultList) {
      response = await Http.get(result.url);
      Map berryMap = json.decode(response.body);
      berryList.add(Berry.fromJson(berryMap));
    }
    return berryList;
  }

  static Future<List<Pokemon>> getPokemonList(int offset, int limit) async {
    List<Pokemon> pokemonList = new List();
    var baseAPI = await getAPI();
    var url = baseAPI.pokemon + "?offset=$offset&limit=$limit";
    var response = await Http.get(url);
    Map pokemonListMap = json.decode(response.body);
    List<CommonResult> commonResultList =
        CommonDAO.fromJson(pokemonListMap).results;
    for (CommonResult result in commonResultList) {
      response = await Http.get(result.url);
      Map pokemonMap = json.decode(response.body);
      pokemonList.add(Pokemon.fromJson(pokemonMap));
    }
    return pokemonList;
  }
}
