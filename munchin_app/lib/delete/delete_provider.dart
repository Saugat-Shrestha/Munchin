import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String apiUrl = "http://127.0.0.1:5000/recommend";

  // Future<List<String>> getRecommendations(String content) async {
  //   final response = await http.post(
  //     Uri.parse(apiUrl),
  //     headers: {"Content-Type": "application/json"},
  //     body: json.encode({"content": content}),
  //   );

  //   if (response.statusCode == 200) {
  //     final data = json.decode(response.body);
  //     return List<String>.from(data['recommendations']);
  //   } else {
  //     throw Exception('Failed to load recommendations');
  //   }
  // }
  // Future<List<String>> getRecommendations(String content) async {
  //   final response = await http.post(
  //     Uri.parse(apiUrl),
  //     headers: {"Content-Type": "application/json"},
  //     body: json.encode({"content": content}),
  //   );

  //   print('Response body: ${response.body}');

  //   if (response.statusCode == 200) {
  //     final data = json.decode(response.body);
  //     return List<String>.from(data['recommendations']);
  //   } else {
  //     throw Exception('Failed to load recommendations');
  //   }
  // }
  // Future<List<String>> getRecommendations(String content) async {
  //   final response = await http.post(
  //     Uri.parse(apiUrl),
  //     headers: {"Content-Type": "application/json"},
  //     body: json.encode({"content": content}),
  //   );

  //   if (response.statusCode == 200) {
  //     try {
  //       final decodedResponse = utf8.decode(response.bodyBytes);
  //       print('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
  //       print(decodedResponse);
  //       print('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');

  //       final data = json.decode(decodedResponse);
  //       // print("+++++++++++++");
  //       // print(data);
  //       // print("+++++++++++++");

  //       return List<String>.from(data);
  //     } catch (e) {
  //       print('Response body: ${response.body}');
  //       print('Error decoding JSON: $e');
  //       throw Exception('Failed to decode JSON');
  //     }
  //   } else {
  //     print('Response status: ${response.statusCode}');
  //     print('Response body: ${response.body}');
  //     throw Exception('Failed to load recommendations');
  //   }
  // }

//   import 'dart:convert';
// import 'package:http/http.dart' as http;

  Future<List<String>> getRecommendations(String content) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/json"},
      body: json.encode({"content": content}),
    );

    if (response.statusCode == 200) {
      try {
        final decodedResponse = utf8.decode(response.bodyBytes);
        print('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
        print(decodedResponse);
        print('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');

        // Split the response into individual JSON objects
        final jsonObjects = decodedResponse.split('} {');

        // Add necessary brackets to create a valid JSON array
        final jsonResponse = '[' + jsonObjects.join('},{') + ']';

        final data = json.decode(jsonResponse);
        return List<String>.from(data.map((item) => item['Name']));
      } catch (e) {
        print('Response body: ${response.body}');
        print('Error decoding JSON: $e');
        throw Exception('Failed to decode JSON');
      }
    } else {
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to load recommendations');
    }
  }
}
