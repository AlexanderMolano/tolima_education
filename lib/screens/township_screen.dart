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

  String capitalizeFirstLetter(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade50,
      appBar: AppBar(
        backgroundColor: Colors.amber,
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
                  tileColor: Colors.amber.shade100,
                  splashColor: Colors.amber.shade400,
                  title: Text(
                    capitalizeFirstLetter(municipio.nombre),
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
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
