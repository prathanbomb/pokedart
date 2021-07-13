import 'package:pokeapi/model/utils/common.dart';

class Language {
  int? id;
  String? name;
  bool? official;
  String? iso639;
  String? iso3166;
  List<Names>? names;

  Language(
      {this.id,
      this.name,
      this.official,
      this.iso639,
      this.iso3166,
      this.names});

  Language.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    official = json['official'];
    iso639 = json['iso639'];
    iso3166 = json['iso3166'];
    if (json['names'] != null) {
      names =  <Names>[];
      json['names'].forEach((v) {
        names!.add( Names.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['official'] = this.official;
    data['iso639'] = this.iso639;
    data['iso3166'] = this.iso3166;
    if (this.names != null) {
      data['names'] = this.names!.map((v) => v.toJson()).toList();
    }
    return data;
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
}
