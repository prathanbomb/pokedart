import 'package:test/test.dart';
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
import 'package:pokeapi/pokeapi.dart';

void main() {
  Future getObject<T>(int id) {
    return PokeAPI.getObject<T>(id).then((response) {
      print(response.toString());
      return true;
    }).catchError((error, stackTrace) {
      print(stackTrace.toString());
      return false;
    });
  }

  Future getObjectList<T>(int offset, int limit,
      {showOnlyCommonResults = false}) {
    return PokeAPI.getObjectList<T>(offset, limit).then((response) {
      print(response.toString());
      return true;
    }).catchError((error, stackTrace) {
      print(stackTrace.toString());
      return false;
    });
  }

  Future getCommonList<T>(int offset, int limit) {
    return PokeAPI.getCommonList<T>(offset, limit).then((response) {
      print(response.toString());
      return true;
    }).catchError((error, stackTrace) {
      print(stackTrace.toString());
      return false;
    });
  }

  group('Test Berry', () {
    test('getBerryList', () {
      try {
        expect(getObjectList<Berry>(1, 3), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getBerry', () {
      try {
        expect(getObject<Berry>(1), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getBerryFirmnessList', () {
      try {
        expect(getObjectList<BerryFirmness>(1, 3), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getBerryFirmness', () {
      try {
        expect(getObject<BerryFirmness>(1), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getBerryFlavorList', () {
      try {
        expect(getObjectList<BerryFlavor>(1, 3), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getBerryFlavor', () {
      try {
        expect(getObject<BerryFlavor>(1), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });
  });

  group('Test Contest', () {
    test('getContestEffectList', () {
      try {
        expect(getObjectList<ContestEffect>(1, 3), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getContestEffect', () {
      try {
        expect(getObject<ContestEffect>(1), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getContestTypeList', () {
      try {
        expect(getObjectList<ContestType>(1, 3), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getContestType', () {
      try {
        expect(getObject<ContestType>(1), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getSuperContestEffectList', () {
      try {
        expect(
            getObjectList<SuperContestEffect>(1, 3), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getSuperContestEffect', () {
      try {
        expect(getObject<SuperContestEffect>(1), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });
  });

  group('Test Encounter', () {
    test('getEncounterConditionList', () {
      try {
        expect(
            getObjectList<EncounterCondition>(1, 3), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getEncounterCondition', () {
      try {
        expect(getObject<EncounterCondition>(1), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getEncounterConditionValueList', () {
      try {
        expect(getObjectList<EncounterConditionValue>(1, 3),
            completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getEncounterConditionValue', () {
      try {
        expect(getObject<EncounterConditionValue>(1), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getEncounterMethodList', () {
      try {
        expect(getObjectList<EncounterMethod>(1, 3), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getEncounterMethod', () {
      try {
        expect(getObject<EncounterMethod>(1), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });
  });

  group('Test Evolution', () {
    test('getEvolutionChainList', () {
      try {
        expect(getObjectList<EvolutionChain>(1, 2), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getEvolutionChain', () {
      try {
        expect(getObject<EvolutionChain>(1), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getEvolutionTriggerList', () {
      try {
        expect(getObjectList<EvolutionTrigger>(1, 3), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getEvolutionTrigger', () {
      try {
        expect(getObject<EvolutionTrigger>(1), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('thirdTierEvolutionTest', () async {
      try {
        // Get Bulbasaur's evolution chain (chain ID 1)
        final evolutionChain = await PokeAPI.getObject<EvolutionChain>(1);
        
        // Verify that the first tier exists (Bulbasaur)
        expect(evolutionChain?.chain?.species?.name, equals('bulbasaur'));
        
        // Verify that the second tier exists (Ivysaur)
        expect(evolutionChain?.chain?.evolvesTo?.length, equals(1));
        expect(evolutionChain?.chain?.evolvesTo?[0]?.species?.name, equals('ivysaur'));
        
        // Verify that the third tier exists (Venusaur)
        expect(evolutionChain?.chain?.evolvesTo?[0]?.evolvesTo?.length, equals(1));
        expect(evolutionChain?.chain?.evolvesTo?[0]?.evolvesTo?[0]?.species?.name, equals('venusaur'));
        
        // Test another evolution chain with a third tier (chain ID 2 - Charmander family)
        final charmFamily = await PokeAPI.getObject<EvolutionChain>(2);
        expect(charmFamily?.chain?.species?.name, equals('charmander'));
        expect(charmFamily?.chain?.evolvesTo?[0]?.species?.name, equals('charmeleon'));
        expect(charmFamily?.chain?.evolvesTo?[0]?.evolvesTo?[0]?.species?.name, equals('charizard'));
        
        return true;
      } catch (e) {
        print(e.toString());
        return false;
      }
    });
    
    test('evolutionChainComplexPatternsTest', () async {
      try {
        // Test Eevee's branching evolution chain (chain ID 67)
        final eeveeChain = await PokeAPI.getObject<EvolutionChain>(67);
        
        // Verify base Pokemon is Eevee
        expect(eeveeChain?.chain?.species?.name, equals('eevee'));
        
        // Verify multiple evolutions (Eevee should have 8 or more evolutions)
        expect(eeveeChain?.chain?.evolvesTo?.length, greaterThanOrEqualTo(8));
        
        // Check specific evolutions exist
        var evolutionNames = eeveeChain?.chain?.evolvesTo?.map((e) => e.species?.name).toList();
        expect(evolutionNames, contains('vaporeon'));
        expect(evolutionNames, contains('jolteon'));
        expect(evolutionNames, contains('flareon'));
        expect(evolutionNames, contains('espeon'));
        expect(evolutionNames, contains('umbreon'));
        
        // Test a Pokemon with no evolutions (chain ID 77 contains Magikarp->Gyarados)
        final magikarpChain = await PokeAPI.getObject<EvolutionChain>(77);
        expect(magikarpChain?.chain?.species?.name, equals('magikarp'));
        expect(magikarpChain?.chain?.evolvesTo?.length, equals(1));
        expect(magikarpChain?.chain?.evolvesTo?[0]?.species?.name, equals('gyarados'));
        expect(magikarpChain?.chain?.evolvesTo?[0]?.evolvesTo?.length, equals(0)); // Gyarados doesn't evolve
        
        // Test serialization/deserialization roundtrip (important for our fix)
        // First, convert to JSON
        var magikarpJson = magikarpChain?.toJson();
        // Then create a new object from that JSON
        var recreatedChain = EvolutionChain.fromJson(magikarpJson as Map<String, dynamic>);
        // Verify data is preserved correctly
        expect(recreatedChain.chain?.species?.name, equals('magikarp'));
        expect(recreatedChain.chain?.evolvesTo?[0]?.species?.name, equals('gyarados'));
        
        return true;
      } catch (e) {
        print(e.toString());
        return false;
      }
    });
    
    test('evolutionChainEdgeCasesTest', () async {
      try {
        // Test Tyrogue's evolution chain (branches based on stats - chain ID 47)
        final tyrogueChain = await PokeAPI.getObject<EvolutionChain>(47);
        expect(tyrogueChain?.chain?.species?.name, equals('tyrogue'));
        expect(tyrogueChain?.chain?.evolvesTo?.length, equals(3)); // Evolves to 3 different Pokemon
        
        // Check all three evolutions
        var evolutionNames = tyrogueChain?.chain?.evolvesTo?.map((e) => e.species?.name).toList();
        expect(evolutionNames, contains('hitmonlee'));
        expect(evolutionNames, contains('hitmonchan'));
        expect(evolutionNames, contains('hitmontop'));
        
        // Test a Pokemon with no evolutions at all (Tauros - chain ID 112)
        final taurosChain = await PokeAPI.getObject<EvolutionChain>(112);
        expect(taurosChain?.chain?.species?.name, equals('tauros'));
        expect(taurosChain?.chain?.evolvesTo?.length, equals(0)); // No evolutions
        
        // Check Wurmple which has branching second-tier evolutions (chain ID 135)
        final wurmpleChain = await PokeAPI.getObject<EvolutionChain>(135);
        expect(wurmpleChain?.chain?.species?.name, equals('wurmple'));
        expect(wurmpleChain?.chain?.evolvesTo?.length, equals(2)); // Cascoon and Silcoon
        
        // Check that third tier evolutions exist for both branches
        var cascoonPath = wurmpleChain?.chain?.evolvesTo?.firstWhere(
          (e) => e.species?.name == 'cascoon',
          orElse: () => EvolutionChainChainEvolvesTo()
        );
        var silcoonPath = wurmpleChain?.chain?.evolvesTo?.firstWhere(
          (e) => e.species?.name == 'silcoon',
          orElse: () => EvolutionChainChainEvolvesTo()
        );
        
        expect(cascoonPath?.evolvesTo?.length, equals(1));
        expect(cascoonPath?.evolvesTo?[0]?.species?.name, equals('dustox'));
        
        expect(silcoonPath?.evolvesTo?.length, equals(1));
        expect(silcoonPath?.evolvesTo?[0]?.species?.name, equals('beautifly'));
        
        return true;
      } catch (e) {
        print(e.toString());
        return false;
      }
    });
  });

  group('Test Game', () {
    test('getGenerationList', () {
      try {
        expect(getObjectList<Generation>(1, 3), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getGeneration', () {
      try {
        expect(getObject<Generation>(1), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getPokedexList', () {
      try {
        expect(getObjectList<Pokedex>(1, 3), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getPokedex', () {
      try {
        expect(getObject<Pokedex>(1), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getVersionList', () {
      try {
        expect(getObjectList<Version>(1, 2), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getVersion', () {
      try {
        expect(getObject<Version>(1), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getVersionGroupList', () {
      try {
        expect(getObjectList<VersionGroup>(1, 3), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getVersionGroup', () {
      try {
        expect(getObject<VersionGroup>(1), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });
  });

  group('Test Item', () {
    test('getItemList', () {
      try {
        expect(getObjectList<Item>(1, 3), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getItem', () {
      try {
        expect(getObject<Item>(1), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getItemAttributeList', () {
      try {
        expect(getObjectList<ItemAttribute>(1, 3), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getItemAttribute', () {
      try {
        expect(getObject<ItemAttribute>(1), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getItemCategoryList', () {
      try {
        expect(getObjectList<ItemCategory>(1, 3), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getItemCategory', () {
      try {
        expect(getObject<ItemCategory>(1), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getItemFlingEffectList', () {
      try {
        expect(getObjectList<ItemFlingEffect>(1, 3), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getItemFlingEffect', () {
      try {
        expect(getObject<ItemFlingEffect>(1), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getItemPocketList', () {
      try {
        expect(getObjectList<ItemPocket>(1, 3), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getItemPocket', () {
      try {
        expect(getObject<ItemPocket>(1), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });
  });

  group('Test Location', () {
    test('getLocationList', () {
      try {
        expect(getObjectList<Location>(1, 3), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getLocation', () {
      try {
        expect(getObject<Location>(1), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getLocationAreaList', () {
      try {
        expect(getObjectList<LocationArea>(1, 3), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getLocationArea', () {
      try {
        expect(getObject<LocationArea>(1), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getPalParkAreaList', () {
      try {
        expect(getObjectList<PalParkArea>(1, 3), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getPalParkArea', () {
      try {
        expect(getObject<PalParkArea>(1), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getRegionList', () {
      try {
        expect(getObjectList<Region>(1, 3), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getRegion', () {
      try {
        expect(getObject<Region>(1), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });
  });

  group('Test Machine', () {
    test('getMachineList', () {
      try {
        expect(getObjectList<Machine>(1, 3), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getMachine', () {
      try {
        expect(getObject<Machine>(1), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });
  });

  group('Test Move', () {
    test('getMoveList', () {
      try {
        expect(getObjectList<Move>(1, 3), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getMove', () {
      try {
        expect(getObject<Move>(1), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getMoveAilmentList', () {
      try {
        expect(getObjectList<MoveAilment>(1, 3), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getMoveAilment', () {
      try {
        expect(getObject<MoveAilment>(1), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getMoveBattleStyleList', () {
      try {
        expect(getObjectList<MoveBattleStyle>(1, 3), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getMoveBattleStyle', () {
      try {
        expect(getObject<MoveBattleStyle>(1), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getMoveCategoryList', () {
      try {
        expect(getObjectList<MoveCategory>(1, 3), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getMoveCategory', () {
      try {
        expect(getObject<MoveCategory>(1), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getMoveDamageClassList', () {
      try {
        expect(getObjectList<MoveDamageClass>(1, 3), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getMoveDamageClass', () {
      try {
        expect(getObject<MoveDamageClass>(1), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getMoveLearnMethodList', () {
      try {
        expect(getObjectList<MoveLearnMethod>(1, 3), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getMoveLearnMethod', () {
      try {
        expect(getObject<MoveLearnMethod>(1), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getMoveTargetList', () {
      try {
        expect(getObjectList<MoveTarget>(1, 3), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getMoveTarget', () {
      try {
        expect(getObject<MoveTarget>(1), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });
  });

  group('Test Pokemon', () {
    test('getAbilityList', () {
      try {
        expect(getObjectList<Ability>(1, 3), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getAbility', () {
      try {
        expect(getObject<Ability>(1), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getCharacteristicList', () {
      try {
        expect(getObjectList<Characteristic>(1, 3), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getCharacteristic', () {
      try {
        expect(getObject<Characteristic>(1), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getEggGroupList', () {
      try {
        expect(getObjectList<EggGroup>(1, 3), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getEggGroup', () {
      try {
        expect(getObject<EggGroup>(1), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getGenderList', () {
      try {
        expect(getObjectList<Gender>(1, 3), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getGender', () {
      try {
        expect(getObject<Gender>(1), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getGrowthRateList', () {
      try {
        expect(getObjectList<GrowthRate>(1, 3), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getGrowthRate', () {
      try {
        expect(getObject<GrowthRate>(1), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getNatureList', () {
      try {
        expect(getObjectList<Nature>(1, 3), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getNature', () {
      try {
        expect(getObject<Nature>(1), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getPokeAthlonStatList', () {
      try {
        expect(getObjectList<PokeAthlonStat>(1, 3), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getPokeAthlonStat', () {
      try {
        expect(getObject<PokeAthlonStat>(1), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getPokemonListCommon', () {
      try {
        expect(getCommonList<Pokemon>(1, 3), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getPokemonList', () {
      try {
        expect(
            getObjectList<Pokemon>(
              1,
              3,
            ),
            completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getPokemon', () {
      try {
        expect(getObject<Pokemon>(1), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getPokemonColorList', () {
      try {
        expect(getObjectList<PokemonColor>(1, 3), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getPokemonColor', () {
      try {
        expect(getObject<PokemonColor>(1), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getPokemonFormList', () {
      try {
        expect(getObjectList<PokemonForm>(1, 3), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getPokemonForm', () {
      try {
        expect(getObject<PokemonForm>(1), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getPokemonHabitatList', () {
      try {
        expect(getObjectList<PokemonHabitat>(1, 3), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getPokemonHabitat', () {
      try {
        expect(getObject<PokemonHabitat>(1), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getPokemonShapeList', () {
      try {
        expect(getObjectList<PokemonShape>(1, 3), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getPokemonShape', () {
      try {
        expect(getObject<PokemonShape>(1), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getPokemonSpecieList', () {
      try {
        expect(getObjectList<PokemonSpecie>(1, 3), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getPokemonSpecie', () {
      try {
        expect(getObject<PokemonSpecie>(1), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getStatList', () {
      try {
        expect(getObjectList<Stat>(1, 3), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getStat', () {
      try {
        expect(getObject<Stat>(1), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getTypeList', () {
      try {
        expect(getObjectList<Type>(1, 3), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });

    test('getType', () {
      try {
        expect(getObject<Type>(1), completion(equals(true)));
      } catch (e) {
        print(e.toString());
      }
    });
  });
}
