import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/appointment.dart';

class ApiService {
  final String baseUrl = 'http://10.0.2.2:5000/api'; // For Android emulator
  // Use 'http://localhost:5000/api' for iOS simulator

  // Create a new appointment
  Future createAppointment(Appointment appointment) async {
    final response = await http.post(
      Uri.parse('$baseUrl/appointments'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(appointment.toJson()),
    );

    if (response.statusCode == 201) {
      return Appointment.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create appointment: ${response.body}');
    }
  }

  // Get appointment by ID
  Future getAppointment(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/appointments/$id'));

    if (response.statusCode == 200) {
      return Appointment.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load appointment');
    }
  }
}