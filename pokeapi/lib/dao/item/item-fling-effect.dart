import 'package:pokeapi/dao/common.dart';

class ItemFlingEffect {
  int id;
  String name;
  List<EffectEntries> effectEntries;
  List<CommonResult> items;

  ItemFlingEffect({this.id, this.name, this.effectEntries, this.items});

  ItemFlingEffect.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['effect_entries'] != null) {
      effectEntries = new List<EffectEntries>();
      json['effect_entries'].forEach((v) {
        effectEntries.add(new EffectEntries.fromJson(v));
      });
    }
    if (json['items'] != null) {
      items = new List<CommonResult>();
      json['items'].forEach((v) {
        items.add(new CommonResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.effectEntries != null) {
      data['effect_entries'] =
          this.effectEntries.map((v) => v.toJson()).toList();
    }
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EffectEntries {
  String effect;
  CommonResult language;

  EffectEntries({this.effect, this.language});

  EffectEntries.fromJson(Map<String, dynamic> json) {
    effect = json['effect'];
    language = json['language'] != null
        ? new CommonResult.fromJson(json['language'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['effect'] = this.effect;
    if (this.language != null) {
      data['language'] = this.language.toJson();
    }
    return data;
  }
}
