import 'dart:ui';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokeapi/model/pokemon/pokemon_stats_helper.dart';
import 'package:pokeapi/model/pokemon/pokemon_type_helper.dart';
import 'package:pokeapi/model/utils/nullable_extensions.dart';
import 'package:pokeapi/model/utils/result.dart';

/// Enhanced version of the Pokemon class with better nullable handling.
extension PokemonEnhanced on Pokemon {
  /// Gets the name of the Pokemon, properly formatted.
  String getFormattedName() {
    return name.orDefault('Unknown Pokémon').formattedName();
  }

  /// Gets the ID of the Pokemon as a formatted string (e.g., "#025").
  String getFormattedId() {
    return id.formatId();
  }

  /// Gets the height in meters rather than decimeters.
  double getHeightInMeters() {
    return (height ?? 0) / 10.0;
  }

  /// Gets the weight in kilograms rather than hectograms.
  double getWeightInKilograms() {
    return (weight ?? 0) / 10.0;
  }

  /// Gets all types of the Pokemon as formatted strings.
  List<String> getFormattedTypes() {
    return PokemonTypeHelper.getFormattedTypeNames(this);
  }

  /// Gets all abilities of the Pokemon.
  /// 
  /// Returns a list of maps with 'name', 'isHidden', and 'description' keys.
  List<Map<String, dynamic>> getFormattedAbilities() {
    if (abilities.isNullOrEmpty) {
      return [];
    }

    return abilities!.mapOrEmpty((ability) {
      return {
        'name': ability.ability?.name.formattedName() ?? 'Unknown',
        'isHidden': ability.isHidden ?? false,
        'slot': ability.slot ?? 0,
      };
    });
  }

  /// Gets a map of all base stats.
  Map<String, int> getStats() {
    return PokemonStatsHelper.getAllStats(this);
  }

  /// Gets the total base stats value.
  int getTotalBaseStats() {
    return PokemonStatsHelper.getTotalBaseStats(this);
  }

  /// Gets the primary type of the Pokemon.
  String getPrimaryType() {
    return PokemonTypeHelper.getPrimaryTypeName(this);
  }

  /// Gets the color associated with the Pokemon's primary type.
  Color getPrimaryTypeColor() {
    final types = this.types;
    if (types == null || types.isEmpty) {
      return PokemonTypeHelper.getTypeColor(null);
    }
    
    // Sort by slot (primary type usually has slot 1)
    final sortedTypes = List<Types>.from(types)
      ..sort((a, b) => (a.slot ?? 999).compareTo(b.slot ?? 999));
    
    return PokemonTypeHelper.getTypeColor(sortedTypes.first.type?.name);
  }

  /// Gets the sprite URL for the Pokemon.
  /// 
  /// [preference] determines which sprite to prioritize.
  /// Returns null if no matching sprite is available.
  String? getSpriteUrl({
    SpritePreference preference = SpritePreference.frontDefault,
    bool shiny = false,
    bool female = false,
  }) {
    if (sprites == null) {
      return null;
    }

    // First priority: match all criteria
    if (female) {
      if (shiny) {
        if (preference == SpritePreference.front) {
          return sprites!.frontShinyFemale;
        } else {
          return sprites!.backShinyFemale;
        }
      } else {
        if (preference == SpritePreference.front) {
          return sprites!.frontFemale;
        } else {
          return sprites!.backFemale;
        }
      }
    } else {
      if (shiny) {
        if (preference == SpritePreference.front) {
          return sprites!.frontShiny;
        } else {
          return sprites!.backShiny;
        }
      } else {
        if (preference == SpritePreference.front) {
          return sprites!.frontDefault;
        } else {
          return sprites!.backDefault;
        }
      }
    }
  }
  
  /// Creates a Result object from this Pokemon.
  /// 
  /// This is useful for handling nullable fields in a more functional way.
  Result<String> getNameAsResult() {
    return name.asResult(errorIfNull: const NullValueError('Pokemon name is null'));
  }
  
  /// Safely gets a list of move names.
  List<String> getMoveNames({int limit = 0}) {
    if (moves.isNullOrEmpty) {
      return [];
    }
    
    var moveList = moves!.mapOrEmpty((move) => 
      move.move?.name.formattedName() ?? 'Unknown Move'
    );
    
    if (limit > 0 && moveList.length > limit) {
      return moveList.sublist(0, limit);
    }
    
    return moveList;
  }
  
  /// Returns the base experience as a percentage relative to max exp (typically 600).
  double getBaseExperiencePercentage({int maxExp = 600}) {
    final exp = baseExperience ?? 0;
    return (exp / maxExp).clamp(0.0, 1.0);
  }
  
  /// Returns true if this Pokemon has the specified ability.
  bool hasAbility(String abilityName) {
    if (abilities.isNullOrEmpty) {
      return false;
    }
    
    final normalizedName = abilityName.toLowerCase();
    return abilities!.any((ability) => 
      ability.ability?.name?.toLowerCase() == normalizedName
    );
  }
  
  /// Returns the species name if available.
  String getSpeciesName() {
    return species?.name.formattedName() ?? 'Unknown Species';
  }
  
  /// Formats the Pokemon's height and weight as a human-readable string.
  String getFormattedHeightAndWeight() {
    final heightMeters = getHeightInMeters();
    final weightKg = getWeightInKilograms();
    
    return '${heightMeters.toStringAsFixed(1)}m, ${weightKg.toStringAsFixed(1)}kg';
  }
}

/// Sprite preferences for getting Pokemon images.
enum SpritePreference {
  /// Front-facing sprite (default)
  front,
  
  /// Front-facing sprite (alias for front)
  frontDefault,
  
  /// Back-facing sprite
  back,
  
  /// Back-facing sprite (alias for back)
  backDefault,
}
