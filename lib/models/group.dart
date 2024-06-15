class Grupo {
  final String id;
  final String nombre;
  final String numGrupo;
  final String? sede;
  final String? institucion;
  final String? municipio;

  Grupo({
    required this.id,
    required this.nombre,
    required this.numGrupo,
    this.sede,
    this.institucion,
    this.municipio,
  });

  factory Grupo.fromJson(Map<String, dynamic> json) {
    return Grupo(
      id: json['id'],
      nombre: json['nombre'],
      numGrupo: json['numGrupo'],
      sede: json['sede'],
      institucion: json['institución'],
      municipio: json['municipio'],
    );
  }
}
