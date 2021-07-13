import 'package:pokeapi/model/utils/common.dart';

class PokemonSpecie {
  int? id;
  String? name;
  int? order;
  int? genderRate;
  int? captureRate;
  int? baseHappiness;
  bool? isBaby;
  int? hatchCounter;
  bool? hasGenderDifferences;
  bool? formsSwitchable;
  NamedAPIResource? growthRate;
  List<PokedexNumbers>? pokedexNumbers;
  List<NamedAPIResource>? eggGroups;
  NamedAPIResource? color;
  NamedAPIResource? shape;
  NamedAPIResource? evolvesFromSpecies;
  NamedAPIResource? evolutionChain;
  NamedAPIResource? habitat;
  NamedAPIResource? generation;
  List<Names>? names;
  List<FlavorTextEntries>? flavorTextEntries;
  List<FormDescriptions>? formDescriptions;
  List<Genera>? genera;
  List<Varieties>? varieties;

  PokemonSpecie(
      {this.id,
      this.name,
      this.order,
      this.genderRate,
      this.captureRate,
      this.baseHappiness,
      this.isBaby,
      this.hatchCounter,
      this.hasGenderDifferences,
      this.formsSwitchable,
      this.growthRate,
      this.pokedexNumbers,
      this.eggGroups,
      this.color,
      this.shape,
      this.evolvesFromSpecies,
      this.evolutionChain,
      this.habitat,
      this.generation,
      this.names,
      this.flavorTextEntries,
      this.formDescriptions,
      this.genera,
      this.varieties});

  PokemonSpecie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    order = json['order'];
    genderRate = json['gender_rate'];
    captureRate = json['capture_rate'];
    baseHappiness = json['base_happiness'];
    isBaby = json['is_baby'];
    hatchCounter = json['hatch_counter'];
    hasGenderDifferences = json['has_gender_differences'];
    formsSwitchable = json['forms_switchable'];
    growthRate = json['growth_rate'] != null
        ?  NamedAPIResource.fromJson(json['growth_rate'])
        : null;
    if (json['pokedex_numbers'] != null) {
      pokedexNumbers =  <PokedexNumbers>[];
      json['pokedex_numbers'].forEach((v) {
        pokedexNumbers!.add( PokedexNumbers.fromJson(v));
      });
    }
    if (json['egg_groups'] != null) {
      eggGroups =  <NamedAPIResource>[];
      json['egg_groups'].forEach((v) {
        eggGroups!.add( NamedAPIResource.fromJson(v));
      });
    }
    color = json['color'] != null
        ?  NamedAPIResource.fromJson(json['color'])
        : null;
    shape = json['shape'] != null
        ?  NamedAPIResource.fromJson(json['shape'])
        : null;
    evolvesFromSpecies = json['evolves_from_species'] != null
        ?  NamedAPIResource.fromJson(json['evolves_from_species'])
        : null;
    evolutionChain = json['evolution_chain'] != null
        ?  NamedAPIResource.fromJson(json['evolution_chain'])
        : null;
    habitat = json['habitat'] != null
        ?  NamedAPIResource.fromJson(json['habitat'])
        : null;
    generation = json['generation'] != null
        ?  NamedAPIResource.fromJson(json['generation'])
        : null;
    if (json['names'] != null) {
      names =  <Names>[];
      json['names'].forEach((v) {
        names!.add( Names.fromJson(v));
      });
    }
    if (json['flavor_text_entries'] != null) {
      flavorTextEntries =  <FlavorTextEntries>[];
      json['flavor_text_entries'].forEach((v) {
        flavorTextEntries!.add( FlavorTextEntries.fromJson(v));
      });
    }
    if (json['form_descriptions'] != null) {
      formDescriptions =  <FormDescriptions>[];
      json['form_descriptions'].forEach((v) {
        formDescriptions!.add( FormDescriptions.fromJson(v));
      });
    }
    if (json['genera'] != null) {
      genera =  <Genera>[];
      json['genera'].forEach((v) {
        genera!.add( Genera.fromJson(v));
      });
    }
    if (json['varieties'] != null) {
      varieties =  <Varieties>[];
      json['varieties'].forEach((v) {
        varieties!.add( Varieties.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['order'] = this.order;
    data['gender_rate'] = this.genderRate;
    data['capture_rate'] = this.captureRate;
    data['base_happiness'] = this.baseHappiness;
    data['is_baby'] = this.isBaby;
    data['hatch_counter'] = this.hatchCounter;
    data['has_gender_differences'] = this.hasGenderDifferences;
    data['forms_switchable'] = this.formsSwitchable;
    if (this.growthRate != null) {
      data['growth_rate'] = this.growthRate!.toJson();
    }
    if (this.pokedexNumbers != null) {
      data['pokedex_numbers'] =
          this.pokedexNumbers!.map((v) => v.toJson()).toList();
    }
    if (this.eggGroups != null) {
      data['egg_groups'] = this.eggGroups!.map((v) => v.toJson()).toList();
    }
    if (this.color != null) {
      data['color'] = this.color!.toJson();
    }
    if (this.shape != null) {
      data['shape'] = this.shape!.toJson();
    }
    if (this.evolvesFromSpecies != null) {
      data['evolves_from_species'] = this.evolvesFromSpecies!.toJson();
    }
    if (this.evolutionChain != null) {
      data['evolution_chain'] = this.evolutionChain!.toJson();
    }
    data['habitat'] = this.habitat;
    if (this.generation != null) {
      data['generation'] = this.generation!.toJson();
    }
    if (this.names != null) {
      data['names'] = this.names!.map((v) => v.toJson()).toList();
    }
    if (this.flavorTextEntries != null) {
      data['flavor_text_entries'] =
          this.flavorTextEntries!.map((v) => v.toJson()).toList();
    }
    if (this.formDescriptions != null) {
      data['form_descriptions'] =
          this.formDescriptions!.map((v) => v.toJson()).toList();
    }
    if (this.genera != null) {
      data['genera'] = this.genera!.map((v) => v.toJson()).toList();
    }
    if (this.varieties != null) {
      data['varieties'] = this.varieties!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'PokemonSpecie{id: $id, name: $name, order: $order, genderRate: $genderRate, captureRate: $captureRate, baseHappiness: $baseHappiness, isBaby: $isBaby, hatchCounter: $hatchCounter, hasGenderDifferences: $hasGenderDifferences, formsSwitchable: $formsSwitchable, growthRate: $growthRate, pokedexNumbers: $pokedexNumbers, eggGroups: $eggGroups, color: $color, shape: $shape, evolvesFromSpecies: $evolvesFromSpecies, evolutionChain: $evolutionChain, habitat: $habitat, generation: $generation, names: $names, flavorTextEntries: $flavorTextEntries, formDescriptions: $formDescriptions, genera: $genera, varieties: $varieties}';
  }
}

class PokedexNumbers {
  int? entryNumber;
  NamedAPIResource? pokedex;

  PokedexNumbers({this.entryNumber, this.pokedex});

  PokedexNumbers.fromJson(Map<String, dynamic> json) {
    entryNumber = json['entry_number'];
    pokedex = json['pokedex'] != null
        ?  NamedAPIResource.fromJson(json['pokedex'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['entry_number'] = this.entryNumber;
    if (this.pokedex != null) {
      data['pokedex'] = this.pokedex!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'PokedexNumbers{entryNumber: $entryNumber, pokedex: $pokedex}';
  }
}

class Names {
  String? name;
  NamedAPIResource? language;

  Names({this.name, this.language});

  Names.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    language = json['language'] != null
        ?  NamedAPIResource.fromJson(json['language'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['name'] = this.name;
    if (this.language != null) {
      data['language'] = this.language!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'Names{name: $name, language: $language}';
  }
}

class FlavorTextEntries {
  String? flavorText;
  NamedAPIResource? language;
  NamedAPIResource? version;

  FlavorTextEntries({this.flavorText, this.language, this.version});

  FlavorTextEntries.fromJson(Map<String, dynamic> json) {
    flavorText = json['flavor_text'];
    language = json['language'] != null
        ?  NamedAPIResource.fromJson(json['language'])
        : null;
    version = json['version'] != null
        ?  NamedAPIResource.fromJson(json['version'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['flavor_text'] = this.flavorText;
    if (this.language != null) {
      data['language'] = this.language!.toJson();
    }
    if (this.version != null) {
      data['version'] = this.version!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'FlavorTextEntries{flavorText: $flavorText, language: $language, version: $version}';
  }
}

class FormDescriptions {
  String? description;
  NamedAPIResource? language;

  FormDescriptions({this.description, this.language});

  FormDescriptions.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    language = json['language'] != null
        ?  NamedAPIResource.fromJson(json['language'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['description'] = this.description;
    if (this.language != null) {
      data['language'] = this.language!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'FormDescriptions{description: $description, language: $language}';
  }
}

class Genera {
  String? genus;
  NamedAPIResource? language;

  Genera({this.genus, this.language});

  Genera.fromJson(Map<String, dynamic> json) {
    genus = json['genus'];
    language = json['language'] != null
        ?  NamedAPIResource.fromJson(json['language'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['genus'] = this.genus;
    if (this.language != null) {
      data['language'] = this.language!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'Genera{genus: $genus, language: $language}';
  }
}

class Varieties {
  bool? isDefault;
  NamedAPIResource? pokemon;

  Varieties({this.isDefault, this.pokemon});

  Varieties.fromJson(Map<String, dynamic> json) {
    isDefault = json['is_default'];
    pokemon = json['pokemon'] != null
        ?  NamedAPIResource.fromJson(json['pokemon'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['is_default'] = this.isDefault;
    if (this.pokemon != null) {
      data['pokemon'] = this.pokemon!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'Varieties{isDefault: $isDefault, pokemon: $pokemon}';
  }
}
