import 'package:flutter/material.dart';
import 'package:hb/view/constants/constant_images.dart';
import 'package:hb/view/constants/constant_integers.dart';
import '../constants/constant_colors.dart';
import 'login.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  SplashPageScreen createState() => SplashPageScreen();
}

class SplashPageScreen extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  double _containerPosition = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _navigateToNextPage() {
    setState(() {
      _containerPosition = 0;
    });

    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [_buildBackground(), _buildContent(context)]),
    );
  }

  Widget _buildBackground() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            '${ConstantImages.assetImages}${ConstantImages.backgroundCarImage}',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              ConstantColors.backgroundGradientColor,
              ConstantColors.backgroundGradientTransparent,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      children: [
        _buildIrixLogo(),
        const Spacer(),
        _buildSlidingContainer(),
        const SizedBox(
          height: ConstantIntegers.confirmationSliderSizedBoxWidth,
        ),
      ],
    );
  }

  Widget _buildIrixLogo() {
    return Image.asset(
      '${ConstantImages.assetImages}${ConstantImages.iParkLogo}',
      height: ConstantIntegers.iParkLogoHeight,
      width: ConstantIntegers.iParkLogoWidth,
    );
  }

  Widget _buildSlidingContainer() {
    return Center(
      child: Container(
        height: 80,
        width: 290,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              left: _containerPosition,
              child: GestureDetector(
                onPanUpdate: (details) {
                  setState(() {
                    _containerPosition += details.delta.dx;
                    _containerPosition = _containerPosition.clamp(0.0, 100.0);
                  });
                },
                onPanEnd: (details) {
                  if (_containerPosition >= 100) {
                    _navigateToNextPage();
                  } else {
                    setState(() {
                      _containerPosition = 0;
                    });
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  margin: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  height: 52,
                  child: Row(
                    children: [
                      Image.asset("assets/images/irix.logo.png"),
                      const SizedBox(width: 10),
                      const Text(
                        "Get Started",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: 20,
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return _containerPosition > 0
                      ? const SizedBox.shrink()
                      : ShaderMask(
                        shaderCallback: (bounds) {
                          return LinearGradient(
                            colors: [Colors.white, Colors.grey.shade900],
                            begin: Alignment(-1 + _animation.value * 2, 0),
                            end: Alignment(1 + _animation.value * 2, 0),
                          ).createShader(bounds);
                        },
                        child: const Text(
                          ">>>>",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            letterSpacing: 4,
                          ),
                        ),
                      );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
