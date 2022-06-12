import 'package:pokeapi/model/utils/common.dart';

class ItemCategory {
  int? id;
  String? name;
  List<NamedAPIResource>? items;
  List<NamedAPIResource>? names;
  NamedAPIResource? pocket;

  ItemCategory({this.id, this.name, this.items, this.names, this.pocket});

  ItemCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['items'] != null) {
      items =<NamedAPIResource>[];
      json['items'].forEach((v) {
        items!.add(new NamedAPIResource.fromJson(v));
      });
    }
    if (json['names'] != null) {
      names =<NamedAPIResource>[];
      json['names'].forEach((v) {
        v = v['language'];
        names!.add(new NamedAPIResource.fromJson(v));
      });
    }
    pocket = json['pocket'] != null
        ? new NamedAPIResource.fromJson(json['pocket'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    if (this.names != null) {
      data['names'] = this.names!.map((v) => v.toJson()).toList();
    }
    if (this.pocket != null) {
      data['pocket'] = this.pocket!.toJson();
    }
    return data;
  }
}

class Language {
  String? name;
  String? url;

  Language({this.name, this.url});

  Language.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}
