# Nullable Handling in PokeAPI

This document explains how to effectively work with nullable values in the PokeAPI package.

## About Nullability

The PokeAPI package uses nullable types extensively because:

1. **API Consistency**: The PokéAPI service may not always return every field for every resource
2. **Data Variability**: Different Pokémon have different attributes (some don't have abilities, etc.)
3. **Dart Null Safety**: The package embraces Dart's null safety features

## Best Practices

### 1. Use Extension Methods

The package provides several extension methods to safely handle nullable values:

```dart
import 'package:pokeapi/model/utils/nullable_extensions.dart';

// Instead of this:
final name = pokemon.name != null ? pokemon.name : 'Unknown';

// Use this:
final name = pokemon.name.orDefault('Unknown');

// Or format a nullable name:
final formattedName = pokemon.name.formattedName();
```

### 2. Use Enhanced Pokemon Methods

The `PokemonEnhanced` extension provides helper methods that handle nullability:

```dart
import 'package:pokeapi/model/pokemon/pokemon_enhanced.dart';

// Get safely formatted values
final name = pokemon.getFormattedName();
final types = pokemon.getFormattedTypes();
final height = pokemon.getHeightInMeters();
final spriteUrl = pokemon.getSpriteUrl(preference: SpritePreference.front);
```

### 3. Use the Result Class for Error Handling

The `Result` class provides a more functional way to handle nullable values:

```dart
import 'package:pokeapi/model/utils/result.dart';

// Convert nullable to Result
final nameResult = pokemon.name.asResult();

// Handle both success and error cases
nameResult.fold(
  onSuccess: (name) => print('Name: $name'),
  onFailure: (error) => print('Error: $error'),
);

// Or use the extension methods on Pokemon
final nameResult = pokemon.getNameAsResult();
```

### 4. Access Stats Safely

Use the `PokemonStatsHelper` class for safe stat access:

```dart
import 'package:pokeapi/model/pokemon/pokemon_stats_helper.dart';

// Get a specific stat safely
final hp = PokemonStatsHelper.getHP(pokemon);

// Get all stats as a map
final stats = PokemonStatsHelper.getAllStats(pokemon);

// Get total stats
final total = PokemonStatsHelper.getTotalBaseStats(pokemon);
```

### 5. Working with Types

Use the `PokemonTypeHelper` class for safe type handling:

```dart
import 'package:pokeapi/model/pokemon/pokemon_type_helper.dart';

// Get formatted type names
final types = PokemonTypeHelper.getFormattedTypeNames(pokemon);

// Get a color for a type
final color = PokemonTypeHelper.getTypeColor(typeName);

// Check if a Pokemon has a specific type
final hasWater = PokemonTypeHelper.hasType(pokemon, 'water');
```

## Collection Handling

Working with nullable collections (lists, maps):

```dart
// Check if a list is null or empty
if (pokemon.moves.isNullOrEmpty) {
  // Handle empty case
}

// Map a nullable list safely
final moveNames = pokemon.moves.mapOrEmpty((move) => 
  move.move?.name ?? 'Unknown'
);

// Find an item safely
final ability = pokemon.abilities.firstWhereOrNull(
  (ability) => ability.isHidden == true
);
```

## Benefits of Enhanced Nullable Handling

1. **Reduced Boilerplate**: Less repetitive null-checking code
2. **Better Readability**: More expressive and cleaner code
3. **Fewer Bugs**: Helps prevent NullPointerExceptions
4. **Consistent Behavior**: Standardized handling for edge cases

## When to Use Each Approach

- **Extension Methods**: For simple transformations and default values
- **Enhanced Pokemon Methods**: For formatted, human-readable data
- **Result Class**: For complex operations that might fail
- **Helper Classes**: For domain-specific operations (stats, types)
