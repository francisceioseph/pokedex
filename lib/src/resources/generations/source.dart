import 'dart:convert';
import 'package:http/http.dart' show Client;
import '../../models/generation.dart';
import '../source.dart';

const _ROOT_URL = 'https://pokeapi.co/api/v2';

class GenerationSource implements Source<Generation> {
  Client _client = Client();

  Future<List<Generation>> fetchResource() async {
    final response = await _client.get('$_ROOT_URL/generation');
    final body = json.decode(response.body);
    final List<dynamic> results = body['results'];

    return results.map((data) => Generation.fromJSON(data)).toList();
  }

  Future<Generation> fetchItem(int id) async {
    final response = await _client.get('$_ROOT_URL/generation/$id');
    final body = json.decode(response.body);
    final generation = Generation.fromJSON(body);
    return generation;
  }
}
