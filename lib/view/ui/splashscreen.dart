import 'package:flutter/material.dart';
import 'package:hb/view/constants/constant_images.dart';
import 'package:hb/view/constants/constant_integers.dart';
import 'package:hb/view/constants/constant_variables.dart';
import '../constants/constant_colors.dart';
import 'login.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  SplashPageScreen createState() => SplashPageScreen();
}

class SplashPageScreen extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  double containerPosition = ConstantIntegers.containerInitialPosition;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: ConstantIntegers.sliderAnimationSecond),
      vsync: this,
    )..repeat(reverse: true);

    animation = Tween<double>(
      begin: ConstantIntegers.animationBegin,
      end: ConstantIntegers.animationEnd,
    ).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void navigateToNextPage() {
    setState(() {
      containerPosition = ConstantIntegers.containerInitialPosition;
    });

    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [buildBackground(), buildContent(context)]),
    );
  }

  Widget buildBackground() {
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

  Widget buildContent(BuildContext context) {
    return Column(
      children: [
        buildIrixLogo(),
        const Spacer(),
        slidingContainer(),
        const SizedBox(
          height: ConstantIntegers.confirmationSliderSizedBoxWidth,
        ),
      ],
    );
  }

  Widget buildIrixLogo() {
    return Image.asset(
      '${ConstantImages.assetImages}${ConstantImages.iParkLogo}',
      height: ConstantIntegers.iParkLogoHeight,
      width: ConstantIntegers.iParkLogoWidth,
    );
  }

  Widget slidingContainer() {
    return Center(
      child: Container(
        height: ConstantIntegers.slidingContainerHeight,
        width: ConstantIntegers.slidingContainerWidth,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            ConstantIntegers.slidingContainerRadius,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedPositioned(
              duration: const Duration(
                milliseconds: ConstantIntegers.movingMilliseconds,
              ),
              left: containerPosition,
              child: GestureDetector(
                onPanUpdate: (details) {
                  setState(() {
                    containerPosition += details.delta.dx;
                    containerPosition = containerPosition.clamp(
                      ConstantIntegers.containerPositionStart,
                      ConstantIntegers.containerPositionEnd,
                    );
                  });
                },
                onPanEnd: (details) {
                  if (containerPosition >= ConstantIntegers.navigateIf) {
                    navigateToNextPage();
                  } else {
                    setState(() {
                      containerPosition = ConstantIntegers.navigateElse;
                    });
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(
                    ConstantIntegers.insideContainerSliderPadding,
                  ),
                  margin: const EdgeInsets.only(
                    left: ConstantIntegers.insideContainerSliderMargin,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(
                      ConstantIntegers.insideContainerSliderRadius,
                    ),
                  ),
                  height: ConstantIntegers.insideContainerSliderHeight,
                  child: Row(
                    children: [
                      Image.asset(
                        '${ConstantImages.assetImages}${ConstantImages.slideButtonCarLogo}',
                      ),
                      const SizedBox(width: ConstantIntegers.spaceImageText),
                      const Text(
                        ConstantVariables.getStartedText,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: ConstantIntegers.textPosition,
              child: AnimatedBuilder(
                animation: animation,
                builder: (context, child) {
                  return containerPosition > ConstantIntegers.containerHide
                      ? const SizedBox.shrink()
                      : ShaderMask(
                        shaderCallback: (bounds) {
                          return LinearGradient(
                            colors: [Colors.white, Colors.grey.shade900],
                            begin: Alignment(
                              -1 +
                                  animation.value *
                                      ConstantIntegers.animationValueBegin1,
                              ConstantIntegers.animationValueBegin2,
                            ),
                            end: Alignment(
                              1 +
                                  animation.value *
                                      ConstantIntegers.animationValueEnd1,
                              ConstantIntegers.animationValueEnd2,
                            ),
                          ).createShader(bounds);
                        },
                        child: const Text(
                          ConstantVariables.forward,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: ConstantIntegers.forwardFontSize,
                            letterSpacing:
                            ConstantIntegers.forwardLetterSpacing,
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
