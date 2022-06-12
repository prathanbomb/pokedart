import 'package:pokeapi/model/utils/common.dart';

class BerryFlavor {
  int? id;
  String? name;
  List<Berries>? berries;
  NamedAPIResource? contestType;
  List<Names>? names;

  BerryFlavor({this.id, this.name, this.berries, this.contestType, this.names});

  BerryFlavor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['berries'] != null) {
      berries =  <Berries>[];
      json['berries'].forEach((v) {
        berries!.add( Berries.fromJson(v));
      });
    }
    contestType = json['contest_type'] != null
        ?  NamedAPIResource.fromJson(json['contest_type'])
        : null;
    if (json['names'] != null) {
      names =  <Names>[];
      json['names'].forEach((v) {
        names!.add( Names.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.berries != null) {
      data['berries'] = this.berries!.map((v) => v.toJson()).toList();
    }
    if (this.contestType != null) {
      data['contest_type'] = this.contestType!.toJson();
    }
    if (this.names != null) {
      data['names'] = this.names!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'BerryFlavor{id: $id, name: $name, berries: $berries, contestType: $contestType, names: $names}';
  }
}

class Berries {
  int? potency;
  NamedAPIResource? berry;

  Berries({this.potency, this.berry});

  Berries.fromJson(Map<String, dynamic> json) {
    potency = json['potency'];
    berry = json['berry'] != null
        ?  NamedAPIResource.fromJson(json['berry'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['potency'] = this.potency;
    if (this.berry != null) {
      data['berry'] = this.berry!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'Berries{potency: $potency, berry: $berry}';
  }
}

class Names {
  String? name;
  NamedAPIResource? language;

  Names({this.name, this.language});

  Names.fromJson(Map<String, dynamic> json) {
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
    return 'Names{name: $name, language: $language}';
  }
}
