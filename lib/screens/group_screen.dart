import 'package:flutter/material.dart';
import '../models/group.dart';
import '../services/api_service.dart';
import 'info_group_screen.dart';

class GroupsScreen extends StatelessWidget {
  final String codSede;

  const GroupsScreen({super.key, required this.codSede});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Grupos en la Sede'),
      ),
      body: FutureBuilder<List<Grupo>>(
        future: ApiService().fetchGrupos(codSede),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay datos disponibles'));
          } else {
            final grupos = snapshot.data!;
            return ListView.builder(
              itemCount: grupos.length,
              itemBuilder: (context, index) {
                final grupo = grupos[index];
                return ListTile(
                  tileColor: Colors.amber.shade100,
                  splashColor: Colors.amber.shade400,
                  title: Text(grupo.nombre),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            InfoGroupScreen(idGrupo: grupo.id),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
