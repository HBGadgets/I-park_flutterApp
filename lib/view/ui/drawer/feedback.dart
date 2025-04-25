import 'package:flutter/material.dart';
import 'package:hb/view/constants/constant_colors.dart';
import 'package:hb/view/constants/constant_images.dart';
import 'package:hb/view/constants/constant_integers.dart';
import 'package:hb/view/constants/constant_variables.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.feedbackScaffoldBackgroundColor,
      appBar: appBar(context),
      body: Scrollbar(
        thumbVisibility: true,
        thickness: ConstantIntegers.scrollbarThickness,
        radius: const Radius.circular(
          ConstantIntegers.scrollbarBorderCircularSize,
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(
            ConstantIntegers.singleChildScrollViewPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: ConstantIntegers.experienceTextAboveHeight,
              ),
              titleText(
                ConstantVariables.experienceText,
                ConstantIntegers.experienceTextFontSize,
              ),
              const SizedBox(
                height: ConstantIntegers.experienceTextBelowHeight,
              ),
              titleText(
                ConstantVariables.experienceServiceText,
                ConstantIntegers.experienceServiceTextFontSize,
                ConstantColors.experienceServiceTextColor,
              ),
              const SizedBox(
                height: ConstantIntegers.feedbackOptionAboveSizedBoxHeight,
              ),
              feedbackOptions(),
              const SizedBox(
                height: ConstantIntegers.feedbackTextFieldAboveSizedBoxHeight,
              ),
              feedbackTextField(),
              const SizedBox(
                height: ConstantIntegers.submitButtonAboveSizedBoxHeight,
              ),
              submitButton(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        ConstantVariables.appBarTitleText,
        style: const TextStyle(
          color: ConstantColors.feedbackAppBarColor,
          fontFamily: ConstantVariables.fontFamilyPoppins,
        ),
      ),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: ConstantColors.arrowBackColor,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.notifications,
            color: ConstantColors.notificationIconColor,
            size: ConstantIntegers.notificationIconSize,
          ),
          onPressed: () {},
        ),
      ],
      backgroundColor: ConstantColors.appbarBackgroundColor,
    );
  }

  Widget titleText(
    String text,
    double fontSize, [
    Color color = ConstantColors.titleTextColor,
  ]) {
    return Center(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          fontFamily: ConstantVariables.fontFamilyPoppinsBlack,
          color: color,
        ),
      ),
    );
  }

  Widget feedbackOptions() {
    final feedbackOptions = [
      ConstantImages.angryEmoji,
      ConstantImages.notSatisfiedEmoji,
      ConstantImages.satisfiedImage,
      ConstantImages.lovedEmoji,
    ];
    final labels = [
      ConstantVariables.angryLabelText,
      ConstantVariables.notSatisfiedLabelText,
      ConstantVariables.satisfiedLabelText,
      ConstantVariables.likeLabelText,
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(feedbackOptions.length, (index) {
        return FeedbackOption(
          imagePath: ConstantImages.assetImages + feedbackOptions[index],
          label: labels[index],
        );
      }),
    );
  }

  Widget feedbackTextField() {
    return TextField(
      maxLines: ConstantIntegers.feedbackTextFieldMaxLines,
      decoration: InputDecoration(
        hintText: ConstantVariables.textFieldHintText,
        hintStyle: const TextStyle(
          fontFamily: ConstantVariables.fontFamilyPoppins,fontSize: ConstantIntegers.feedbackTextFieldHintTextSize
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            ConstantIntegers.feedbackTextFieldCircularSize,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            ConstantIntegers.feedbackOutlineCircularSize,
          ),
          borderSide: const BorderSide(
            color: ConstantColors.feedbackTextFieldBorderColor,
          ),
        ),
      ),
    );
  }

  Widget submitButton() {
    return Center(
      child: SizedBox(
        width: ConstantIntegers.submitButtonWidth,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: ConstantColors.submitButtonBackgroundColor,
            padding: const EdgeInsets.symmetric(
              horizontal: ConstantIntegers.submitButtonSymmetricHorizontal,
              vertical: ConstantIntegers.submitButtonSymmetricVertical,
            ),
            textStyle: const TextStyle(fontSize: ConstantIntegers.submitTextFontSize),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(ConstantIntegers.submitButtonRoundedBorderSize),
            ),
          ),
          child: Text(
            ConstantVariables.submitButtonText,
            style: const TextStyle(
              fontFamily: ConstantVariables.fontFamilyPoppinsBlack,
              fontWeight: FontWeight.bold,
              color: ConstantColors.submitButtonTextColor,
            ),
          ),
        ),
      ),
    );
  }
}

class FeedbackOption extends StatefulWidget {
  final String imagePath;
  final String label;

  const FeedbackOption({
    super.key,
    required this.imagePath,
    required this.label,
  });

  @override
  FeedbackOptionState createState() => FeedbackOptionState();
}

class FeedbackOptionState extends State<FeedbackOption> {
  double scale = ConstantIntegers.feedbackOptionScale;
  void onTapDown(TapDownDetails details) => setState(() => scale = ConstantIntegers.onTapDownScale );
  void onTapUp(TapUpDetails details) => setState(() => scale = ConstantIntegers.onTapUpScale );
  void onTapCancel() => setState(() => scale = ConstantIntegers.onTapCancelScale);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      onTapCancel: onTapCancel,
      child: Column(
        children: [
          AnimatedScale(
            scale: scale,
            duration: const Duration(milliseconds: ConstantIntegers.animationEmojiDurationSec),
            child: Image.asset(widget.imagePath, height: ConstantIntegers.allImageHeight, width: ConstantIntegers.allImageWidth),
          ),
          const SizedBox(height: ConstantIntegers.feedbackAboveLabelHeight),
          Text(
            widget.label,
            style: const TextStyle(
              fontSize: ConstantIntegers.labelTextSize,
              fontFamily: ConstantVariables.fontFamilyPoppins,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
