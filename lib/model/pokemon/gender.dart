import 'package:pokeapi/model/utils/common.dart';

class Gender {
  int? id;
  String? name;
  List<PokemonSpeciesDetails>? pokemonSpeciesDetails;
  List<NamedAPIResource>? requiredForEvolution;

  Gender(
      {this.id,
      this.name,
      this.pokemonSpeciesDetails,
      this.requiredForEvolution});

  Gender.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['pokemon_species_details'] != null) {
      pokemonSpeciesDetails =  <PokemonSpeciesDetails>[];
      json['pokemon_species_details'].forEach((v) {
        pokemonSpeciesDetails!.add( PokemonSpeciesDetails.fromJson(v));
      });
    }
    if (json['required_for_evolution'] != null) {
      requiredForEvolution =  <NamedAPIResource>[];
      json['required_for_evolution'].forEach((v) {
        requiredForEvolution!.add( NamedAPIResource.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.pokemonSpeciesDetails != null) {
      data['pokemon_species_details'] =
          this.pokemonSpeciesDetails!.map((v) => v.toJson()).toList();
    }
    if (this.requiredForEvolution != null) {
      data['required_for_evolution'] =
          this.requiredForEvolution!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'Gender{id: $id, name: $name, pokemonSpeciesDetails: $pokemonSpeciesDetails, requiredForEvolution: $requiredForEvolution}';
  }
}

class PokemonSpeciesDetails {
  int? rate;
  NamedAPIResource? pokemonSpecies;

  PokemonSpeciesDetails({this.rate, this.pokemonSpecies});

  PokemonSpeciesDetails.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    pokemonSpecies = json['pokemon_species'] != null
        ?  NamedAPIResource.fromJson(json['pokemon_species'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['rate'] = this.rate;
    if (this.pokemonSpecies != null) {
      data['pokemon_species'] = this.pokemonSpecies!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'PokemonSpeciesDetails{rate: $rate, pokemonSpecies: $pokemonSpecies}';
  }
}
