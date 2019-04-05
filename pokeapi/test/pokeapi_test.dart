import 'package:flutter_test/flutter_test.dart';
import 'package:pokeapi/pokeapi.dart';

void main() {
  Future getAPI<T>() {
    return PokeAPI.getAPI().then((response) {
      print(response.toString());
      return true;
    }).catchError((error, stackTrace) {
      print(stackTrace.toString());
      return false;
    });
  }

  test('getAPI', () {
    try {
      expect(getAPI(), completion(equals(true)));
    } catch (e) {
      print(e.toString());
    }
  });
}
