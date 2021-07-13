import 'package:pokeapi/model/utils/common.dart';

class MoveLearnMethod {
  List<MoveLearnMethodName>? names;
  List<NamedAPIResource>? versionGroups;
  String? name;
  int? id;
  List<MoveLearnMethodDescription>? descriptions;

  MoveLearnMethod(
      {this.names, this.versionGroups, this.name, this.id, this.descriptions});

  MoveLearnMethod.fromJson(Map<String, dynamic> json) {
    if (json['names'] != null) {
      names =  <MoveLearnMethodName>[];
      (json['names'] as List).forEach((v) {
        names!.add( MoveLearnMethodName.fromJson(v));
      });
    }
    if (json['version_groups'] != null) {
      versionGroups =  <NamedAPIResource>[];
      (json['version_groups'] as List).forEach((v) {
        versionGroups!.add( NamedAPIResource.fromJson(v));
      });
    }
    name = json['name'];
    id = json['id'];
    if (json['descriptions'] != null) {
      descriptions =  <MoveLearnMethodDescription>[];
      (json['descriptions'] as List).forEach((v) {
        descriptions!.add( MoveLearnMethodDescription.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (this.names != null) {
      data['names'] = this.names!.map((v) => v.toJson()).toList();
    }
    if (this.versionGroups != null) {
      data['version_groups'] =
          this.versionGroups!.map((v) => v.toJson()).toList();
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
    return 'MoveLearnMethod{names: $names, versionGroups: $versionGroups, name: $name, id: $id, descriptions: $descriptions}';
  }
}

class MoveLearnMethodName {
  String? name;
  NamedAPIResource? language;

  MoveLearnMethodName({this.name, this.language});

  MoveLearnMethodName.fromJson(Map<String, dynamic> json) {
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
    return 'MoveLearnMethodName{name: $name, language: $language}';
  }
}

class MoveLearnMethodDescription {
  String? description;
  NamedAPIResource? language;

  MoveLearnMethodDescription({this.description, this.language});

  MoveLearnMethodDescription.fromJson(Map<String, dynamic> json) {
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
    return 'MoveLearnMethodDescription{description: $description, language: $language}';
  }
}
