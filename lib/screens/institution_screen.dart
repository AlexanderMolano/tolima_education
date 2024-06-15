import 'package:flutter/material.dart';
import '../models/institution.dart';
import 'headquarters_screen.dart';
import '../services/api_service.dart';

class InstitutionScreen extends StatelessWidget {
  final String codMun;

  const InstitutionScreen({super.key, required this.codMun});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instituciones en Municipio'),
      ),
      body: FutureBuilder<List<Institucion>>(
        future: ApiService().fetchInstituciones(codMun),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No hay datos disponibles'));
          } else {
            final instituciones = snapshot.data!;
            return ListView.builder(
              itemCount: instituciones.length,
              itemBuilder: (context, index) {
                final institucion = instituciones[index];
                return ListTile(
                  title: Text(institucion.nombre),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            HeadquartersScreen(codInst: institucion.dane),
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
