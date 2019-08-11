# pokeapi-dart
[![CircleCI](https://circleci.com/gh/prathanbomb/pokedart.svg?style=svg)](https://circleci.com/gh/prathanbomb/pokedart)

Wrapper for [Poke API](https://pokeapi.co), written in Dart. *Supports PokeAPI v2.*

- [pokeapi-dart](#pokeapi-dart)
  - [Documentation](#Documentation)
  - [Getting Started](#Getting-Started)
  - [Endpoints](#Endpoints)
    - [Berries](#Berries)
    - [Contests](#Contests)
    - [Encounters](#Encounters)
    - [Evolution](#Evolution)
    - [Games](#Games)
    - [Items](#Items)
    - [Locations](#Locations)
    - [Machines](#Machines)
    - [Moves](#Moves)
    - [Pokemon](#Pokemon)
    - [Utility](#Utility)

## Documentation

Full API documentation can be found at [Poke API](https://pokeapi.co/docs/v2.html).

## Getting Started

To use this plugin, add `pokeapi` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

```dart
import 'package:pokeapi/pokeapi.dart';
```

## Endpoints

### Berries

<details>
  <summary>Berries</summary>
  
  #### Get Berries

  *Must pass an offset and limit as Int (e.g. 1, 1).*

  ```dart
  var response = PokeAPI.getObjectList<Berry>(1, 1);
  ```

  #### Get Berry

  *Must pass an ID as Int as Int (e.g. 1).*

  ```dart
  var response = PokeAPI.getObject<Berry>(1);
  ```
</details>

<details>
  <summary>Berry Firmness</summary>
  
  #### Get Berry Firmnesses
  
  *Must pass an offset and limit as Int (e.g. 1, 1).*

  ```dart
  var response = PokeAPI.getObjectList<BerryFirmness>(1, 1);
  ```

  #### Get Berry Firmness

  *Must pass an ID as Int as Int (e.g. 1).*

  ```dart
  var response = PokeAPI.getObject<BerryFirmness>(1);
  ```
</details>

<details>
  <summary>Berry Flavors</summary>
  
  #### Get Berry Flavors
  
  *Must pass an offset and limit as Int (e.g. 1, 1).*

  ```dart
  var response = PokeAPI.getObjectList<BerryFlavor>(1, 1);
  ```

  #### Get Berry Flavor

  *Must pass an ID as Int (e.g. 1).*

  ```dart
  var response = PokeAPI.getObject<BerryFlavor>(1);
  ```
</details>

### Contests

<details>
  <summary>Contest Types</summary>
  
  #### Get Contest Types
  
  *Must pass an offset and limit as Int (e.g. 1, 1).*

  ```dart
  var response = PokeAPI.getObjectList<ContestType>(1, 1);
  ```

  #### Get Contest Type

  *Must pass an ID as Int (e.g. 1).*

  ```dart
  var response = PokeAPI.getObject<ContestType>(1);
  ```
</details>

<details>
  <summary>Contest Effects</summary>
  
  #### Get Contest Effects
  
  *Must pass an offset and limit as Int (e.g. 1, 1).*

  ```dart
  var response = PokeAPI.getObjectList<ContestEffect>(1, 1);
  ```

  #### Get Contest Effect

  *Must pass an ID as Int (e.g. 1).*

  ```dart
  var response = PokeAPI.getObject<ContestEffect>(1);
  ```
</details>

<details>
  <summary>Super Contest Effects</summary>
  
  #### Get Super Contest Effects
  
  *Must pass an offset and limit as Int (e.g. 1, 1).*

  ```dart
  var response = PokeAPI.getObjectList<SuperContestEffect>(1, 1);
  ```

  #### Get Super Contest Effect

  *Must pass an ID as Int (e.g. 1).*

  ```dart
  var response = PokeAPI.getObject<SuperContestEffect>(1);
  ```
</details>

### Encounters

<details>
  <summary>Encounter Methods</summary>
  
  #### Get Encounter Methods
  
  *Must pass an offset and limit as Int (e.g. 1, 1).*

  ```dart
  var response = PokeAPI.getObjectList<EncounterMethod>(1, 1);
  ```

  #### Get Encounter Method

  *Must pass an ID as Int (e.g. 1).*

  ```dart
  var response = PokeAPI.getObject<EncounterMethod>(1);
  ```
</details>

<details>
  <summary>Encounter Conditions</summary>
  
  #### Get Encounter Conditions
  
  *Must pass an offset and limit as Int (e.g. 1, 1).*

  ```dart
  var response = PokeAPI.getObjectList<EncounterCondition>(1, 1);
  ```

  #### Get Encounter Condition

  *Must pass an ID as Int (e.g. 1).*

  ```dart
  var response = PokeAPI.getObject<EncounterCondition>(1);
  ```
</details>

<details>
  <summary>Encounter Condition Values</summary>
  
  #### Get Encounter Condition Values
  
  *Must pass an offset and limit as Int (e.g. 1, 1).*

  ```dart
  var response = PokeAPI.getObjectList<EncounterConditionValue>(1, 1);
  ```

  #### Get Encounter Condition Value

  *Must pass an ID as Int (e.g. 1).*

  ```dart
  var response = PokeAPI.getObject<EncounterConditionValue>(1);
  ```
</details>

### Evolution

<details>
  <summary>Evolution Chains</summary>
  
  #### Get Evolution Chains
  
  *Must pass an offset and limit as Int (e.g. 1, 1).*

  ```dart
  var response = PokeAPI.getObjectList<EvolutionChain>(1, 1);
  ```

  #### Get Evolution Chain

  *Must pass an ID as Int (e.g. 1).*

  ```dart
  var response = PokeAPI.getObject<EvolutionChain>(1);
  ```
</details>

<details>
  <summary>Evolution Triggers</summary>
  
  #### Get Evolution Triggers
  
  *Must pass an offset and limit as Int (e.g. 1, 1).*

  ```dart
  var response = PokeAPI.getObjectList<EvolutionTrigger>(1, 1);
  ```

  #### Get Evolution Trigger

  *Must pass an ID as Int (e.g. 1).*

  ```dart
  var response = PokeAPI.getObject<EvolutionTrigger>(1);
  ```
</details>

### Games

<details>
  <summary>Generations</summary>
  
  #### Get Generations
  
  *Must pass an offset and limit as Int (e.g. 1, 1).*

  ```dart
  var response = PokeAPI.getObjectList<Generation>(1, 1);
  ```

  #### Get Generation

  *Must pass an ID as Int (e.g. 1).*

  ```dart
  var response = PokeAPI.getObject<Generation>(1);
  ```
</details>

<details>
  <summary>Pokedex</summary>
  
  #### Get All Pokedex
  
  *Must pass an offset and limit as Int (e.g. 1, 1).*

  ```dart
  var response = PokeAPI.getObjectList<Pokedex>(1, 1);
  ```

  #### Get Single Pokedex

  *Must pass an ID as Int (e.g. 1).*

  ```dart
  var response = PokeAPI.getObject<Pokedex>(1);
  ```
</details>

<details>
  <summary>Versions</summary>
  
  #### Get Versions
  
  *Must pass an offset and limit as Int (e.g. 1, 1).*

  ```dart
  var response = PokeAPI.getObjectList<Version>(1, 1);
  ```

  #### Get Version

  *Must pass an ID as Int (e.g. 1).*

  ```dart
  var response = PokeAPI.getObject<Version>(1);
  ```
</details>

<details>
  <summary>Version Groups</summary>
  
  #### Get Version Groups
  
  *Must pass an offset and limit as Int (e.g. 1, 1).*

  ```dart
  var response = PokeAPI.getObjectList<VersionGroup>(1, 1);
  ```

  #### Get Version Group

  *Must pass an ID as Int (e.g. 1).*

  ```dart
  var response = PokeAPI.getObject<VersionGroup>(1);
  ```
</details>

### Items

<details>
  <summary>Items</summary>
  
  #### Get Items
  
  *Must pass an offset and limit as Int (e.g. 1, 1).*

  ```dart
  var response = PokeAPI.getObjectList<Item>(1, 1);
  ```

  #### Get Item

  *Must pass an ID as Int (e.g. 1).*

  ```dart
  var response = PokeAPI.getObject<Item>(1);
  ```
</details>

<details>
  <summary>Item Attributes</summary>
  
  #### Get Item Attributes
  
  *Must pass an offset and limit as Int (e.g. 1, 1).*

  ```dart
  var response = PokeAPI.getObjectList<ItemAttribute>(1, 1);
  ```

  #### Get Item Attribute

  *Must pass an ID as Int (e.g. 1).*

  ```dart
  var response = PokeAPI.getObject<ItemAttribute>(1);
  ```
</details>

<details>
  <summary>Item Categories</summary>
  
  #### Get Item Categories
  
  *Must pass an offset and limit as Int (e.g. 1, 1).*

  ```dart
  var response = PokeAPI.getObjectList<ItemCategory>(1, 1);
  ```

  #### Get Item Category

  *Must pass an ID as Int (e.g. 1).*

  ```dart
  var response = PokeAPI.getObject<ItemCategory>(1);
  ```
</details>

<details>
  <summary>Item Fling Effects</summary>
  
  #### Get Item Fling Effects
  
  *Must pass an offset and limit as Int (e.g. 1, 1).*

  ```dart
  var response = PokeAPI.getObjectList<ItemFlingEffect>(1, 1);
  ```

  #### Get Item Fling Effect

  *Must pass an ID as Int (e.g. 1).*

  ```dart
  var response = PokeAPI.getObject<ItemFlingEffect>(1);
  ```
</details>

<details>
  <summary>Item Pockets</summary>
  
  #### Get Item Pockets
  
  *Must pass an offset and limit as Int (e.g. 1, 1).*

  ```dart
  var response = PokeAPI.getObjectList<ItemPocket>(1, 1);
  ```

  #### Get Item Pocket

  *Must pass an ID as Int (e.g. 1).*

  ```dart
  var response = PokeAPI.getObject<ItemPocket>(1);
  ```
</details>

### Locations

<details>
  <summary>Locations</summary>
  
  #### Get Locations
  
  *Must pass an offset and limit as Int (e.g. 1, 1).*

  ```dart
  var response = PokeAPI.getObjectList<Location>(1, 1);
  ```

  #### Get Location

  *Must pass an ID as Int (e.g. 1).*

  ```dart
  var response = PokeAPI.getObject<Location>(1);
  ```
</details>

<details>
  <summary>Location Areas</summary>
  
  #### Get Location Areas
  
  *Must pass an offset and limit as Int (e.g. 1, 1).*

  ```dart
  var response = PokeAPI.getObjectList<LocationArea>(1, 1);
  ```

  #### Get Location Area

  *Must pass an ID as Int (e.g. 1).*

  ```dart
  var response = PokeAPI.getObject<LocationArea>(1);
  ```
</details>

<details>
  <summary>Pal Park Areas</summary>
  
  #### Get Pal Park Areas
  
  *Must pass an offset and limit as Int (e.g. 1, 1).*

  ```dart
  var response = PokeAPI.getObjectList<PalParkArea>(1, 1);
  ```

  #### Get Pal Park Area

  *Must pass an ID as Int (e.g. 1).*

  ```dart
  var response = PokeAPI.getObject<PalParkArea>(1);
  ```
</details>

<details>
  <summary>Regions</summary>
  
  #### Get Regions
  
  *Must pass an offset and limit as Int (e.g. 1, 1).*

  ```dart
  var response = PokeAPI.getObjectList<Region>(1, 1);
  ```

  #### Get Region

  *Must pass an ID as Int (e.g. 1).*

  ```dart
  var response = PokeAPI.getObject<Region>(1);
  ```
</details>

### Machines

<details>
  <summary>Machines</summary>
  
  #### Get Machines
  
  *Must pass an offset and limit as Int (e.g. 1, 1).*

  ```dart
  var response = PokeAPI.getObjectList<Machine>(1, 1);
  ```

  #### Get Machine

  *Must pass an ID as Int (e.g. 1).*

  ```dart
  var response = PokeAPI.getObject<Machine>(1);
  ```
</details>

### Moves

<details>
  <summary>Moves</summary>
  
  #### Get Moves
  
  *Must pass an offset and limit as Int (e.g. 1, 1).*

  ```dart
  var response = PokeAPI.getObjectList<Move>(1, 1);
  ```

  #### Get Move

  *Must pass an ID as Int (e.g. 1).*

  ```dart
  var response = PokeAPI.getObject<Move>(1);
  ```
</details>

<details>
  <summary>Move Ailments</summary>
  
  #### Get Move Ailments
  
  *Must pass an offset and limit as Int (e.g. 1, 1).*

  ```dart
  var response = PokeAPI.getObjectList<MoveAilment>(1, 1);
  ```

  #### Get Move Ailment

  *Must pass an ID as Int (e.g. 1).*

  ```dart
  var response = PokeAPI.getObject<MoveAilment>(1);
  ```
</details>

<details>
  <summary>Move Battle Styles</summary>
  
  #### Get Move Battle Styles
  
  *Must pass an offset and limit as Int (e.g. 1, 1).*

  ```dart
  var response = PokeAPI.getObjectList<MoveBattleStyle>(1, 1);
  ```

  #### Get Move Battle Style

  *Must pass an ID as Int (e.g. 1).*

  ```dart
  var response = PokeAPI.getObject<MoveBattleStyle>(1);
  ```
</details>

<details>
  <summary>Move Categories</summary>
  
  #### Get Move Categories
  
  *Must pass an offset and limit as Int (e.g. 1, 1).*

  ```dart
  var response = PokeAPI.getObjectList<MoveCategory>(1, 1);
  ```

  #### Get Move Category

  *Must pass an ID as Int (e.g. 1).*

  ```dart
  var response = PokeAPI.getObject<MoveCategory>(1);
  ```
</details>

<details>
  <summary>Move Damage Classes</summary>
  
  #### Get Move Damage Classes
  
  *Must pass an offset and limit as Int (e.g. 1, 1).*

  ```dart
  var response = PokeAPI.getObjectList<MoveDamageClass>(1, 1);
  ```

  #### Get Move Damage Class

  *Must pass an ID as Int (e.g. 1).*

  ```dart
  var response = PokeAPI.getObject<MoveDamageClass>(1);
  ```
</details>

<details>
  <summary>Move Learn Methods</summary>
  
  #### Get Move Learn Methods
  
  *Must pass an offset and limit as Int (e.g. 1, 1).*

  ```dart
  var response = PokeAPI.getObjectList<MoveLearnMethod>(1, 1);
  ```

  #### Get Move Learn Method

  *Must pass an ID as Int (e.g. 1).*

  ```dart
  var response = PokeAPI.getObject<MoveLearnMethod>(1);
  ```
</details>

<details>
  <summary>Move Targets</summary>
  
  #### Get Move Targets
  
  *Must pass an offset and limit as Int (e.g. 1, 1).*

  ```dart
  var response = PokeAPI.getObjectList<MoveTarget>(1, 1);
  ```

  #### Get Move Target

  *Must pass an ID as Int (e.g. 1).*

  ```dart
  var response = PokeAPI.getObject<MoveTarget>(1);
  ```
</details>

### Pokemon

<details>
  <summary>Abilities</summary>
  
  #### Get Abilities
  
  *Must pass an offset and limit as Int (e.g. 1, 1).*

  ```dart
  var response = PokeAPI.getObjectList<Ability>(1, 1);
  ```

  #### Get Ability

  *Must pass an ID as Int (e.g. 1).*

  ```dart
  var response = PokeAPI.getObject<Ability>(1);
  ```
</details>

<details>
  <summary>Characteristics</summary>
  
  #### Get Characteristics
  
  *Must pass an offset and limit as Int (e.g. 1, 1).*

  ```dart
  var response = PokeAPI.getObjectList<Characteristic>(1, 1);
  ```

  #### Get Characteristic

  *Must pass an ID as Int (e.g. 1).*

  ```dart
  var response = PokeAPI.getObject<Characteristic>(1);
  ```
</details>

<details>
  <summary>Egg Groups</summary>
  
  #### Get Egg Groups
  
  *Must pass an offset and limit as Int (e.g. 1, 1).*

  ```dart
  var response = PokeAPI.getObjectList<EggGroup>(1, 1);
  ```

  #### Get Egg Group

  *Must pass an ID as Int (e.g. 1).*

  ```dart
  var response = PokeAPI.getObject<EggGroup>(1);
  ```
</details>

<details>
  <summary>Genders</summary>
  
  #### Get Genders
  
  *Must pass an offset and limit as Int (e.g. 1, 1).*

  ```dart
  var response = PokeAPI.getObjectList<Gender>(1, 1);
  ```

  #### Get Gender

  *Must pass an ID as Int (e.g. 1).*

  ```dart
  var response = PokeAPI.getObject<Gender>(1);
  ```
</details>

<details>
  <summary>Growth Rates</summary>
  
  #### Get Growth Rates
  
  *Must pass an offset and limit as Int (e.g. 1, 1).*

  ```dart
  var response = PokeAPI.getObjectList<GrowthRate>(1, 1);
  ```

  #### Get Growth Rate

  *Must pass an ID as Int (e.g. 1).*

  ```dart
  var response = PokeAPI.getObject<GrowthRate>(1);
  ```
</details>

<details>
  <summary>Natures</summary>
  
  #### Get Natures
  
  *Must pass an offset and limit as Int (e.g. 1, 1).*

  ```dart
  var response = PokeAPI.getObjectList<Nature>(1, 1);
  ```

  #### Get Nature

  *Must pass an ID as Int (e.g. 1).*

  ```dart
  var response = PokeAPI.getObject<Nature>(1);
  ```
</details>

<details>
  <summary>Pokeathlon Stats</summary>
  
  #### Get Pokeathlon Stats
  
  *Must pass an offset and limit as Int (e.g. 1, 1).*

  ```dart
  var response = PokeAPI.getObjectList<PokeAthlon>(1, 1);
  ```

  #### Get Pokeathlon Stat

  *Must pass an ID as Int (e.g. 1).*

  ```dart
  var response = PokeAPI.getObject<PokeAthlon>(1);
  ```
</details>

<details>
  <summary>Pokemon</summary>
  
  #### Get All Pokemon
  
  *Must pass an offset and limit as Int (e.g. 1, 1).*

  ```dart
  var response = PokeAPI.getObjectList<Pokemon>(1, 1);
  ```

  #### Get Single Pokemon

  *Must pass an ID as Int (e.g. 1).*

  ```dart
  var response = PokeAPI.getObject<Pokemon>(1);
  ```
</details>

<details>
  <summary>Pokemon Colors</summary>
  
  #### Get Pokemon Colors
  
  *Must pass an offset and limit as Int (e.g. 1, 1).*

  ```dart
  var response = PokeAPI.getObjectList<PokemonColor>(1, 1);
  ```

  #### Get Pokemon Color

  *Must pass an ID as Int (e.g. 1).*

  ```dart
  var response = PokeAPI.getObject<PokemonColor>(1);
  ```
</details>

<details>
  <summary>Pokemon Forms</summary>
  
  #### Get Pokemon Forms
  
  *Must pass an offset and limit as Int (e.g. 1, 1).*

  ```dart
  var response = PokeAPI.getObjectList<PokemonForm>(1, 1);
  ```

  #### Get Pokemon Form

  *Must pass an ID as Int (e.g. 1).*

  ```dart
  var response = PokeAPI.getObject<PokemonForm>(1);
  ```
</details>

<details>
  <summary>Pokemon Habitats</summary>
  
  #### Get Pokemon Habitats
  
  *Must pass an offset and limit as Int (e.g. 1, 1).*

  ```dart
  var response = PokeAPI.getObjectList<PokemonHabitat>(1, 1);
  ```

  #### Get Pokemon Habitat

  *Must pass an ID as Int (e.g. 1).*

  ```dart
  var response = PokeAPI.getObject<PokemonHabitat>(1);
  ```
</details>

<details>
  <summary>Pokemon Shapes</summary>
  
  #### Get Pokemon Shapes
  
  *Must pass an offset and limit as Int (e.g. 1, 1).*

  ```dart
  var response = PokeAPI.getObjectList<PokemonShape>(1, 1);
  ```

  #### Get Pokemon Shape

  *Must pass an ID as Int (e.g. 1).*

  ```dart
  var response = PokeAPI.getObject<PokemonShape>(1);
  ```
</details>

<details>
  <summary>Pokemon Species</summary>
  
  #### Get All Pokemon Species
  
  *Must pass an offset and limit as Int (e.g. 1, 1).*

  ```dart
  var response = PokeAPI.getObjectList<PokemonSpecie>(1, 1);
  ```

  #### Get Single Pokemon Species

  *Must pass an ID as Int (e.g. 1).*

  ```dart
  var response = PokeAPI.getObject<PokemonSpecie>(1);
  ```
</details>

<details>
  <summary>Stats</summary>
  
  #### Get Stats
  
  *Must pass an offset and limit as Int (e.g. 1, 1).*

  ```dart
  var response = PokeAPI.getObjectList<Stat>(1, 1);
  ```

  #### Get Stat

  *Must pass an ID as Int (e.g. 1).*

  ```dart
  var response = PokeAPI.getObject<Stat>(1);
  ```
</details>

<details>
  <summary>Types</summary>
  
  #### Get Types
  
  *Must pass an offset and limit as Int (e.g. 1, 1).*

  ```dart
  var response = PokeAPI.getObjectList<Type>(1, 1);
  ```

  #### Get Type

  *Must pass an ID as Int (e.g. 1).*

  ```dart
  var response = PokeAPI.getObject<Type>(1);
  ```
</details>

### Utility

<details>
  <summary>Languages</summary>
  
  #### Get Languages
  
  *Must pass an offset and limit as Int (e.g. 1, 1).*

  ```dart
  var response = PokeAPI.getObjectList<Language>(1, 1);
  ```

  #### Get Language

  *Must pass an ID as Int (e.g. 1).*

  ```dart
  var response = PokeAPI.getObject<Language>(1);
  ```
</details>
