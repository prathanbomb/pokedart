import 'package:pokeapi/model/utils/common.dart';

class MoveAilment {
  List<MoveAilmantNames>? names;
  List<NamedAPIResource>? moves;
  String? name;
  int? id;

  MoveAilment({this.names, this.moves, this.name, this.id});

  MoveAilment.fromJson(Map<String, dynamic> json) {
    if (json['names'] != null) {
      names =  <MoveAilmantNames>[];
      (json['names'] as List).forEach((v) {
        names!.add( MoveAilmantNames.fromJson(v));
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
    return data;
  }

  @override
  String toString() {
    return 'MoveAilment{names: $names, moves: $moves, name: $name, id: $id}';
  }
}

class MoveAilmantNames {
  String? name;
  NamedAPIResource? language;

  MoveAilmantNames({this.name, this.language});

  MoveAilmantNames.fromJson(Map<String, dynamic> json) {
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
    return 'MoveAilmantNames{name: $name, language: $language}';
  }
}
