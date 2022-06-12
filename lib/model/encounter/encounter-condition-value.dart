import 'package:pokeapi/model/utils/common.dart';

class EncounterConditionValue {
  NamedAPIResource? condition;
  List<EncounterConditionValueName>? names;
  String? name;
  int? id;

  EncounterConditionValue({this.condition, this.names, this.name, this.id});

  EncounterConditionValue.fromJson(Map<String, dynamic> json) {
    condition = json['condition'] != null
        ?  NamedAPIResource.fromJson(json['condition'])
        : null;
    if (json['names'] != null) {
      names =  <EncounterConditionValueName>[];
      (json['names'] as List).forEach((v) {
        names!.add( EncounterConditionValueName.fromJson(v));
      });
    }
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (this.condition != null) {
      data['condition'] = this.condition!.toJson();
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
    return 'EncounterConditionValue{condition: $condition, names: $names, name: $name, id: $id}';
  }
}

class EncounterConditionValueName {
  String? name;
  NamedAPIResource? language;

  EncounterConditionValueName({this.name, this.language});

  EncounterConditionValueName.fromJson(Map<String, dynamic> json) {
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
    return 'EncounterConditionValueName{name: $name, language: $language}';
  }
}
