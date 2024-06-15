class Sede {
  final String nombre;
  final String dane;

  Sede({required this.nombre, required this.dane});

  factory Sede.fromJson(Map<String, dynamic> json) {
    return Sede(
      nombre: json['nombre'],
      dane: json['dane'],
    );
  }
}
