import 'package:pokeapi/model/utils/common.dart';

class PokemonForm {
  int? id;
  String? name;
  int? order;
  int? formOrder;
  bool? isDefault;
  bool? isBattleOnly;
  bool? isMega;
  String? formName;
  NamedAPIResource? pokemon;
  Sprites? sprites;
  NamedAPIResource? versionGroup;

  PokemonForm(
      {this.id,
      this.name,
      this.order,
      this.formOrder,
      this.isDefault,
      this.isBattleOnly,
      this.isMega,
      this.formName,
      this.pokemon,
      this.sprites,
      this.versionGroup});

  PokemonForm.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    order = json['order'];
    formOrder = json['form_order'];
    isDefault = json['is_default'];
    isBattleOnly = json['is_battle_only'];
    isMega = json['is_mega'];
    formName = json['form_name'];
    pokemon = json['pokemon'] != null
        ? new NamedAPIResource.fromJson(json['pokemon'])
        : null;
    sprites =
        json['sprites'] != null ? new Sprites.fromJson(json['sprites']) : null;
    versionGroup = json['version_group'] != null
        ? new NamedAPIResource.fromJson(json['version_group'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['order'] = this.order;
    data['form_order'] = this.formOrder;
    data['is_default'] = this.isDefault;
    data['is_battle_only'] = this.isBattleOnly;
    data['is_mega'] = this.isMega;
    data['form_name'] = this.formName;
    if (this.pokemon != null) {
      data['pokemon'] = this.pokemon!.toJson();
    }
    if (this.sprites != null) {
      data['sprites'] = this.sprites!.toJson();
    }
    if (this.versionGroup != null) {
      data['version_group'] = this.versionGroup!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'PokemonForm{id: $id, name: $name, order: $order, formOrder: $formOrder, isDefault: $isDefault, isBattleOnly: $isBattleOnly, isMega: $isMega, formName: $formName, pokemon: $pokemon, sprites: $sprites, versionGroup: $versionGroup}';
  }
}

class Sprites {
  String? backDefault;
  String? backShiny;
  String? frontDefault;
  String? frontShiny;

  Sprites(
      {this.backDefault, this.backShiny, this.frontDefault, this.frontShiny});

  Sprites.fromJson(Map<String, dynamic> json) {
    backDefault = json['back_default'];
    backShiny = json['back_shiny'];
    frontDefault = json['front_default'];
    frontShiny = json['front_shiny'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['back_default'] = this.backDefault;
    data['back_shiny'] = this.backShiny;
    data['front_default'] = this.frontDefault;
    data['front_shiny'] = this.frontShiny;
    return data;
  }

  @override
  String toString() {
    return 'Sprites{backDefault: $backDefault, backShiny: $backShiny, frontDefault: $frontDefault, frontShiny: $frontShiny}';
  }
}
