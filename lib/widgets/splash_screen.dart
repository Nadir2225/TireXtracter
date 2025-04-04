import 'package:flutter/material.dart';
import 'package:lottie_tgs/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String message = '';
  bool _showMessage = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          _showMessage = true;
        });
      }
    });
  }

  void _onAnimationLoaded(LottieComposition composition) {
    setState(() {
      message = 'Animation loaded in ${composition.duration.inSeconds} ms';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(alignment: Alignment.center, children: [
          Align(
            heightFactor: 1.0,
            widthFactor: 1.0,
            child: Transform.scale(
              scale: 1.5, // 1.5x bigger
              child: Lottie.asset(
                'assets/animations/splash_screen.json',
                repeat: false,
                onLoaded: _onAnimationLoaded,
                // width: double.infinity,
                // height: double.infinity,
              ),
            ),
          ),
          Expanded(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 800),
              opacity: _showMessage ? 1.0 : 0.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TweenAnimationBuilder<double>(
                    duration: const Duration(milliseconds: 1200),
                    tween: Tween<double>(begin: 0, end: _showMessage ? 1 : 0),
                    curve: Curves.easeOutBack,
                    builder: (context, value, child) {
                      return Transform.scale(
                        scale: value,
                        child: const Text(
                          'TireXtract',
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 2,
                            shadows: [
                              Shadow(
                                color: Colors.black12,
                                offset: Offset(2, 2),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          )
        ]));
  }
}
