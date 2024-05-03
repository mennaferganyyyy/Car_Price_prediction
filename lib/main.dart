import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<String> brands = ['Brand A', 'Brand B', 'Brand C'];
  final List<String> models = ['Sedan', 'Model 2', 'Model 3'];
  final List<String> colors = ['Red', 'Blue', 'Green'];
  final List<int> years = [2020, 2021, 2022];
  final List<String> fuels = ['Petrol', 'Diesel', 'Electric'];
  final List<String> transmissions = ['Automatic', 'Manual'];

  String selectedBrand = 'Brand A';
  String selectedModel = 'Model 1';
  String selectedColor = 'Red';
  int selectedYear = 2020;
  String selectedFuel = 'Petrol';
  String selectedTransmission = 'Automatic';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Advanced Car Selector',
      theme: ThemeData(
        primaryColor: Colors.white,
        hintColor: Colors.white,
        fontFamily: 'Roboto',
      ),
      home: Scaffold(
        /*appBar: AppBar(
          title: Text('Advanced Car Selector'),
          backgroundColor: Colors.black,
        ),*/
        body: Stack(
          children: [
            Container(
              color: Color.fromARGB(255, 13, 13, 13),
            ),
            Center(
              child: Image.asset(
                'assets/car_image.png', // Replace with your transparent image asset path
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 100),
                  _buildDropdown('Brand', brands, selectedBrand),
                  SizedBox(height: 20),
                  _buildDropdown('Model', models, selectedModel),
                  SizedBox(height: 20),
                  _buildDropdown('Color', colors, selectedColor),
                  SizedBox(height: 20),
                  _buildDropdown('Year', years.map((year) => year.toString()).toList(), selectedYear.toString()),
                  SizedBox(height: 20),
                  _buildDropdown('Fuel', fuels, selectedFuel),
                  SizedBox(height: 20),
                  _buildDropdown('Transmission', transmissions, selectedTransmission),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Implement action to perform when button is pressed
                    },
                    child: Text('Predict'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, List<String> items, String value) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      dropdownColor: Colors.black,
      value: value,
      onChanged: (newValue) {
        // Implement your logic here when a dropdown item is selected
      },
      items: items.map<DropdownMenuItem<String>>((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(
            item,
            style: TextStyle(color: Colors.white),
          ),
        );
      }).toList(),
    );
  }
}
