import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SwipeUIPage(),
    );
  }
}

class SwipeUIPage extends StatefulWidget {
  @override
  _SwipeUIPageState createState() => _SwipeUIPageState();
}

class _SwipeUIPageState extends State with SingleTickerProviderStateMixin {
  late PageController _pageController;
  late AnimationController _animationController;
  late Animation<double> _animation;

  final List<String> brandNames = [
    'Mercedes',
    'BMW',
    'Toyota',
    'Honda',
    'Audi',
    'Ford',
    'Chevrolet',
    'Tesla',
    'Volvo',
    'Lexus',
    'Hyundai',
    'Nissan',
    'Jeep',
    'Subaru',
    'Mazda',
    'Volkswagen',
    'Kia',
    'Ferrari',
    'Porsche',
    'Jaguar',
  ];

  // Mapping between brand names and image paths
  final Map<String, String> brandImages = {
    'Mercedes': 'assets/Mercedes.png',
    'BMW': 'assets/BMW.png',
    'Toyota': 'assets/Toyota.png',
    'Honda': 'assets/Honda.png',
    'Audi': 'assets/Audi.png',
    'Ford': 'assets/Ford.png',
    'Chevrolet': 'assets/Chevrolet.png',
    'Tesla': 'assets/Tesla.png',
    'Volvo': 'assets/Volvo.png',
    'Lexus': 'assets/Lexus.png',
    'Hyundai': 'assets/Hyundai.png',
    'Nissan': 'assets/Nissan.png',
    'Jeep': 'assets/Jeep.png',
    'Subaru': 'assets/Subaru.png',
    'Mazda': 'assets/Mazda.png',
    'Volkswagen': 'assets/Volkswagen.png',
    'Kia': 'assets/Kia.png',
    'Ferrari': 'assets/Ferrari.png',
    'Porsche': 'assets/Porsche.png',
    'Jaguar': 'assets/Jaguar.png',
  };

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 5000);
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Your Brand'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          height: 350,
          child: GestureDetector(
            onHorizontalDragEnd: (details) {
              if (details.primaryVelocity! < 0) {
                // Swiping towards left
                _pageController.nextPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              } else if (details.primaryVelocity! > 0) {
                // Swiping towards right
                _pageController.previousPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              }
            },
            child: PageView.builder(
              controller: _pageController,
              itemBuilder: (context, index) {
                final currentIndex = index % brandNames.length;
                return _buildPageContainer(
                  Colors.primaries[currentIndex % Colors.primaries.length],
                  brandNames[currentIndex], // Use specific brand names
                );
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FadeTransition(
        opacity: _animation,
        child: FloatingActionButton(
          onPressed: () {
            _pageController.nextPage(
              duration: Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          },
          child: Icon(Icons.arrow_forward),
        ),
      ),
    );
  }

  Widget _buildPageContainer(Color color, String text) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => EmptyPage()),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              brandImages[text]!,
              height: 100,
            ),
            SizedBox(height: 10),
            Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 24.0),
            ),
          ],
        ),
      ),
    );
  }
}

class EmptyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Empty Page'),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 16),
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
