import 'package:pokeapi/model/utils/common.dart';

class ItemPocket {
  int? id;
  String? name;
  List<NamedAPIResource>? categories;
  List<Names>? names;

  ItemPocket({this.id, this.name, this.categories, this.names});

  ItemPocket.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['categories'] != null) {
      categories = <NamedAPIResource>[];
      json['categories'].forEach((v) {
        categories!.add(new NamedAPIResource.fromJson(v));
      });
    }
    if (json['names'] != null) {
      names = <Names>[];
      json['names'].forEach((v) {
        names!.add(new Names.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.names != null) {
      data['names'] = this.names!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'ItemPocket{id: $id, name: $name, categories: $categories, names: $names}';
  }
}

class Names {
  String? name;
  NamedAPIResource? language;

  Names({this.name, this.language});

  Names.fromJson(Map<String, dynamic> json) {
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
    return 'Names{name: $name, language: $language}';
  }
}
