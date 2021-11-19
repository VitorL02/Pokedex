class Pokemon {
  final String nome;
  final String image;
  final List<String> tipo;
  final int id;
  final String ordem;

  factory Pokemon.fromMap(Map<String, dynamic> json) {
    return Pokemon(
      nome: json['name'],
      image: json['img'],
      tipo: (json['type'] as List<dynamic>)
          .map(
            (e) => e as String,
          )
          .toList(), //Converte o texto  de types string em uma lista
      id: json['id'],
      ordem: json['num'],
    );
  }

  Pokemon(
      {required this.nome,
      required this.image,
      required this.id,
      required this.ordem,
      required this.tipo});
}
