import 'package:pokeapi/dao/common.dart';

class PokeAthlonStat {
  int id;
  String name;
  AffectingNatures affectingNatures;
  List<Names> names;

  PokeAthlonStat({this.id, this.name, this.affectingNatures, this.names});

  PokeAthlonStat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    affectingNatures = json['affecting_natures'] != null
        ? new AffectingNatures.fromJson(json['affecting_natures'])
        : null;
    if (json['names'] != null) {
      names = new List<Names>();
      json['names'].forEach((v) {
        names.add(new Names.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.affectingNatures != null) {
      data['affecting_natures'] = this.affectingNatures.toJson();
    }
    if (this.names != null) {
      data['names'] = this.names.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AffectingNatures {
  List<Increase> increase;
  List<Decrease> decrease;

  AffectingNatures({this.increase, this.decrease});

  AffectingNatures.fromJson(Map<String, dynamic> json) {
    if (json['increase'] != null) {
      increase = new List<Increase>();
      json['increase'].forEach((v) {
        increase.add(new Increase.fromJson(v));
      });
    }
    if (json['decrease'] != null) {
      decrease = new List<Decrease>();
      json['decrease'].forEach((v) {
        decrease.add(new Decrease.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.increase != null) {
      data['increase'] = this.increase.map((v) => v.toJson()).toList();
    }
    if (this.decrease != null) {
      data['decrease'] = this.decrease.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Increase {
  int maxChange;
  CommonResult nature;

  Increase({this.maxChange, this.nature});

  Increase.fromJson(Map<String, dynamic> json) {
    maxChange = json['max_change'];
    nature = json['nature'] != null
        ? new CommonResult.fromJson(json['nature'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['max_change'] = this.maxChange;
    if (this.nature != null) {
      data['nature'] = this.nature.toJson();
    }
    return data;
  }
}

class Decrease {
  int maxChange;
  CommonResult nature;

  Decrease({this.maxChange, this.nature});

  Decrease.fromJson(Map<String, dynamic> json) {
    maxChange = json['max_change'];
    nature = json['nature'] != null
        ? new CommonResult.fromJson(json['nature'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['max_change'] = this.maxChange;
    if (this.nature != null) {
      data['nature'] = this.nature.toJson();
    }
    return data;
  }
}

class Names {
  String name;
  CommonResult language;

  Names({this.name, this.language});

  Names.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    language = json['language'] != null
        ? new CommonResult.fromJson(json['language'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.language != null) {
      data['language'] = this.language.toJson();
    }
    return data;
  }
}
