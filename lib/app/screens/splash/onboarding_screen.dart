import 'package:flutter/material.dart';

import '../../../auth/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<OnboardingPage> pages = [
    OnboardingPage(
      title: 'Easy Getting Laundry',
      description: 'Simplifying your laundry routine has never been this easy.',
      image: 'assets/images/splash_images/slider1.png',
    ),
    OnboardingPage(
      title: 'Get Instant Notifications',
      description:
          'Never miss a beat—get notified and enjoy hassle-free service.',
      image: 'assets/images/splash_images/slider2.png',
    ),
    OnboardingPage(
      title: 'Delivery at your doorstep',
      description:
          'Just a tap away. Schedule your delivery and we\'ll handle the rest.',
      image: 'assets/images/splash_images/slider3.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: pages.length,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemBuilder: (context, index) {
                  return _buildPage(pages[index]);
                },
              ),
            ),
            _buildNavigationRow(),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(OnboardingPage page) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 7, // Adjust this value to control the image height ratio
          child: AspectRatio(
            aspectRatio:
                16 / 9, // Adjust this ratio to match your image aspect ratio
            child: Image.asset(
              page.image,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          flex: 3, // Adjust this value to control the text content height ratio
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  page.title,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  page.description,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        pages.length,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          height: 5.0,
          width: 12.0,
          decoration: BoxDecoration(
            color: _currentPage == index ? Colors.blue : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavigationButton(
            onTap: () {
              if (_currentPage > 0) {
                _pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            },
            icon: Icons.arrow_back,
            color: _currentPage > 0 ? Colors.grey[100]! : Colors.transparent,
          ),
          Expanded(
            child: _buildPageIndicator(),
          ),
          _buildNavigationButton(
            onTap: () {
              if (_currentPage < pages.length - 1) {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              } else {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              }
            },
            icon: Icons.arrow_forward,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationButton({
    required VoidCallback onTap,
    required IconData icon,
    required Color color,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          boxShadow: [
            if (color != Colors.transparent)
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
          ],
        ),
        child: Icon(
          icon,
          color: color == Colors.blue
              ? Colors.white
              : _currentPage == 0
                  ? Colors.transparent
                  : Colors.grey,
        ),
      ),
    );
  }
}

class OnboardingPage {
  final String title;
  final String description;
  final String image;

  OnboardingPage({
    required this.title,
    required this.description,
    required this.image,
  });
}
