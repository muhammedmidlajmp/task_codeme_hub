import 'dart:convert';
import 'package:http/http.dart' as http;

Future<LeadListResponse> fetchData() async {
  final String apiUrl = 'https://your-api-endpoint.com/leads'; // Replace with your actual API endpoint

  try {
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        'Authorization': 'Bearer your_access_token', // Replace with your actual access token if required
        'Content-Type': 'application/json', // Add any other headers you need
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      return LeadListResponse.fromJson(json);
    } else {
      // If the server did not return a 200 OK response,
      // throw an exception with the error message.
      throw Exception('Failed to load data');
    }
  } catch (e) {
    // Handle network errors or any other exceptions here
    print('Error: $e');
    throw Exception('Failed to load data');
  }
}

void main() async {
  try {
    final leadListResponse = await fetchData();
    print('Data: ${leadListResponse.data.leads}');
  } catch (e) {
    print('Error fetching data: $e');
    // Handle error, show a message to the user, etc.
  }
}
