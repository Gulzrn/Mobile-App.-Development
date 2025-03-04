import 'dart:async';

// Simulated API call to fetch weather data
Future<String> fetchWeatherData() async {
  await Future.delayed(Duration(seconds: 3)); // Simulate network delay

  // Simulating success response
  bool success = true;
  if (success) {
    return 'Weather: Sunny, 25°C';
  } else {
    throw Exception('Failed to fetch weather data');
  }
}

void main() async {
  print('Fetching weather data...');

  try {
    String weather = await fetchWeatherData();
    print('Weather Data: $weather');
  } catch (e) {
    print('Error: $e');
  }
}
