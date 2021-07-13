import 'package:pokeapi/model/utils/common.dart';

class MoveBattleStyle {
  List<MoveBattleStyleName>? names;
  String? name;
  int? id;

  MoveBattleStyle({this.names, this.name, this.id});

  MoveBattleStyle.fromJson(Map<String, dynamic> json) {
    if (json['names'] != null) {
      names =  <MoveBattleStyleName>[];
      (json['names'] as List).forEach((v) {
        names!.add( MoveBattleStyleName.fromJson(v));
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
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }

  @override
  String toString() {
    return 'MoveBattleStyle{names: $names, name: $name, id: $id}';
  }
}

class MoveBattleStyleName {
  String? name;
  NamedAPIResource? language;

  MoveBattleStyleName({this.name, this.language});

  MoveBattleStyleName.fromJson(Map<String, dynamic> json) {
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
    return 'MoveBattleStyleName{name: $name, language: $language}';
  }
}
