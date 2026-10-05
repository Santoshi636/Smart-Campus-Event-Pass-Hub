import 'package:flutter/material.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // 1. Setup smooth entrance animations
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 7),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    _controller.forward();

    // 2. Auto-navigate to Home after 10 seconds
    Future.delayed(const Duration(seconds: 10), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,

        // Gradient Background
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF2E008B),
              Color(0xFF4A00E0),
              Color(0xFF8E2DE2),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: Stack(
          children: [
            // Decorative background glowing blur circles
            Positioned(
              top: -50,
              right: -50,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.08),
                ),
              ),
            ),

            Positioned(
              bottom: -80,
              left: -50,
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.05),
                ),
              ),
            ),

            // Center Content: Logo, Title, and Subtitle
            Center(
              child: FadeTransition(
                opacity: _fadeAnimation,

                child: ScaleTransition(
                  scale: _scaleAnimation,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      // Animated Glassmorphism Icon Container
                      Container(
                        padding: const EdgeInsets.all(24),

                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          shape: BoxShape.circle,

                          border: Border.all(
                            color: Colors.white.withOpacity(0.3),
                            width: 1.5,
                          ),

                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 25,
                              spreadRadius: 5,
                            ),
                          ],
                        ),

                        child: const Icon(
                          Icons.festival_rounded,
                          size: 70,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(height: 28),

                      // Main Title
                      const Text(
                        "Smart Campus Hub",

                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.1,
                        ),
                      ),

                      const SizedBox(height: 8),

                      // Subtitle / Tagline
                      Text(
                        "Discover & Register Campus Events Easily",

                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.8),
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      const SizedBox(height: 48),

                      // Custom Sleek Loader Bar
                      SizedBox(
                        width: 120,

                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),

                          child: const LinearProgressIndicator(
                            color: Colors.amberAccent,
                            backgroundColor: Colors.white24,
                            minHeight: 4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Footer Version Info
            Positioned(
              bottom: 30,
              left: 0,
              right: 0,

              child: Center(
                child: Text(
                  "v1.0.0 • Powered by Smart Campus",

                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
