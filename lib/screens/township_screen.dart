import 'package:flutter/material.dart';
import '../models/township.dart';
import '../services/api_service.dart';
import 'institution_screen.dart';

class TownshipScreen extends StatefulWidget {
  const TownshipScreen({super.key});

  @override
  TownshipScreenState createState() => TownshipScreenState();
}

class TownshipScreenState extends State<TownshipScreen> {
  late Future<List<Municipio>> futureMunicipios;

  @override
  void initState() {
    super.initState();
    futureMunicipios = ApiService().fetchMunicipios();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Municipios'),
      ),
      body: FutureBuilder<List<Municipio>>(
        future: futureMunicipios,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay datos disponibles'));
          } else {
            final municipios = snapshot.data!;
            return ListView.builder(
              itemCount: municipios.length,
              itemBuilder: (context, index) {
                final municipio = municipios[index];
                return ListTile(
                  title: Text(municipio.nombre),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            InstitutionScreen(codMun: municipio.dane),
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
