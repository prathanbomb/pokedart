/// Helper extensions for working with nullable values in the PokeAPI.
library pokeapi.nullable;

/// Extensions for nullable [String] values.
extension NullableStringExtension on String? {
  /// Returns this string if it's not null and not empty, otherwise returns [defaultValue].
  String orDefault(String defaultValue) {
    final value = this;
    return (value != null && value.isNotEmpty) ? value : defaultValue;
  }
  
  /// Returns this string capitalized (first letter uppercase, rest lowercase).
  /// If the string is null or empty, returns an empty string.
  String capitalized() {
    final value = this;
    if (value == null || value.isEmpty) return '';
    return value[0].toUpperCase() + (value.length > 1 ? value.substring(1).toLowerCase() : '');
  }
  
  /// Returns this string with all words capitalized.
  /// If the string is null or empty, returns an empty string.
  String titleCase() {
    final value = this;
    if (value == null || value.isEmpty) return '';
    
    return value.split(' ').map((word) {
      if (word.isEmpty) return '';
      return word[0].toUpperCase() + (word.length > 1 ? word.substring(1).toLowerCase() : '');
    }).join(' ');
  }
  
  /// Returns this string formatted with dashes replaced by spaces and
  /// in title case. If the string is null or empty, returns an empty string.
  String formattedName() {
    final value = this;
    if (value == null || value.isEmpty) return '';
    
    return value.replaceAll('-', ' ').titleCase();
  }
}

/// Extensions for nullable [int] values.
extension NullableIntExtension on int? {
  /// Returns this int if it's not null, otherwise returns [defaultValue].
  int orDefault(int defaultValue) {
    final value = this;
    return value ?? defaultValue;
  }
  
  /// Returns a formatted string for a Pokémon ID (e.g., #001, #025, #150).
  /// If the ID is null, returns [defaultText].
  String formatId({String defaultText = 'Unknown'}) {
    final value = this;
    if (value == null) return defaultText;
    return '#${value.toString().padLeft(3, '0')}';
  }
}

/// Extensions for nullable [double] values.
extension NullableDoubleExtension on double? {
  /// Returns this double if it's not null, otherwise returns [defaultValue].
  double orDefault(double defaultValue) {
    final value = this;
    return value ?? defaultValue;
  }
  
  /// Returns this double formatted with a specific number of [decimalPlaces].
  /// If the value is null, returns [defaultText].
  String formatted({int decimalPlaces = 1, String defaultText = '0.0'}) {
    final value = this;
    if (value == null) return defaultText;
    return value.toStringAsFixed(decimalPlaces);
  }
}

/// Extensions for nullable [List] values.
extension NullableListExtension<T> on List<T>? {
  /// Returns this list if it's not null and not empty, otherwise returns [defaultValue].
  List<T> orDefault(List<T> defaultValue) {
    final value = this;
    return (value != null && value.isNotEmpty) ? value : defaultValue;
  }
  
  /// Returns true if this list is null or empty.
  bool get isNullOrEmpty {
    final value = this;
    return value == null || value.isEmpty;
  }
  
  /// Returns the first element that satisfies the given [predicate].
  /// If this list is null or empty, or no element satisfies the predicate, returns null.
  T? firstWhereOrNull(bool Function(T) predicate) {
    final value = this;
    if (value == null || value.isEmpty) return null;
    
    for (final element in value) {
      if (predicate(element)) return element;
    }
    return null;
  }
  
  /// Maps each element using the provided [convert] function.
  /// If this list is null, returns an empty list.
  List<R> mapOrEmpty<R>(R Function(T) convert) {
    final value = this;
    if (value == null) return [];
    return value.map(convert).toList();
  }
}

/// Extensions for nullable [Map] values.
extension NullableMapExtension<K, V> on Map<K, V>? {
  /// Returns this map if it's not null and not empty, otherwise returns [defaultValue].
  Map<K, V> orDefault(Map<K, V> defaultValue) {
    final value = this;
    return (value != null && value.isNotEmpty) ? value : defaultValue;
  }
  
  /// Returns true if this map is null or empty.
  bool get isNullOrEmpty {
    final value = this;
    return value == null || value.isEmpty;
  }
  
  /// Gets a value from the map if the key exists, otherwise returns null.
  /// Works safely even if the map itself is null.
  V? getOrNull(K key) {
    final value = this;
    if (value == null) return null;
    return value[key];
  }
}

/// General extensions for any nullable object.
extension NullableObjectExtension<T> on T? {
  /// Returns this object if it's not null, otherwise returns [defaultValue].
  T orDefault(T defaultValue) {
    final value = this;
    return value ?? defaultValue;
  }
  
  /// Runs the given [callback] if this object is not null.
  void ifNotNull(void Function(T) callback) {
    final value = this;
    if (value != null) {
      callback(value);
    }
  }
  
  /// Maps this value to a new value using [mapper] if not null,
  /// otherwise returns [defaultValue].
  R mapOr<R>(R Function(T) mapper, R defaultValue) {
    final value = this;
    return value != null ? mapper(value) : defaultValue;
  }
}
