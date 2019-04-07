import 'package:pokeapi/model/utils/common.dart';

class Characteristic {
  int id;
  int geneModulo;
  List<int> possibleValues;
  NamedAPIResource highestStat;
  List<Descriptions> descriptions;

  Characteristic(
      {this.id,
      this.geneModulo,
      this.possibleValues,
      this.highestStat,
      this.descriptions});

  Characteristic.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    geneModulo = json['gene_modulo'];
    possibleValues = json['possible_values'].cast<int>();
    highestStat = json['highest_stat'] != null
        ? new NamedAPIResource.fromJson(json['highest_stat'])
        : null;
    if (json['descriptions'] != null) {
      descriptions = new List<Descriptions>();
      json['descriptions'].forEach((v) {
        descriptions.add(new Descriptions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['gene_modulo'] = this.geneModulo;
    data['possible_values'] = this.possibleValues;
    if (this.highestStat != null) {
      data['highest_stat'] = this.highestStat.toJson();
    }
    if (this.descriptions != null) {
      data['descriptions'] = this.descriptions.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Descriptions {
  String description;
  NamedAPIResource language;

  Descriptions({this.description, this.language});

  Descriptions.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    language = json['language'] != null
        ? new NamedAPIResource.fromJson(json['language'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    if (this.language != null) {
      data['language'] = this.language.toJson();
    }
    return data;
  }
}
