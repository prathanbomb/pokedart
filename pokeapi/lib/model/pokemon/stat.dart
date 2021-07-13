import 'package:pokeapi/model/utils/common.dart';

class Stat {
  int? id;
  String? name;
  int? gameIndex;
  bool? isBattleOnly;
  AffectingMoves? affectingMoves;
  AffectingNatures? affectingNatures;
  List<Characteristics>? characteristics;
  NamedAPIResource? moveDamageClass;
  List<Names>? names;

  Stat(
      {this.id,
      this.name,
      this.gameIndex,
      this.isBattleOnly,
      this.affectingMoves,
      this.affectingNatures,
      this.characteristics,
      this.moveDamageClass,
      this.names});

  Stat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    gameIndex = json['game_index'];
    isBattleOnly = json['is_battle_only'];
    affectingMoves = json['affecting_moves'] != null
        ? new AffectingMoves.fromJson(json['affecting_moves'])
        : null;
    affectingNatures = json['affecting_natures'] != null
        ? new AffectingNatures.fromJson(json['affecting_natures'])
        : null;
    if (json['characteristics'] != null) {
      characteristics = <Characteristics>[];
      json['characteristics'].forEach((v) {
        characteristics!.add(new Characteristics.fromJson(v));
      });
    }
    moveDamageClass = json['move_damage_class'] != null
        ? new NamedAPIResource.fromJson(json['move_damage_class'])
        : null;
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
    data['game_index'] = this.gameIndex;
    data['is_battle_only'] = this.isBattleOnly;
    if (this.affectingMoves != null) {
      data['affecting_moves'] = this.affectingMoves!.toJson();
    }
    if (this.affectingNatures != null) {
      data['affecting_natures'] = this.affectingNatures!.toJson();
    }
    if (this.characteristics != null) {
      data['characteristics'] =
          this.characteristics!.map((v) => v.toJson()).toList();
    }
    if (this.moveDamageClass != null) {
      data['move_damage_class'] = this.moveDamageClass!.toJson();
    }
    if (this.names != null) {
      data['names'] = this.names!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'Stat{id: $id, name: $name, gameIndex: $gameIndex, isBattleOnly: $isBattleOnly, affectingMoves: $affectingMoves, affectingNatures: $affectingNatures, characteristics: $characteristics, moveDamageClass: $moveDamageClass, names: $names}';
  }
}

class AffectingMoves {
  List<NamedAPIResource>? increase;
  List<NamedAPIResource>? decrease;

  AffectingMoves({this.increase, this.decrease});

  AffectingMoves.fromJson(Map<String, dynamic> json) {
    if (json['increase'] != null) {
      increase = <NamedAPIResource>[];
      json['increase'].forEach((v) {
        v = v['move'];
        increase!.add(new NamedAPIResource.fromJson(v));
      });
    }
    if (json['decrease'] != null) {
      decrease = <NamedAPIResource>[];
      json['decrease'].forEach((v) {
        v = v['move'];
        decrease!.add(new NamedAPIResource.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.increase != null) {
      data['increase'] = this.increase!.map((v) => v.toJson()).toList();
    }
    if (this.decrease != null) {
      data['decrease'] = this.decrease!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'AffectingMoves{increase: $increase, decrease: $decrease}';
  }
}

class Increase {
  int? change;
  NamedAPIResource? move;

  Increase({this.change, this.move});

  Increase.fromJson(Map<String, dynamic> json) {
    change = json['change'];
    move = json['move'] != null
        ? new NamedAPIResource.fromJson(json['move'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['change'] = this.change;
    if (this.move != null) {
      data['move'] = this.move!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'Increase{change: $change, move: $move}';
  }
}

class Decrease {
  int? change;
  NamedAPIResource? move;

  Decrease({this.change, this.move});

  Decrease.fromJson(Map<String, dynamic> json) {
    change = json['change'];
    move = json['move'] != null
        ? new NamedAPIResource.fromJson(json['move'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['change'] = this.change;
    if (this.move != null) {
      data['move'] = this.move!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'Decrease{change: $change, move: $move}';
  }
}

class AffectingNatures {
  List<Increase>? increase;
  List<Decrease>? decrease;

  AffectingNatures({this.increase, this.decrease});

  AffectingNatures.fromJson(Map<String, dynamic> json) {
    if (json['increase'] != null) {
      increase = <Increase>[];
      json['increase'].forEach((v) {
        increase!.add(new Increase.fromJson(v));
      });
    }
    if (json['decrease'] != null) {
      decrease = <Decrease>[];
      json['decrease'].forEach((v) {
        decrease!.add(new Decrease.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.increase != null) {
      data['increase'] = this.increase!.map((v) => v.toJson()).toList();
    }
    if (this.decrease != null) {
      data['decrease'] = this.decrease!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'AffectingNatures{increase: $increase, decrease: $decrease}';
  }
}

class Characteristics {
  String? url;

  Characteristics({this.url});

  Characteristics.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    return data;
  }

  @override
  String toString() {
    return 'Characteristics{url: $url}';
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
