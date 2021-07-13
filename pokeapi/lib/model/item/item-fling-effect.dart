import 'package:pokeapi/model/utils/common.dart';

class ItemFlingEffect {
  int? id;
  String? name;
  List<EffectEntries>? effectEntries;
  List<NamedAPIResource>? items;

  ItemFlingEffect({this.id, this.name, this.effectEntries, this.items});

  ItemFlingEffect.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['effect_entries'] != null) {
      effectEntries = <EffectEntries>[];
      json['effect_entries'].forEach((v) {
        effectEntries!.add(new EffectEntries.fromJson(v));
      });
    }
    if (json['items'] != null) {
      items = <NamedAPIResource>[];
      json['items'].forEach((v) {
        items!.add(new NamedAPIResource.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.effectEntries != null) {
      data['effect_entries'] =
          this.effectEntries!.map((v) => v.toJson()).toList();
    }
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'ItemFlingEffect{id: $id, name: $name, effectEntries: $effectEntries, items: $items}';
  }
}

class EffectEntries {
  String? effect;
  NamedAPIResource? language;

  EffectEntries({this.effect, this.language});

  EffectEntries.fromJson(Map<String, dynamic> json) {
    effect = json['effect'];
    language = json['language'] != null
        ? new NamedAPIResource.fromJson(json['language'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['effect'] = this.effect;
    if (this.language != null) {
      data['language'] = this.language!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'EffectEntries{effect: $effect, language: $language}';
  }
}
