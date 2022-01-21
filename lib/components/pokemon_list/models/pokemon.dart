import 'package:equatable/equatable.dart';

// Pokemon object to show on the list.
class Pokemon extends Equatable {
  final String pokemonName;
  final String pokemonPhotoURL;
  final int pokedexNumber;

  const Pokemon(
      {required this.pokedexNumber,
      required this.pokemonName,
      required this.pokemonPhotoURL});

  @override
  List<Object?> get props => [pokedexNumber, pokemonName, pokemonPhotoURL];

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    final pokemonSprites = PokemonSprites.fromJson(json['sprites']);
    return Pokemon(
        pokedexNumber: json['id'],
        pokemonName: json['name'],
        pokemonPhotoURL:
            pokemonSprites.other?.officialArtwork?.frontDefault ?? '');
  }

  @override
  String toString() {
    // TODO: implement toString
    return '$pokedexNumber - $pokemonName';
  }
}

// PokemonSprites para acceder a las imagenes de pokemon.
class PokemonSprites {
  Other? other;

  PokemonSprites({this.other});

  factory PokemonSprites.fromJson(Map<String, dynamic> json) {
    return PokemonSprites(other: Other.fromJson(json['other']));
  }
}

class Other {
  OfficialArtwork? officialArtwork;

  Other({this.officialArtwork});

  factory Other.fromJson(Map<String, dynamic> json) {
    return Other(
        officialArtwork: OfficialArtwork.fromJson(json['official-artwork']));
  }
}

class OfficialArtwork {
  String? frontDefault;

  OfficialArtwork({this.frontDefault});

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) {
    return OfficialArtwork(frontDefault: json['front_default']);
  }
}
