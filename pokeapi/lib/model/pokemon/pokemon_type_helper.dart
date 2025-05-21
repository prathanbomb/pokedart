import 'dart:ui';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokeapi/model/utils/nullable_extensions.dart';

/// Helper class for working with Pokemon types.
class PokemonTypeHelper {
  /// Returns a color associated with the given Pokemon type.
  static Color getTypeColor(String? typeName) {
    switch (typeName?.toLowerCase() ?? '') {
      case 'normal':
        return const Color(0xFFA8A77A);
      case 'fire':
        return const Color(0xFFEE8130);
      case 'water':
        return const Color(0xFF6390F0);
      case 'electric':
        return const Color(0xFFF7D02C);
      case 'grass':
        return const Color(0xFF7AC74C);
      case 'ice':
        return const Color(0xFF96D9D6);
      case 'fighting':
        return const Color(0xFFC22E28);
      case 'poison':
        return const Color(0xFFA33EA1);
      case 'ground':
        return const Color(0xFFE2BF65);
      case 'flying':
        return const Color(0xFFA98FF3);
      case 'psychic':
        return const Color(0xFFF95587);
      case 'bug':
        return const Color(0xFFA6B91A);
      case 'rock':
        return const Color(0xFFB6A136);
      case 'ghost':
        return const Color(0xFF735797);
      case 'dragon':
        return const Color(0xFF6F35FC);
      case 'dark':
        return const Color(0xFF705746);
      case 'steel':
        return const Color(0xFFB7B7CE);
      case 'fairy':
        return const Color(0xFFD685AD);
      default:
        return const Color(0xFF919AA2); // Default gray
    }
  }

  /// Returns a contrasting text color (black or white) for text displayed
  /// on the given background color.
  static Color getContrastingTextColor(Color backgroundColor) {
    // Calculate luminance - if it's greater than 0.5, use black text
    return backgroundColor.computeLuminance() > 0.5 ? 
           const Color(0xFF000000) : const Color(0xFFFFFFFF);
  }
  
  /// Returns a formatted, readable string for the given type name.
  /// Removes hyphens and capitalizes all words.
  static String formatTypeName(String? typeName) {
    return typeName.formattedName();
  }
  
  /// Gets the primary and secondary types of a Pokemon as formatted strings.
  /// 
  /// Returns a list containing the primary type and optionally the secondary type.
  /// If the Pokemon has no types (rare), returns an empty list.
  static List<String> getFormattedTypeNames(Pokemon? pokemon) {
    if (pokemon == null || pokemon.types.isNullOrEmpty) {
      return [];
    }
    
    // Sort by slot (primary type usually has slot 1)
    final sortedTypes = List<Types>.from(pokemon.types!)
      ..sort((a, b) => (a.slot ?? 999).compareTo(b.slot ?? 999));
    
    return sortedTypes.mapOrEmpty((type) => 
      formatTypeName(type.type?.name)
    );
  }
  
  /// Gets the primary type of a Pokemon as a formatted string.
  /// Returns an empty string if the Pokemon has no types.
  static String getPrimaryTypeName(Pokemon? pokemon) {
    final types = getFormattedTypeNames(pokemon);
    return types.isNotEmpty ? types.first : '';
  }
  
  /// Returns true if the Pokemon has the given type (case-insensitive).
  static bool hasType(Pokemon? pokemon, String typeName) {
    if (pokemon == null || pokemon.types.isNullOrEmpty) {
      return false;
    }
    
    final normalizedType = typeName.toLowerCase();
    return pokemon.types!.any((type) => 
      type.type?.name?.toLowerCase() == normalizedType
    );
  }
  
  /// Calculate type effectiveness for a Pokemon against various attacking types.
  /// 
  /// Returns a map of attacking type names to effectiveness multipliers.
  /// Note: This is a simplified implementation and may not account for all
  /// special cases or abilities that modify type effectiveness.
  static Map<String, double> calculateTypeEffectiveness(Pokemon? pokemon) {
    // This would require type effectiveness data from the API
    // Simplified implementation - would need to be expanded 
    // with complete type matchup data
    return {};
  }
}
