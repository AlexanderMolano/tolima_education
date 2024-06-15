import 'package:flutter/material.dart';
import '../models/headquarters.dart';
import '../services/api_service.dart';
import 'group_screen.dart';

class HeadquartersScreen extends StatelessWidget {
  final String codInst;

  const HeadquartersScreen({super.key, required this.codInst});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Sedes de la Institución'),
      ),
      body: FutureBuilder<List<Sede>>(
        future: ApiService().fetchSedes(codInst),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay datos disponibles'));
          } else {
            final sedes = snapshot.data!;
            return ListView.builder(
              itemCount: sedes.length,
              itemBuilder: (context, index) {
                final sede = sedes[index];
                return ListTile(
                  tileColor: Colors.amber.shade100,
                  splashColor: Colors.amber.shade400,
                  title: Text(sede.nombre),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GroupsScreen(codSede: sede.dane),
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
