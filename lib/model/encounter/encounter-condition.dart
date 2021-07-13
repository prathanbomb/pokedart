import 'package:pokeapi/model/utils/common.dart';

class EncounterCondition {
  List<EncounterConditionName>? names;
  List<NamedAPIResource>? values;
  String? name;
  int? id;

  EncounterCondition({this.names, this.values, this.name, this.id});

  EncounterCondition.fromJson(Map<String, dynamic> json) {
    if (json['names'] != null) {
      names =  <EncounterConditionName>[];
      (json['names'] as List).forEach((v) {
        names!.add( EncounterConditionName.fromJson(v));
      });
    }
    if (json['values'] != null) {
      values =  <NamedAPIResource>[];
      (json['values'] as List).forEach((v) {
        values!.add( NamedAPIResource.fromJson(v));
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
    if (this.values != null) {
      data['values'] = this.values!.map((v) => v.toJson()).toList();
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
  String? name;
  NamedAPIResource? language;

  EncounterConditionName({this.name, this.language});

  EncounterConditionName.fromJson(Map<String, dynamic> json) {
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
    return 'EncounterConditionName{name: $name, language: $language}';
  }
}
