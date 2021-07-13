import 'package:pokeapi/model/utils/common.dart';

class BerryFirmness {
  int? id;
  String? name;
  List<NamedAPIResource>? berries;
  List<Names>? names;

  BerryFirmness({this.id, this.name, this.berries, this.names});

  BerryFirmness.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['berries'] != null) {
      berries = <NamedAPIResource>[];
      json['berries'].forEach((v) {
        berries!.add( NamedAPIResource.fromJson(v));
      });
    }
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
    if (this.berries != null) {
      data['berries'] = this.berries!.map((v) => v.toJson()).toList();
    }
    if (this.names != null) {
      data['names'] = this.names!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'BerryFirmness{id: $id, name: $name, berries: $berries, names: $names}';
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
