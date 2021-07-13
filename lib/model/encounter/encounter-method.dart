import 'package:pokeapi/model/utils/common.dart';

class EncounterMethod {
  List<EncounterMethodName>? names;
  String? name;
  int? id;
  int? order;

  EncounterMethod({this.names, this.name, this.id, this.order});

  EncounterMethod.fromJson(Map<String, dynamic> json) {
    if (json['names'] != null) {
      names =  <EncounterMethodName>[];
      (json['names'] as List).forEach((v) {
        names!.add( EncounterMethodName.fromJson(v));
      });
    }
    name = json['name'];
    id = json['id'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (this.names != null) {
      data['names'] = this.names!.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    data['id'] = this.id;
    data['order'] = this.order;
    return data;
  }

  @override
  String toString() {
    return 'EncounterMethod{names: $names, name: $name, id: $id, order: $order}';
  }
}

class EncounterMethodName {
  String? name;
  NamedAPIResource? language;

  EncounterMethodName({this.name, this.language});

  EncounterMethodName.fromJson(Map<String, dynamic> json) {
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
    return 'EncounterMethodName{name: $name, language: $language}';
  }
}
