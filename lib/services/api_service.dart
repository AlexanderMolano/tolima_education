import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/group.dart';
import '../models/institution.dart';
import '../models/township.dart';
import '../models/headquarters.dart';

class ApiService {
  final String url = 'https://www.php.engenius.com.co/DatabaseIE.php';
  final Map<String, String> headers = {"Content-Type": "application/json"};

  Future<List<Municipio>> fetchMunicipios() async {
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode({
        "User": "etraining",
        "Password": "explorandoando2020%",
        "option": "municipios"
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      final List<dynamic> data = responseData['data']; // Lista de municipios
      return data.map((json) => Municipio.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load municipios');
    }
  }

  Future<List<Institucion>> fetchInstituciones(String codMun) async {
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode({
        "User": "etraining",
        "Password": "explorandoando2020%",
        "option": "instituciones",
        "CodMun": codMun
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      final List<dynamic> data = responseData['data']; // Lista de instituciones
      return data.map((json) => Institucion.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load instituciones');
    }
  }

  Future<List<Sede>> fetchSedes(String codInst) async {
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode({
        "User": "etraining",
        "Password": "explorandoando2020%",
        "option": "sedes",
        "CodInst": codInst
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      final List<dynamic> data = responseData['data']; // Lista de sedes
      return data.map((json) => Sede.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load sedes');
    }
  }

  Future<List<Grupo>> fetchGrupos(String codSede) async {
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode({
        "User": "etraining",
        "Password": "explorandoando2020%",
        "option": "grupos",
        "CodSede": codSede
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      final List<dynamic> data = responseData['data']; // Lista de grupos
      return data.map((json) => Grupo.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load grupos');
    }
  }

  Future<Grupo> fetchInfoGrupo(String idGrupo) async {
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode({
        "User": "etraining",
        "Password": "explorandoando2020%",
        "option": "infoGrupo",
        "IdGrupo": idGrupo
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      final List<dynamic> data = responseData['data'];
      return Grupo.fromJson(data[0]); // Información del grupo
    } else {
      throw Exception('Failed to load infoGrupo');
    }
  }
}

final String url = 'https://www.php.engenius.com.co/DatabaseIE.php';
final Map<String, String> headers = {"Content-Type": "application/json"};

Future<List<Municipio>> fetchMunicipios() async {
  final response = await http.post(
    Uri.parse(url),
    headers: headers,
    body: jsonEncode({
      "User": "etraining",
      "Password": "explorandoando2020%",
      "option": "municipios"
    }),
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> responseData = jsonDecode(response.body);
    final List<dynamic> data = responseData['data']; // Lista de municipios
    return data.map((json) => Municipio.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load municipios');
  }
}

Future<List<Institucion>> fetchInstituciones(String codMun) async {
  final response = await http.post(
    Uri.parse(url),
    headers: headers,
    body: jsonEncode({
      "User": "etraining",
      "Password": "explorandoando2020%",
      "option": "instituciones",
      "CodMun": codMun
    }),
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> responseData = jsonDecode(response.body);
    final List<dynamic> data = responseData['data']; // Lista de instituciones
    return data.map((json) => Institucion.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load instituciones');
  }
}

Future<List<Sede>> fetchSedes(String codInst) async {
  final response = await http.post(
    Uri.parse(url),
    headers: headers,
    body: jsonEncode({
      "User": "etraining",
      "Password": "explorandoando2020%",
      "option": "sedes",
      "CodInst": codInst
    }),
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> responseData = jsonDecode(response.body);
    final List<dynamic> data = responseData['data']; // Lista de sedes
    return data.map((json) => Sede.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load sedes');
  }
}

Future<List<Grupo>> fetchGrupos(String codSede) async {
  final response = await http.post(
    Uri.parse(url),
    headers: headers,
    body: jsonEncode({
      "User": "etraining",
      "Password": "explorandoando2020%",
      "option": "grupos",
      "CodSede": codSede
    }),
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> responseData = jsonDecode(response.body);
    final List<dynamic> data = responseData['data']; // Lista de grupos
    return data.map((json) => Grupo.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load grupos');
  }
}

Future<Grupo> fetchInfoGrupo(String idGrupo) async {
  final response = await http.post(
    Uri.parse(url),
    headers: headers,
    body: jsonEncode({
      "User": "etraining",
      "Password": "explorandoando2020%",
      "option": "infoGrupo",
      "IdGrupo": idGrupo
    }),
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> responseData = jsonDecode(response.body);
    final List<dynamic> data = responseData['data'];
    return Grupo.fromJson(data[0]); // Información del grupo
  } else {
    throw Exception('Failed to load infoGrupo');
  }
}
