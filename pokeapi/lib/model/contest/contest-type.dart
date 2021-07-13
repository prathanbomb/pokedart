import 'package:pokeapi/model/utils/common.dart';

class ContestType {
  NamedAPIResource? berryFlavor;
  List<ContestTypeName>? names;
  String? name;
  int? id;

  ContestType({this.berryFlavor, this.names, this.name, this.id});

  ContestType.fromJson(Map<String, dynamic> json) {
    berryFlavor = json['berry_flavor'] != null
        ?  NamedAPIResource.fromJson(json['berry_flavor'])
        : null;
    if (json['names'] != null) {
      names =  <ContestTypeName>[];
      (json['names'] as List).forEach((v) {
        names!.add( ContestTypeName.fromJson(v));
      });
    }
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (this.berryFlavor != null) {
      data['berry_flavor'] = this.berryFlavor!.toJson();
    }
    if (this.names != null) {
      data['names'] = this.names!.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }

  @override
  String toString() {
    return 'ContestType{berryFlavor: $berryFlavor, names: $names, name: $name, id: $id}';
  }
}

class ContestTypeName {
  String? color;
  String? name;
  NamedAPIResource? language;

  ContestTypeName({this.color, this.name, this.language});

  ContestTypeName.fromJson(Map<String, dynamic> json) {
    color = json['color'];
    name = json['name'];
    language = json['language'] != null
        ?  NamedAPIResource.fromJson(json['language'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['color'] = this.color;
    data['name'] = this.name;
    if (this.language != null) {
      data['language'] = this.language!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'ContestTypeName{color: $color, name: $name, language: $language}';
  }
}
