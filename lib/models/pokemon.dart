class Pokemon {
  Pokemon({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.sprites,
  });

  int id;
  String name;
  int height;
  int weight;
  Sprites? sprites;

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        id: json["id"],
        name: json["name"],
        height: json["height"],
        weight: json["weight"],
        sprites: Sprites.fromJson(json["sprites"]),
      );
}

class Sprites {
  Sprites(this.list);

  List<dynamic> list;

  factory Sprites.fromJson(Map<String, dynamic> json) {
    List<dynamic> validSprites = [];
    json.forEach((key, value) {
      if (key != 'other' && key != 'versions' && value != null) {
        validSprites.add({'url': value, 'name': key});
      }
    });
    return Sprites(validSprites);
  }
}
