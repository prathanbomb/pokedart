class Api {
  String? ability;
  String? berry;
  String? berryFirmness;
  String? berryFlavor;
  String? characteristic;
  String? contestEffect;
  String? contestType;
  String? eggGroup;
  String? encounterCondition;
  String? encounterConditionValue;
  String? encounterMethod;
  String? evolutionChain;
  String? evolutionTrigger;
  String? gender;
  String? generation;
  String? growthRate;
  String? item;
  String? itemAttribute;
  String? itemCategory;
  String? itemFlingEffect;
  String? itemPocket;
  String? language;
  String? location;
  String? locationArea;
  String? machine;
  String? move;
  String? moveAilment;
  String? moveBattleStyle;
  String? moveCategory;
  String? moveDamageClass;
  String? moveLearnMethod;
  String? moveTarget;
  String? nature;
  String? palParkArea;
  String? pokeathlonStat;
  String? pokedex;
  String? pokemon;
  String? pokemonColor;
  String? pokemonForm;
  String? pokemonHabitat;
  String? pokemonShape;
  String? pokemonSpecies;
  String? region;
  String? stat;
  String? superContestEffect;
  String? type;
  String? version;
  String? versionGroup;

  Api(
      {this.ability,
      this.berry,
      this.berryFirmness,
      this.berryFlavor,
      this.characteristic,
      this.contestEffect,
      this.contestType,
      this.eggGroup,
      this.encounterCondition,
      this.encounterConditionValue,
      this.encounterMethod,
      this.evolutionChain,
      this.evolutionTrigger,
      this.gender,
      this.generation,
      this.growthRate,
      this.item,
      this.itemAttribute,
      this.itemCategory,
      this.itemFlingEffect,
      this.itemPocket,
      this.language,
      this.location,
      this.locationArea,
      this.machine,
      this.move,
      this.moveAilment,
      this.moveBattleStyle,
      this.moveCategory,
      this.moveDamageClass,
      this.moveLearnMethod,
      this.moveTarget,
      this.nature,
      this.palParkArea,
      this.pokeathlonStat,
      this.pokedex,
      this.pokemon,
      this.pokemonColor,
      this.pokemonForm,
      this.pokemonHabitat,
      this.pokemonShape,
      this.pokemonSpecies,
      this.region,
      this.stat,
      this.superContestEffect,
      this.type,
      this.version,
      this.versionGroup});

  Api.fromJson(Map<String, dynamic> json) {
    ability = json['ability'];
    berry = json['berry'];
    berryFirmness = json['berry-firmness'];
    berryFlavor = json['berry-flavor'];
    characteristic = json['characteristic'];
    contestEffect = json['contest-effect'];
    contestType = json['contest-type'];
    eggGroup = json['egg-group'];
    encounterCondition = json['encounter-condition'];
    encounterConditionValue = json['encounter-condition-value'];
    encounterMethod = json['encounter-method'];
    evolutionChain = json['evolution-chain'];
    evolutionTrigger = json['evolution-trigger'];
    gender = json['gender'];
    generation = json['generation'];
    growthRate = json['growth-rate'];
    item = json['item'];
    itemAttribute = json['item-attribute'];
    itemCategory = json['item-category'];
    itemFlingEffect = json['item-fling-effect'];
    itemPocket = json['item-pocket'];
    language = json['language'];
    location = json['location'];
    locationArea = json['location-area'];
    machine = json['machine'];
    move = json['move'];
    moveAilment = json['move-ailment'];
    moveBattleStyle = json['move-battle-style'];
    moveCategory = json['move-category'];
    moveDamageClass = json['move-damage-class'];
    moveLearnMethod = json['move-learn-method'];
    moveTarget = json['move-target'];
    nature = json['nature'];
    palParkArea = json['pal-park-area'];
    pokeathlonStat = json['pokeathlon-stat'];
    pokedex = json['pokedex'];
    pokemon = json['pokemon'];
    pokemonColor = json['pokemon-color'];
    pokemonForm = json['pokemon-form'];
    pokemonHabitat = json['pokemon-habitat'];
    pokemonShape = json['pokemon-shape'];
    pokemonSpecies = json['pokemon-species'];
    region = json['region'];
    stat = json['stat'];
    superContestEffect = json['super-contest-effect'];
    type = json['type'];
    version = json['version'];
    versionGroup = json['version-group'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ability'] = this.ability;
    data['berry'] = this.berry;
    data['berry-firmness'] = this.berryFirmness;
    data['berry-flavor'] = this.berryFlavor;
    data['characteristic'] = this.characteristic;
    data['contest-effect'] = this.contestEffect;
    data['contest-type'] = this.contestType;
    data['egg-group'] = this.eggGroup;
    data['encounter-condition'] = this.encounterCondition;
    data['encounter-condition-value'] = this.encounterConditionValue;
    data['encounter-method'] = this.encounterMethod;
    data['evolution-chain'] = this.evolutionChain;
    data['evolution-trigger'] = this.evolutionTrigger;
    data['gender'] = this.gender;
    data['generation'] = this.generation;
    data['growth-rate'] = this.growthRate;
    data['item'] = this.item;
    data['item-attribute'] = this.itemAttribute;
    data['item-category'] = this.itemCategory;
    data['item-fling-effect'] = this.itemFlingEffect;
    data['item-pocket'] = this.itemPocket;
    data['language'] = this.language;
    data['location'] = this.location;
    data['location-area'] = this.locationArea;
    data['machine'] = this.machine;
    data['move'] = this.move;
    data['move-ailment'] = this.moveAilment;
    data['move-battle-style'] = this.moveBattleStyle;
    data['move-category'] = this.moveCategory;
    data['move-damage-class'] = this.moveDamageClass;
    data['move-learn-method'] = this.moveLearnMethod;
    data['move-target'] = this.moveTarget;
    data['nature'] = this.nature;
    data['pal-park-area'] = this.palParkArea;
    data['pokeathlon-stat'] = this.pokeathlonStat;
    data['pokedex'] = this.pokedex;
    data['pokemon'] = this.pokemon;
    data['pokemon-color'] = this.pokemonColor;
    data['pokemon-form'] = this.pokemonForm;
    data['pokemon-habitat'] = this.pokemonHabitat;
    data['pokemon-shape'] = this.pokemonShape;
    data['pokemon-species'] = this.pokemonSpecies;
    data['region'] = this.region;
    data['stat'] = this.stat;
    data['super-contest-effect'] = this.superContestEffect;
    data['type'] = this.type;
    data['version'] = this.version;
    data['version-group'] = this.versionGroup;
    return data;
  }

  @override
  String toString() {
    return 'ApiDao{ability: $ability, berry: $berry, berryFirmness: $berryFirmness, berryFlavor: $berryFlavor, characteristic: $characteristic, contestEffect: $contestEffect, contestType: $contestType, eggGroup: $eggGroup, encounterCondition: $encounterCondition, encounterConditionValue: $encounterConditionValue, encounterMethod: $encounterMethod, evolutionChain: $evolutionChain, evolutionTrigger: $evolutionTrigger, gender: $gender, generation: $generation, growthRate: $growthRate, item: $item, itemAttribute: $itemAttribute, itemCategory: $itemCategory, itemFlingEffect: $itemFlingEffect, itemPocket: $itemPocket, language: $language, location: $location, locationArea: $locationArea, machine: $machine, move: $move, moveAilment: $moveAilment, moveBattleStyle: $moveBattleStyle, moveCategory: $moveCategory, moveDamageClass: $moveDamageClass, moveLearnMethod: $moveLearnMethod, moveTarget: $moveTarget, nature: $nature, palParkArea: $palParkArea, pokeathlonStat: $pokeathlonStat, pokedex: $pokedex, pokemon: $pokemon, pokemonColor: $pokemonColor, pokemonForm: $pokemonForm, pokemonHabitat: $pokemonHabitat, pokemonShape: $pokemonShape, pokemonSpecies: $pokemonSpecies, region: $region, stat: $stat, superContestEffect: $superContestEffect, type: $type, version: $version, versionGroup: $versionGroup}';
  }
}
