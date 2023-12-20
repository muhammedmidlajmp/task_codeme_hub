import 'dart:convert';
import 'package:code_me_hub/model/lead_data_model/lead_data_model.dart';
import 'package:http/http.dart' as http;

Future<LeadListResponse> fetchData() async {
  const String apiUrl =
      'https://crm-beta-api.vozlead.in/api/v2/lead/lead_list/?priority=&date=&to=&from=&status=&page=1&item=25&search=&user_id';
  try {
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        'Authorization': 'Token bcd4fe3b56a1f73e190c28dd7487bd0f03a7eb49',
        'Content-Type': 'application/json',
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
