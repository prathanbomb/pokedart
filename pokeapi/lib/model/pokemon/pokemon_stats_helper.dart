import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokeapi/model/utils/nullable_extensions.dart';

/// Helper class for working with Pokemon stats.
class PokemonStatsHelper {
  /// Gets a specific stat value by name.
  /// 
  /// Returns the base value of the specified stat, or null if not found.
  static int? getStatByName(Pokemon? pokemon, String statName) {
    if (pokemon == null || pokemon.stats.isNullOrEmpty) {
      return null;
    }
    
    final normalizedName = statName.toLowerCase().replaceAll(' ', '-');
    final stat = pokemon.stats!.firstWhereOrNull(
      (stat) => stat.stat?.name?.toLowerCase() == normalizedName
    );
    
    return stat?.baseStat;
  }
  
  /// Gets the HP stat value.
  static int getHP(Pokemon? pokemon) {
    return getStatByName(pokemon, 'hp').orDefault(0);
  }
  
  /// Gets the Attack stat value.
  static int getAttack(Pokemon? pokemon) {
    return getStatByName(pokemon, 'attack').orDefault(0);
  }
  
  /// Gets the Defense stat value.
  static int getDefense(Pokemon? pokemon) {
    return getStatByName(pokemon, 'defense').orDefault(0);
  }
  
  /// Gets the Special Attack stat value.
  static int getSpecialAttack(Pokemon? pokemon) {
    return getStatByName(pokemon, 'special-attack').orDefault(0);
  }
  
  /// Gets the Special Defense stat value.
  static int getSpecialDefense(Pokemon? pokemon) {
    return getStatByName(pokemon, 'special-defense').orDefault(0);
  }
  
  /// Gets the Speed stat value.
  static int getSpeed(Pokemon? pokemon) {
    return getStatByName(pokemon, 'speed').orDefault(0);
  }
  
  /// Gets all base stats as a map.
  static Map<String, int> getAllStats(Pokemon? pokemon) {
    if (pokemon == null || pokemon.stats.isNullOrEmpty) {
      return {};
    }
    
    final result = <String, int>{};
    for (final stat in pokemon.stats!) {
      final name = stat.stat?.name;
      final value = stat.baseStat;
      
      if (name != null && value != null) {
        result[name.formattedName()] = value;
      }
    }
    
    return result;
  }
  
  /// Calculates the total base stats.
  static int getTotalBaseStats(Pokemon? pokemon) {
    if (pokemon == null || pokemon.stats.isNullOrEmpty) {
      return 0;
    }
    
    return pokemon.stats!.fold(0, (total, stat) => total + (stat.baseStat ?? 0));
  }
  
  /// Gets the highest stat.
  /// 
  /// Returns a map with 'name' and 'value' keys, or null if there are no stats.
  static Map<String, dynamic>? getHighestStat(Pokemon? pokemon) {
    if (pokemon == null || pokemon.stats.isNullOrEmpty) {
      return null;
    }
    
    Stats? highestStat;
    int highestValue = -1;
    
    for (final stat in pokemon.stats!) {
      final value = stat.baseStat ?? 0;
      if (value > highestValue) {
        highestValue = value;
        highestStat = stat;
      }
    }
    
    if (highestStat == null) {
      return null;
    }
    
    return {
      'name': highestStat.stat?.name?.formattedName() ?? 'Unknown',
      'value': highestValue,
    };
  }
  
  /// Gets the stat with the lowest value.
  /// 
  /// Returns a map with 'name' and 'value' keys, or null if there are no stats.
  static Map<String, dynamic>? getLowestStat(Pokemon? pokemon) {
    if (pokemon == null || pokemon.stats.isNullOrEmpty) {
      return null;
    }
    
    Stats? lowestStat;
    int lowestValue = 999;
    
    for (final stat in pokemon.stats!) {
      final value = stat.baseStat ?? 0;
      if (value < lowestValue) {
        lowestValue = value;
        lowestStat = stat;
      }
    }
    
    if (lowestStat == null) {
      return null;
    }
    
    return {
      'name': lowestStat.stat?.name?.formattedName() ?? 'Unknown',
      'value': lowestValue,
    };
  }
  
  /// Formats a stat value as a percentage of the maximum possible value (usually 255).
  static double getStatPercentage(int? statValue, {int maxValue = 255}) {
    if (statValue == null || maxValue <= 0) {
      return 0.0;
    }
    return (statValue / maxValue).clamp(0.0, 1.0);
  }
}
