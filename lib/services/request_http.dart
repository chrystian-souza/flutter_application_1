import 'dart:convert';
import 'package:http/http.dart' as http;


Future<Map<String, dynamic>> getProducts() async {
  try {
    var url = Uri.parse('https://economia.awesomeapi.com.br/json/all');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    throw Exception('Failed to load data: $e');
  }
}
