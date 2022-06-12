import 'package:pokeapi/model/utils/common.dart';

class MoveDamageClass {
  List<MoveDamageClassName>? names;
  List<NamedAPIResource>? moves;
  String? name;
  int? id;
  List<MoveDamageClassDescription>? descriptions;

  MoveDamageClass(
      {this.names, this.moves, this.name, this.id, this.descriptions});

  MoveDamageClass.fromJson(Map<String, dynamic> json) {
    if (json['names'] != null) {
      names =  <MoveDamageClassName>[];
      (json['names'] as List).forEach((v) {
        names!.add( MoveDamageClassName.fromJson(v));
      });
    }
    if (json['moves'] != null) {
      moves =  <NamedAPIResource>[];
      (json['moves'] as List).forEach((v) {
        moves!.add( NamedAPIResource.fromJson(v));
      });
    }
    name = json['name'];
    id = json['id'];
    if (json['descriptions'] != null) {
      descriptions =  <MoveDamageClassDescription>[];
      (json['descriptions'] as List).forEach((v) {
        descriptions!.add( MoveDamageClassDescription.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (this.names != null) {
      data['names'] = this.names!.map((v) => v.toJson()).toList();
    }
    if (this.moves != null) {
      data['moves'] = this.moves!.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    data['id'] = this.id;
    if (this.descriptions != null) {
      data['descriptions'] = this.descriptions!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'MoveDamageClass{names: $names, moves: $moves, name: $name, id: $id, descriptions: $descriptions}';
  }
}

class MoveDamageClassName {
  String? name;
  NamedAPIResource? language;

  MoveDamageClassName({this.name, this.language});

  MoveDamageClassName.fromJson(Map<String, dynamic> json) {
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

class MoveDamageClassDescription {
  String? description;
  NamedAPIResource? language;

  MoveDamageClassDescription({this.description, this.language});

  MoveDamageClassDescription.fromJson(Map<String, dynamic> json) {
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
    return 'MoveDamageClassDescription{description: $description, language: $language}';
  }
}
