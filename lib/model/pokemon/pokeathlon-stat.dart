import 'package:pokeapi/model/utils/common.dart';

class PokeAthlonStat {
  int? id;
  String? name;
  AffectingNatures? affectingNatures;
  List<Names>? names;

  PokeAthlonStat({this.id, this.name, this.affectingNatures, this.names});

  PokeAthlonStat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    affectingNatures = json['affecting_natures'] != null
        ?  AffectingNatures.fromJson(json['affecting_natures'])
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
    if (this.affectingNatures != null) {
      data['affecting_natures'] = this.affectingNatures!.toJson();
    }
    if (this.names != null) {
      data['names'] = this.names!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'PokeAthlonStat{id: $id, name: $name, affectingNatures: $affectingNatures, names: $names}';
  }
}

class AffectingNatures {
  List<Increase>? increase;
  List<Decrease>? decrease;

  AffectingNatures({this.increase, this.decrease});

  AffectingNatures.fromJson(Map<String, dynamic> json) {
    if (json['increase'] != null) {
      increase =  <Increase>[];
      json['increase'].forEach((v) {
        increase!.add( Increase.fromJson(v));
      });
    }
    if (json['decrease'] != null) {
      decrease =  <Decrease>[];
      json['decrease'].forEach((v) {
        decrease!.add( Decrease.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
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

class Increase {
  int? maxChange;
  NamedAPIResource? nature;

  Increase({this.maxChange, this.nature});

  Increase.fromJson(Map<String, dynamic> json) {
    maxChange = json['max_change'];
    nature = json['nature'] != null
        ?  NamedAPIResource.fromJson(json['nature'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['max_change'] = this.maxChange;
    if (this.nature != null) {
      data['nature'] = this.nature!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'Increase{maxChange: $maxChange, nature: $nature}';
  }
}

class Decrease {
  int? maxChange;
  NamedAPIResource? nature;

  Decrease({this.maxChange, this.nature});

  Decrease.fromJson(Map<String, dynamic> json) {
    maxChange = json['max_change'];
    nature = json['nature'] != null
        ?  NamedAPIResource.fromJson(json['nature'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['max_change'] = this.maxChange;
    if (this.nature != null) {
      data['nature'] = this.nature!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'Decrease{maxChange: $maxChange, nature: $nature}';
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
