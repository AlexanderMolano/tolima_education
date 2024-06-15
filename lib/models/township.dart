class Municipio {
  final String nombre;
  final String dane;

  Municipio({required this.nombre, required this.dane});

  factory Municipio.fromJson(Map<String, dynamic> json) {
    return Municipio(
      nombre: json['nombre'],
      dane: json['dane'],
    );
  }
}
