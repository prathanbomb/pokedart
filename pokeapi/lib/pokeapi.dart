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
import 'package:pokeapi/model/utils/cache_config.dart';
import 'package:pokeapi/model/utils/cache_manager.dart';
import 'package:pokeapi/model/utils/common.dart';
import 'package:pokeapi/model/utils/connectivity_service.dart';

/// The main class for interacting with the PokeAPI.
class PokeAPI {
  static get _baseUrl => "https://pokeapi.co/api/v2/";
  
  // Cache configuration
  static CacheConfig _cacheConfig = CacheConfig.defaultConfig;
  static final CacheManager _cacheManager = CacheManager();
  static final ConnectivityService _connectivityService = ConnectivityService();
  
  // Memory cache for frequently accessed objects (to avoid disk I/O)
  static final Map<String, dynamic> _memoryCache = {};
  
  /// Configures the caching behavior.
  /// 
  /// To disable caching, use `PokeAPI.configureCaching(CacheConfig.noCache)`.
  static void configureCaching(CacheConfig config) {
    _cacheConfig = config;
    
    // Clear memory cache when changing config
    if (!config.enabled) {
      _memoryCache.clear();
    }
  }
  
  /// Clears all cached data.
  static Future<bool> clearCache() async {
    _memoryCache.clear();
    return await _cacheManager.clearCache();
  }
  
  /// Checks if an item exists in cache.
  static Future<bool> isInCache(String cacheKey) async {
    if (!_cacheConfig.enabled) return false;
    
    // Check memory cache first
    if (_memoryCache.containsKey(cacheKey)) {
      return true;
    }
    
    // Then check disk cache
    final data = await _cacheManager.getData(cacheKey);
    return data != null;
  }
  
  /// Generates a cache key based on the object type and parameters.
  static String _generateCacheKey<T>(String type, {int? id, String? name, int? offset, int? limit}) {
    if (id != null) {
      return 'pokeapi_${T.toString()}_$id';
    } else if (name != null) {
      return 'pokeapi_${T.toString()}_$name';
    } else if (offset != null && limit != null) {
      return 'pokeapi_${T.toString()}_list_${offset}_$limit';
    } else {
      return 'pokeapi_${T.toString()}_$type';
    }
  }
  
  /// Stores data in the cache.
  static Future<void> _cacheData(String cacheKey, dynamic data) async {
    if (!_cacheConfig.enabled) return;
    
    // Store in memory cache
    if (_memoryCache.length >= _cacheConfig.maxMemoryCacheItems) {
      // Remove a random item if cache is full
      _memoryCache.remove(_memoryCache.keys.first);
    }
    _memoryCache[cacheKey] = data;
    
    // Store in persistent cache
    await _cacheManager.setData(cacheKey, data, expiryDuration: _cacheConfig.expiryDuration);
  }
  
  /// Retrieves data from the cache.
  static Future<dynamic> _getCachedData(String cacheKey) async {
    if (!_cacheConfig.enabled) return null;
    
    // Check memory cache first
    if (_memoryCache.containsKey(cacheKey)) {
      return _memoryCache[cacheKey];
    }
    
    // Then check disk cache
    final data = await _cacheManager.getData(cacheKey);
    if (data != null) {
      // Update memory cache with this data
      _memoryCache[cacheKey] = data;
    }
    
    return data;
  }
  
  static Future<Api> _getAPI() async {
    // Check if we have the API structure cached
    final cacheKey = _generateCacheKey<Api>('base');
    final cachedApi = await _getCachedData(cacheKey);
    
    if (cachedApi != null) {
      return Api.fromJson(cachedApi);
    }
    
    try {
      final response = await Http.get(Uri.parse(_baseUrl));
      Map map = json.decode(response.body);
      final api = Api.fromJson(map as Map<String, dynamic>);
      
      // Cache the API structure
      await _cacheData(cacheKey, map);
      
      return api;
    } catch (e) {
      print('Error fetching API: $e');
      throw Exception('Failed to load API structure: $e');
    }
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
    if (T == EncounterConditionValue) return EncounterConditionValue.fromJson(map as Map<String, dynamic>) as T;
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

  /// Fetches a list of resources with pagination info.
  /// 
  /// This method returns basic information for each resource (name and URL).
  static Future<List<NamedAPIResource>?> getCommonList<T>(
      int offset, int limit) async {
    // Check cache first
    final cacheKey = _generateCacheKey<T>('commonlist', offset: offset, limit: limit);
    final cachedData = await _getCachedData(cacheKey);
    
    if (cachedData != null) {
      List<NamedAPIResource> commonResultList = [];
      for (var item in cachedData) {
        commonResultList.add(NamedAPIResource.fromJson(item));
      }
      return commonResultList;
    }
    
    // Check connectivity
    final isConnected = await _connectivityService.isConnected();
    if (!isConnected && !_cacheConfig.useWhenOffline) {
      throw Exception('No internet connection and offline mode is disabled');
    }
    
    try {
      String? baseUrl = await getBaseUrl<T>();
      if (baseUrl == null) {
        throw Exception('No base URL found for type $T');
      }
      String url = baseUrl;
      url += "?offset=${offset - 1}&limit=$limit";
      
      final response = await Http.get(Uri.parse(url));
      Map listMap = json.decode(response.body);
      List<NamedAPIResource>? commonResultList = Common.fromJson(listMap as Map<String, dynamic>).results;
      
      // Cache the results
      if (commonResultList != null) {
        final jsonList = commonResultList.map((resource) => resource.toJson()).toList();
        await _cacheData(cacheKey, jsonList);
      }
      
      return commonResultList;
    } catch (e) {
      print('Error fetching common list: $e');
      throw Exception('Failed to load resource list: $e');
    }
  }

  /// Fetches a list of detailed objects.
  /// 
  /// This method returns complete objects rather than just basic info.
  static Future<List<T?>> getObjectList<T>(int offset, int limit) async {
    // Check cache first
    final cacheKey = _generateCacheKey<T>('objectlist', offset: offset, limit: limit);
    final cachedData = await _getCachedData(cacheKey);
    
    if (cachedData != null) {
      return _deserializeList<T>(cachedData);
    }
    
    // Check connectivity
    final isConnected = await _connectivityService.isConnected();
    if (!isConnected && !_cacheConfig.useWhenOffline) {
      throw Exception('No internet connection and offline mode is disabled');
    }
    
    try {
      List<T?> objectList =  [];
      String? baseUrl = await getBaseUrl<T>();
      if (baseUrl == null) {
        throw Exception('No base URL found for type $T');
      }
      String url = baseUrl;
      url += "?offset=${offset - 1}&limit=$limit";
      var response = await Http.get(Uri.parse(url));
      Map listMap = json.decode(response.body);
      List<NamedAPIResource> commonResultList = Common.fromJson(listMap as Map<String, dynamic>).results!;
      
      final List<Map<String, dynamic>> rawResponseList = [];
      
      for (NamedAPIResource result in commonResultList) {
        response = await Http.get(Uri.parse(result.url!));
        Map<String, dynamic> responseMap = json.decode(response.body);
        rawResponseList.add(responseMap);
        objectList.add(_mapJson<T>(response));
      }
      
      // Cache the raw responses for future reconstruction
      await _cacheData(cacheKey, rawResponseList);
      
      return objectList;
    } catch (e) {
      print('Error fetching object list: $e');
      throw Exception('Failed to load object list: $e');
    }
  }

  /// Fetches a single object by its ID.
  static Future<T?> getObject<T>(int id) async {
    // Check cache first
    final cacheKey = _generateCacheKey<T>('object', id: id);
    final cachedData = await _getCachedData(cacheKey);
    
    if (cachedData != null) {
      return _deserialize<T>(cachedData);
    }
    
    // Check connectivity
    final isConnected = await _connectivityService.isConnected();
    if (!isConnected && !_cacheConfig.useWhenOffline) {
      throw Exception('No internet connection and offline mode is disabled');
    }
    
    try {
      String? baseUrl = await getBaseUrl<T>();
      if (baseUrl == null) {
        throw Exception('No base URL found for type $T');
      }
      String url = baseUrl;
      url += "?offset=${id - 1}&limit=1";
      var response = await Http.get(Uri.parse(url));
      Map listMap = json.decode(response.body);
      List<NamedAPIResource> commonResultList = Common.fromJson(listMap as Map<String, dynamic>).results!;
      
      if (commonResultList.isNotEmpty) {
        if (commonResultList[0].url == null) {
          throw Exception('URL is null for the requested resource');
        }
        response = await Http.get(Uri.parse(commonResultList[0].url!));
        final responseData = json.decode(response.body);
        
        // Cache the raw response for future reconstruction
        await _cacheData(cacheKey, responseData);
        
        return _mapJson<T>(response);
      } else {
        return null;
      }
    } catch (e) {
      print('Error fetching object: $e');
      throw Exception('Failed to load object with ID $id: $e');
    }
  }

  /// Fetches a resource directly by name using the PokeAPI name parameter
  /// 
  /// Example: `Berry? chestoBerry = await PokeAPI.getObjectByName<Berry>("chesto");`
  /// 
  /// This provides a more convenient way to fetch objects when you know their name
  /// rather than their ID.
  static Future<T?> getObjectByName<T>(String name) async {
    // Check cache first
    final cacheKey = _generateCacheKey<T>('object', name: name);
    final cachedData = await _getCachedData(cacheKey);
    
    if (cachedData != null) {
      return _deserialize<T>(cachedData);
    }
    
    // Check connectivity
    final isConnected = await _connectivityService.isConnected();
    if (!isConnected && !_cacheConfig.useWhenOffline) {
      throw Exception('No internet connection and offline mode is disabled');
    }
    
    try {
      String? baseUrl = await getBaseUrl<T>();
      if (baseUrl == null) {
        throw Exception('No base URL found for type $T');
      }
      // Remove trailing slash if present
      if (baseUrl.endsWith('/')) {
        baseUrl = baseUrl.substring(0, baseUrl.length - 1);
      }
      // Direct access by name is supported by the PokeAPI
      String url = "$baseUrl/$name";
      
      var response = await Http.get(Uri.parse(url));
      
      // Check if the response was successful
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        
        // Cache the raw response for future reconstruction
        await _cacheData(cacheKey, responseData);
        
        return _mapJson<T>(response);
      } else {
        print("Error fetching object by name: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Exception when fetching object by name: $e");
      return null;
    }
  }

  /// Gets the base URL for the specified resource type.
  static Future<String?> getBaseUrl<T>() async {
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
  
  /// Helper method to deserialize a single object from cached data.
  static T _deserialize<T>(Map<String, dynamic> data) {
    if (T == Ability) return Ability.fromJson(data) as T;
    if (T == Berry) return Berry.fromJson(data) as T;
    if (T == BerryFirmness) return BerryFirmness.fromJson(data) as T;
    if (T == BerryFlavor) return BerryFlavor.fromJson(data) as T;
    if (T == Characteristic) return Characteristic.fromJson(data) as T;
    if (T == EggGroup) return EggGroup.fromJson(data) as T;
    if (T == Gender) return Gender.fromJson(data) as T;
    if (T == GrowthRate) return GrowthRate.fromJson(data) as T;
    if (T == Item) return Item.fromJson(data) as T;
    if (T == ItemAbility) return ItemAbility.fromJson(data) as T;
    if (T == ItemCategory) return ItemCategory.fromJson(data) as T;
    if (T == ItemFlingEffect) return ItemFlingEffect.fromJson(data) as T;
    if (T == ItemPocket) return ItemPocket.fromJson(data) as T;
    if (T == Nature) return Nature.fromJson(data) as T;
    if (T == PokeAthlonStat) return PokeAthlonStat.fromJson(data) as T;
    if (T == Pokemon) return Pokemon.fromJson(data) as T;
    if (T == PokemonColor) return PokemonColor.fromJson(data) as T;
    if (T == PokemonForm) return PokemonForm.fromJson(data) as T;
    if (T == PokemonHabitat) return PokemonHabitat.fromJson(data) as T;
    if (T == PokemonShape) return PokemonShape.fromJson(data) as T;
    if (T == PokemonSpecie) return PokemonSpecie.fromJson(data) as T;
    if (T == Stat) return Stat.fromJson(data) as T;
    if (T == Type) return Type.fromJson(data) as T;
    if (T == ContestEffect) return ContestEffect.fromJson(data) as T;
    if (T == ContestType) return ContestType.fromJson(data) as T;
    if (T == SuperContestEffect) return SuperContestEffect.fromJson(data) as T;
    if (T == EncounterCondition) return EncounterCondition.fromJson(data) as T;
    if (T == EncounterConditionValue) return EncounterConditionValue.fromJson(data) as T;
    if (T == EncounterMethod) return EncounterMethod.fromJson(data) as T;
    if (T == EvolutionChain) return EvolutionChain.fromJson(data) as T;
    if (T == EvolutionTrigger) return EvolutionTrigger.fromJson(data) as T;
    if (T == Generation) return Generation.fromJson(data) as T;
    if (T == Pokedex) return Pokedex.fromJson(data) as T;
    if (T == Version) return Version.fromJson(data) as T;
    if (T == VersionGroup) return VersionGroup.fromJson(data) as T;
    if (T == Location) return Location.fromJson(data) as T;
    if (T == LocationArea) return LocationArea.fromJson(data) as T;
    if (T == PalParkArea) return PalParkArea.fromJson(data) as T;
    if (T == Region) return Region.fromJson(data) as T;
    if (T == Machine) return Machine.fromJson(data) as T;
    if (T == Move) return Move.fromJson(data) as T;
    if (T == MoveAilment) return MoveAilment.fromJson(data) as T;
    if (T == MoveBattleStyle) return MoveBattleStyle.fromJson(data) as T;
    if (T == MoveCategory) return MoveCategory.fromJson(data) as T;
    if (T == MoveDamageClass) return MoveDamageClass.fromJson(data) as T;
    if (T == MoveLearnMethod) return MoveLearnMethod.fromJson(data) as T;
    if (T == MoveTarget) return MoveTarget.fromJson(data) as T;
    
    throw Exception('Unsupported type for deserialization: $T');
  }
  
  /// Helper method to deserialize a list of objects from cached data.
  static List<T?> _deserializeList<T>(List<dynamic> dataList) {
    List<T?> resultList = [];
    
    for (var data in dataList) {
      resultList.add(_deserialize<T>(data));
    }
    
    return resultList;
  }
}
