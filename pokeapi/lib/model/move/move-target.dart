import 'package:pokeapi/model/utils/common.dart';

class MoveTarget {
  List<MoveTargetName>? names;
  List<NamedAPIResource>? moves;
  String? name;
  int? id;
  List<MoveTargetDescription>? descriptions;

  MoveTarget({this.names, this.moves, this.name, this.id, this.descriptions});

  MoveTarget.fromJson(Map<String, dynamic> json) {
    if (json['names'] != null) {
      names = <MoveTargetName>[];
      (json['names'] as List).forEach((v) {
        names!.add(new MoveTargetName.fromJson(v));
      });
    }
    if (json['moves'] != null) {
      moves = <NamedAPIResource>[];
      (json['moves'] as List).forEach((v) {
        moves!.add(new NamedAPIResource.fromJson(v));
      });
    }
    name = json['name'];
    id = json['id'];
    if (json['descriptions'] != null) {
      descriptions = <MoveTargetDescription>[];
      (json['descriptions'] as List).forEach((v) {
        descriptions!.add(new MoveTargetDescription.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    return 'MoveTarget{names: $names, moves: $moves, name: $name, id: $id, descriptions: $descriptions}';
  }
}

class MoveTargetName {
  String? name;
  NamedAPIResource? language;

  MoveTargetName({this.name, this.language});

  MoveTargetName.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    language = json['language'] != null
        ? new NamedAPIResource.fromJson(json['language'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.language != null) {
      data['language'] = this.language!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'MoveTargetName{name: $name, language: $language}';
  }
}

class MoveTargetDescription {
  String? description;
  NamedAPIResource? language;

  MoveTargetDescription({this.description, this.language});

  MoveTargetDescription.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    language = json['language'] != null
        ? new NamedAPIResource.fromJson(json['language'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    if (this.language != null) {
      data['language'] = this.language!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'MoveTargetDescription{description: $description, language: $language}';
  }
}
