// Resultado de obtener lista de pokemon de PokeAPI
class PokemonList {
  List<PokemonNameReference> pokemons;

  PokemonList(this.pokemons);

  factory PokemonList.fromJson(Map<String, dynamic> json) {
    final List<PokemonNameReference> results = [];
    if (json['results'] != null) {
      json['results'].forEach((v) {
        results.add(PokemonNameReference.fromJson(v));
      });
    }
    return PokemonList(results);
  }
}

// Tipo de dato que retorna PokeAPI cuando se descargan varios pokemons en una llamada.
class PokemonNameReference {
  final String name;
  final String url;

  PokemonNameReference(this.name, this.url);

  factory PokemonNameReference.fromJson(Map<String, dynamic> json) {
    return PokemonNameReference(json['name'], json['url']);
  }
}
