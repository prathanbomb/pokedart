import 'package:flutter_test/flutter_test.dart';
import 'package:pokeapi/model/berry/berry-firmness.dart';
import 'package:pokeapi/model/berry/berry-flavor.dart';
import 'package:pokeapi/model/berry/berry.dart';
import 'package:pokeapi/model/item/item-ability.dart';
import 'package:pokeapi/model/item/item-category.dart';
import 'package:pokeapi/model/item/item-fling-effect.dart';
import 'package:pokeapi/model/item/item-pocket.dart';
import 'package:pokeapi/model/item/item.dart';
import 'package:pokeapi/model/pokemon/ability.dart';
import 'package:pokeapi/pokeapi.dart';

void main() {
  Future getObject<T>(int id) {
    return PokeAPI.getObject<T>(id).then((response) {
      print(response.toString());
      return true;
    }).catchError((error, stackTrace) {
      print(stackTrace.toString());
      return false;
    });
  }

  Future getObjectList<T>(int offset, int limit) {
    return PokeAPI.getObjectList<T>(offset, limit).then((response) {
      print(response.toString());
      return true;
    }).catchError((error, stackTrace) {
      print(stackTrace.toString());
      return false;
    });
  }

  test('getBerry', () {
    try {
      expect(getObject<Berry>(1), completion(equals(true)));
    } catch (e) {
      print(e.toString());
    }
  });

  test('getBerryFirmness', () {
    try {
      expect(getObject<BerryFirmness>(1), completion(equals(true)));
    } catch (e) {
      print(e.toString());
    }
  });

  test('getBerryFlavor', () {
    try {
      expect(getObject<BerryFlavor>(1), completion(equals(true)));
    } catch (e) {
      print(e.toString());
    }
  });

  test('getItem', () {
    try {
      expect(getObject<Item>(1), completion(equals(true)));
    } catch (e) {
      print(e.toString());
    }
  });

  test('getItemAttribute', () {
    try {
      expect(getObject<ItemAbility>(1), completion(equals(true)));
    } catch (e) {
      print(e.toString());
    }
  });

  test('getItemCategory', () {
    try {
      expect(getObject<ItemCategory>(1), completion(equals(true)));
    } catch (e) {
      print(e.toString());
    }
  });

  test('getItemFlingEffect', () {
    try {
      expect(getObject<ItemFlingEffect>(1), completion(equals(true)));
    } catch (e) {
      print(e.toString());
    }
  });

  test('getItemPocket', () {
    try {
      expect(getObject<ItemPocket>(1), completion(equals(true)));
    } catch (e) {
      print(e.toString());
    }
  });

  test('getAbility', () {
    try {
      expect(getObject<Ability>(1), completion(equals(true)));
    } catch (e) {
      print(e.toString());
    }
  });
}
