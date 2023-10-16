import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nasa_api_connection/nasa_item.dart';

class ApiService {
  final String baseUrl = "https://images-api.nasa.gov";

  Future<List<NasaItem>> searchNasaItems() async {
    final response = await http
        .get(Uri.parse('$baseUrl/search?media_type=image&description=planet'));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<dynamic> itemsJson = data['collection']['items'];

      return itemsJson.map((json) {
        String imageUrl = "";
        if (json['links'] != null && json['links'].length > 0) {
          imageUrl = json['links'][0]['href'];
        }
        var jsonData = json['data'][0];
        jsonData['href'] = imageUrl;  
        return NasaItem.fromJson(jsonData);
      }).toList();
    } else {
      throw Exception('Failed to load NASA items');  
    }
  }
}
