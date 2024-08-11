import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _nextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _skip() {
    _pageController.jumpToPage(3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: [
                  _buildPage('Welcome to Hanuven!', 'assets/onboarding_images/Illustration.png'),
                  _buildPage('Products that have been thoroughly tested and verified', 'assets/onboarding_images/Illustration.png'),
                  _buildPage('Scan the product to verify if it\s genuine', 'assets/onboarding_images/Illustration.png'),
                ],
              ),

            ),
                        SizedBox(height: 20), // Space between PageView and paginator
                        SmoothPageIndicator(
                          controller: _pageController,
                          count: 3, // Number of pages
                          effect: ExpandingDotsEffect(
                            dotColor: Theme.of(context).colorScheme.primary,
                            activeDotColor: Theme.of(context).colorScheme.primary,
                            dotHeight: 8,
                            dotWidth: 8
                          )
                        ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: _skip,
                    child: Text('Skip'),
                  ),
                  _currentPage < 2
                      ? TextButton(
                    onPressed: _nextPage,
                    child: Text('Next'),
                  )
                      : TextButton(
                    onPressed: _skip, // or navigate to another screen
                    child: Text('Get Started'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(String title, String imagePath) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imagePath,
          width: 300,
          height: 300,
        ),
        SizedBox(height: 20),
        Text(
          title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
