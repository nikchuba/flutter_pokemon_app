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
  Sprites(this.list);

  List<dynamic> list;

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        [
          {'url': json["front_default"], 'name': 'Front default'},
          {'url': json["back_default"], 'name': 'Back default'},
          {'url': json["front_female"], 'name': 'Front female'},
          {'url': json["back_female"], 'name': 'Back female'},
          {'url': json["front_shiny_female"], 'name': 'Front shiny female'},
          {'url': json["back_shiny_female"], 'name': 'Back shiny female'},
          {'url': json["front_shiny"], 'name': 'Front shiny'},
          {'url': json["back_shiny"], 'name': 'Back shiny'},
        ],
      );
}
