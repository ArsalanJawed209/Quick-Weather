import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/weather_provider.dart';
import '../utils/colors.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text(
          "Weather Screen",
          style: TextStyle(color: text),
        ),
        backgroundColor: background,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Form(
                key: weatherProvider.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text Field
                    TextFormField(
                      controller: weatherProvider.cityController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter city name";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Enter city name",
                        labelStyle: TextStyle(
                          color: primary, // Change label color to primary color
                          fontSize: 16, // Adjust label font size
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15.0,
                            horizontal: 20.0), // Add more padding
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: primary), // Change border color
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: primary, width: 2.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                        height:
                            16), // Adjust spacing between text field and button

                    // Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 14.0, horizontal: 20.0),
                            backgroundColor:
                                secondary, // Use secondary color for the button
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            final cityName =
                                weatherProvider.cityController.text;
                            final FormState? form =
                                weatherProvider.formKey.currentState;
                            if (form!.validate()) {
                              weatherProvider.getWeather(cityName);
                            }
                          },
                          icon: const Icon(Icons.cloud,
                              color: Colors.white), // Add icon
                          label: const Text(
                            "Get Weather",
                            style: TextStyle(
                              fontSize: 18, // Make button text bigger
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 60),
              weatherProvider.loader!
                  ? const CircularProgressIndicator()
                  : weatherProvider.weather == null
                      ? Column(
                          children: [
                            Icon(
                              Icons.search,
                              size: 80,
                              color: Colors.grey[400], // Placeholder icon
                            ),
                            const SizedBox(height: 20),
                            Text(
                              "No weather data yet, please search for a city.",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey[600], // Placeholder text
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )
                      : Container(
                          width: double.infinity,
                          height: 400,
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF5EB9FF), Color(0xFF1976D2)],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 10,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    weatherProvider.weather!.cityName,
                                    style: const TextStyle(
                                        fontSize: 22,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Image.network(
                                'http://openweathermap.org/img/w/${weatherProvider.weather!.icon}.png',
                                fit: BoxFit.cover,
                                height: 100,
                                color: Colors.white,
                              ),

                              const SizedBox(height: 20),

                              // Temperature text
                              Text(
                                "${weatherProvider.weather!.temperature.toStringAsFixed(1)}°C",
                                style: const TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white70,
                                ),
                              ),

                              const SizedBox(height: 10),

                              Text(
                                weatherProvider.weather!.description
                                    .toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white70,
                                ),
                              ),

                              const SizedBox(height: 30),

                              const SizedBox(height: 5),

                              Text(
                                weatherProvider.formattedDate,
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.white54,
                                ),
                              ),
                            ],
                          ),
                        ),
            ],
          ),
        ),
      ),
    );
  }
}
