import 'package:pokeapi/model/utils/common.dart';

class EncounterConditionEntity {
  List<EncounterConditionName> names;
  List<NamedAPIResource> values;
  String name;
  int id;

  EncounterConditionEntity({this.names, this.values, this.name, this.id});

  EncounterConditionEntity.fromJson(Map<String, dynamic> json) {
    if (json['names'] != null) {
      names = new List<EncounterConditionName>();
      (json['names'] as List).forEach((v) {
        names.add(new EncounterConditionName.fromJson(v));
      });
    }
    if (json['values'] != null) {
      values = new List<NamedAPIResource>();
      (json['values'] as List).forEach((v) {
        values.add(new NamedAPIResource.fromJson(v));
      });
    }
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.names != null) {
      data['names'] = this.names.map((v) => v.toJson()).toList();
    }
    if (this.values != null) {
      data['values'] = this.values.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }

  @override
  String toString() {
    return 'EncounterConditionEntity{names: $names, values: $values, name: $name, id: $id}';
  }
}

class EncounterConditionName {
  String name;
  NamedAPIResource language;

  EncounterConditionName({this.name, this.language});

  EncounterConditionName.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    language = json['language'] != null
        ? new NamedAPIResource.fromJson(json['language'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.language != null) {
      data['language'] = this.language.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'EncounterConditionName{name: $name, language: $language}';
  }
}
