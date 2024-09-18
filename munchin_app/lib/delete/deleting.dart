import 'package:flutter/material.dart';
import 'package:munchin_app/delete/delete_provider.dart';

class RecommendationPage extends StatefulWidget {
  @override
  _RecommendationPageState createState() => _RecommendationPageState();
}

class _RecommendationPageState extends State<RecommendationPage> {
  final ApiService apiService = ApiService();
  final TextEditingController _controller = TextEditingController();
  List<String> _recommendations = [];

  void _getRecommendations() async {
    final content = _controller.text;
    try {
      final recommendations = await apiService.getRecommendations(content);
      print('***************************************');
      print(recommendations);
      print('***************************************');

      setState(() {
        _recommendations = recommendations;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: "Search "),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _getRecommendations,
              child: Text("Get Recommendations"),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _recommendations.length,
                itemBuilder: (context, index) {
                  if (_recommendations.isEmpty) {
                    return Center(child: Text("No recommendations found"));
                  }
                  return ListTile(
                    title: Text(_recommendations[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
