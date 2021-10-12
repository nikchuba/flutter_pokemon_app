class Pokemon {
  Pokemon({
    required this.height,
    required this.id,
    required this.name,
    required this.sprites,
    required this.weight,
  });

  int height;
  int id;
  String name;
  Sprites sprites;
  int weight;

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        height: json["height"],
        id: json["id"],
        name: json["name"],
        sprites: Sprites.fromJson(json["sprites"]),
        weight: json["weight"],
      );
}

class Sprites {
  Sprites({
    required this.frontDefault,
  });

  String frontDefault;

  factory Sprites.fromJson(Map<String, dynamic> json) =>
      Sprites(frontDefault: json["front_default"]);
}
