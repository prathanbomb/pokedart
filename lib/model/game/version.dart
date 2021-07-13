import 'package:pokeapi/model/utils/common.dart';

class Version {
  List<VersionName>? names;
  NamedAPIResource? versionGroup;
  String? name;
  int? id;

  Version({this.names, this.versionGroup, this.name, this.id});

  Version.fromJson(Map<String, dynamic> json) {
    if (json['names'] != null) {
      names =  <VersionName>[];
      (json['names'] as List).forEach((v) {
        names!.add( VersionName.fromJson(v));
      });
    }
    versionGroup = json['version_group'] != null
        ?  NamedAPIResource.fromJson(json['version_group'])
        : null;
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (this.names != null) {
      data['names'] = this.names!.map((v) => v.toJson()).toList();
    }
    if (this.versionGroup != null) {
      data['version_group'] = this.versionGroup!.toJson();
    }
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }

  @override
  String toString() {
    return 'Version{names: $names, versionGroup: $versionGroup, name: $name, id: $id}';
  }
}

class VersionName {
  String? name;
  NamedAPIResource? language;

  VersionName({this.name, this.language});

  VersionName.fromJson(Map<String, dynamic> json) {
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
    return 'VersionName{name: $name, language: $language}';
  }
}
