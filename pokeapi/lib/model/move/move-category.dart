import 'package:pokeapi/model/utils/common.dart';

class MoveCategory {
  List<NamedAPIResource>? moves;
  String? name;
  int? id;
  List<MoveCategoryDescription>? descriptions;

  MoveCategory({this.moves, this.name, this.id, this.descriptions});

  MoveCategory.fromJson(Map<String, dynamic> json) {
    if (json['moves'] != null) {
      moves =  <NamedAPIResource>[];
      (json['moves'] as List).forEach((v) {
        moves!.add( NamedAPIResource.fromJson(v));
      });
    }
    name = json['name'];
    id = json['id'];
    if (json['descriptions'] != null) {
      descriptions =  <MoveCategoryDescription>[];
      (json['descriptions'] as List).forEach((v) {
        descriptions!.add( MoveCategoryDescription.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
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
    return 'MoveCategory{moves: $moves, name: $name, id: $id, descriptions: $descriptions}';
  }
}

class MoveCategoryDescription {
  String? description;
  NamedAPIResource? language;

  MoveCategoryDescription({this.description, this.language});

  MoveCategoryDescription.fromJson(Map<String, dynamic> json) {
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
    return 'MoveCategoryDescription{description: $description, language: $language}';
  }
}
