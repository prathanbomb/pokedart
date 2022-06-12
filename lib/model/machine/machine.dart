import 'package:pokeapi/model/utils/common.dart';

class Machine {
  NamedAPIResource? item;
  NamedAPIResource? move;
  NamedAPIResource? versionGroup;
  int? id;

  Machine({this.item, this.move, this.versionGroup, this.id});

  Machine.fromJson(Map<String, dynamic> json) {
    item = json['item'] != null
        ? new NamedAPIResource.fromJson(json['item'])
        : null;
    move = json['move'] != null
        ? new NamedAPIResource.fromJson(json['move'])
        : null;
    versionGroup = json['version_group'] != null
        ? new NamedAPIResource.fromJson(json['version_group'])
        : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.item != null) {
      data['item'] = this.item!.toJson();
    }
    if (this.move != null) {
      data['move'] = this.move!.toJson();
    }
    if (this.versionGroup != null) {
      data['version_group'] = this.versionGroup!.toJson();
    }
    data['id'] = this.id;
    return data;
  }

  @override
  String toString() {
    return 'Machine{item: $item, move: $move, versionGroup: $versionGroup, id: $id}';
  }
}
