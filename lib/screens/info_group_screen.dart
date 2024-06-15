import 'package:flutter/material.dart';
import '../models/group.dart';
import '../services/api_service.dart';

class InfoGroupScreen extends StatelessWidget {
  final String idGrupo;

  const InfoGroupScreen({super.key, required this.idGrupo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Información del Grupo'),
      ),
      body: FutureBuilder<Grupo>(
        future: ApiService().fetchInfoGrupo(idGrupo),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No hay datos disponibles'));
          } else {
            final grupo = snapshot.data!;
            return Container(
              margin: const EdgeInsets.all(16),
              width: double.maxFinite,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nombre: ${grupo.nombre}',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Text('Sede: ${grupo.sede}',
                          style: const TextStyle(fontSize: 16)),
                      const SizedBox(height: 8),
                      Text('Institución: ${grupo.institucion}',
                          style: const TextStyle(fontSize: 16)),
                      const SizedBox(height: 8),
                      Text('Municipio: ${grupo.municipio}',
                          style: const TextStyle(fontSize: 16)),
                      const SizedBox(height: 8),
                      Text('Número de Grupo: ${grupo.numGrupo}',
                          style: const TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
