import 'package:pokeapi/model/utils/common.dart';

class EvolutionChain {
  EvolutionChainChain? chain;
  dynamic babyTriggerItem;
  int? id;

  EvolutionChain({this.chain, this.babyTriggerItem, this.id});

  EvolutionChain.fromJson(Map<String, dynamic> json) {
    chain = json['chain'] != null
        ?  EvolutionChainChain.fromJson(json['chain'])
        : null;
    babyTriggerItem = json['baby_trigger_item'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (this.chain != null) {
      data['chain'] = this.chain!.toJson();
    }
    data['baby_trigger_item'] = this.babyTriggerItem;
    data['id'] = this.id;
    return data;
  }

  @override
  String toString() {
    return 'EvolutionChain{chain: $chain, babyTriggerItem: $babyTriggerItem, id: $id}';
  }
}

class EvolutionChainChain {
  List<NamedAPIResource>? evolutionDetails;
  NamedAPIResource? species;
  List<EvolutionChainChainEvolvesTo>? evolvesTo;
  bool? isBaby;

  EvolutionChainChain(
      {this.evolutionDetails, this.species, this.evolvesTo, this.isBaby});

  EvolutionChainChain.fromJson(Map<String, dynamic> json) {
    if (json['evolution_details'] != null) {
      evolutionDetails =  <NamedAPIResource>[];
    }
    species = json['species'] != null
        ?  NamedAPIResource.fromJson(json['species'])
        : null;
    if (json['evolves_to'] != null) {
      evolvesTo =  <EvolutionChainChainEvolvesTo>[];
      (json['evolves_to'] as List).forEach((v) {
        evolvesTo!.add( EvolutionChainChainEvolvesTo.fromJson(v));
      });
    }
    isBaby = json['is_baby'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (this.evolutionDetails != null) {
      data['evolution_details'] = [];
    }
    if (this.species != null) {
      data['species'] = this.species!.toJson();
    }
    if (this.evolvesTo != null) {
      data['evolves_to'] = this.evolvesTo!.map((v) => v.toJson()).toList();
    }
    data['is_baby'] = this.isBaby;
    return data;
  }

  @override
  String toString() {
    return 'EvolutionChainChain{evolutionDetails: $evolutionDetails, species: $species, evolvesTo: $evolvesTo, isBaby: $isBaby}';
  }
}

class EvolutionChainChainEvolvesTo {
  List<EvolutionChainChainEvolvesToEvolutionDetail>? evolutionDetails;
  NamedAPIResource? species;
  List<EvolutionChainChainEvolvesTo>? evolvesTo;
  bool? isBaby;

  EvolutionChainChainEvolvesTo(
      {this.evolutionDetails, this.species, this.evolvesTo, this.isBaby});

  EvolutionChainChainEvolvesTo.fromJson(Map<String, dynamic> json) {
    if (json['evolution_details'] != null) {
      evolutionDetails =
           <EvolutionChainChainEvolvesToEvolutionDetail>[];
      (json['evolution_details'] as List).forEach((v) {
        evolutionDetails!
            .add( EvolutionChainChainEvolvesToEvolutionDetail.fromJson(v));
      });
    }
    species = json['species'] != null
        ?  NamedAPIResource.fromJson(json['species'])
        : null;
    if (json['evolves_to'] != null) {
      evolvesTo =  <EvolutionChainChainEvolvesTo>[];
       (json['evolves_to'] as List).forEach((v) {
        evolvesTo!.add( EvolutionChainChainEvolvesTo.fromJson(v));
      });
    }
    isBaby = json['is_baby'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (this.evolutionDetails != null) {
      data['evolution_details'] =
          this.evolutionDetails!.map((v) => v.toJson()).toList();
    }
    if (this.species != null) {
      data['species'] = this.species!.toJson();
    }
    if (this.evolvesTo != null) {
      data['evolves_to'] = [];
    }
    data['is_baby'] = this.isBaby;
    return data;
  }

  @override
  String toString() {
    return 'EvolutionChainChainEvolvesTo{evolutionDetails: $evolutionDetails, species: $species, evolvesTo: $evolvesTo, isBaby: $isBaby}';
  }
}

class EvolutionChainChainEvolvesToEvolutionDetail {
  dynamic item;
  dynamic relativePhysicalStats;
  bool? turnUpsideDown;
  dynamic gender;
  dynamic minHappiness;
  dynamic partyType;
  dynamic heldItem;
  dynamic knownMove;
  dynamic minBeauty;
  dynamic tradeSpecies;
  NamedAPIResource? trigger;
  bool? needsOverworldRain;
  dynamic partySpecies;
  dynamic minAffection;
  dynamic knownMoveType;
  String? timeOfDay;
  dynamic location;
  int? minLevel;

  EvolutionChainChainEvolvesToEvolutionDetail(
      {this.item,
      this.relativePhysicalStats,
      this.turnUpsideDown,
      this.gender,
      this.minHappiness,
      this.partyType,
      this.heldItem,
      this.knownMove,
      this.minBeauty,
      this.tradeSpecies,
      this.trigger,
      this.needsOverworldRain,
      this.partySpecies,
      this.minAffection,
      this.knownMoveType,
      this.timeOfDay,
      this.location,
      this.minLevel});

  EvolutionChainChainEvolvesToEvolutionDetail.fromJson(
      Map<String, dynamic> json) {
    item = json['item'];
    relativePhysicalStats = json['relative_physical_stats'];
    turnUpsideDown = json['turn_upside_down'];
    gender = json['gender'];
    minHappiness = json['min_happiness'];
    partyType = json['party_type'];
    heldItem = json['held_item'];
    knownMove = json['known_move'];
    minBeauty = json['min_beauty'];
    tradeSpecies = json['trade_species'];
    trigger = json['trigger'] != null
        ?  NamedAPIResource.fromJson(json['trigger'])
        : null;
    needsOverworldRain = json['needs_overworld_rain'];
    partySpecies = json['party_species'];
    minAffection = json['min_affection'];
    knownMoveType = json['known_move_type'];
    timeOfDay = json['time_of_day'];
    location = json['location'];
    minLevel = json['min_level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['item'] = this.item;
    data['relative_physical_stats'] = this.relativePhysicalStats;
    data['turn_upside_down'] = this.turnUpsideDown;
    data['gender'] = this.gender;
    data['min_happiness'] = this.minHappiness;
    data['party_type'] = this.partyType;
    data['held_item'] = this.heldItem;
    data['known_move'] = this.knownMove;
    data['min_beauty'] = this.minBeauty;
    data['trade_species'] = this.tradeSpecies;
    if (this.trigger != null) {
      data['trigger'] = this.trigger!.toJson();
    }
    data['needs_overworld_rain'] = this.needsOverworldRain;
    data['party_species'] = this.partySpecies;
    data['min_affection'] = this.minAffection;
    data['known_move_type'] = this.knownMoveType;
    data['time_of_day'] = this.timeOfDay;
    data['location'] = this.location;
    data['min_level'] = this.minLevel;
    return data;
  }

  @override
  String toString() {
    return 'EvolutionChainChainEvolvesToEvolutionDetail{item: $item, relativePhysicalStats: $relativePhysicalStats, turnUpsideDown: $turnUpsideDown, gender: $gender, minHappiness: $minHappiness, partyType: $partyType, heldItem: $heldItem, knownMove: $knownMove, minBeauty: $minBeauty, tradeSpecies: $tradeSpecies, trigger: $trigger, needsOverworldRain: $needsOverworldRain, partySpecies: $partySpecies, minAffection: $minAffection, knownMoveType: $knownMoveType, timeOfDay: $timeOfDay, location: $location, minLevel: $minLevel}';
  }
}
