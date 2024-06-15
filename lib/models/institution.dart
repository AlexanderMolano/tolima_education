class Institucion {
  final String nombre;
  final String dane;

  Institucion({required this.nombre, required this.dane});

  factory Institucion.fromJson(Map<String, dynamic> json) {
    return Institucion(
      nombre: json['nombre'],
      dane: json['dane'],
    );
  }
}
