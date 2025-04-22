import 'package:flutter/material.dart';
import 'package:hb/view/constants/constant_variables.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Feedback',
          style: TextStyle(
            color: Colors.white,
            fontFamily: ConstantVariables.fontFamilyPoppins,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.black,
      ),
      body: Scrollbar(
        thumbVisibility: true,
        thickness: 1.0,
        radius: Radius.circular(16),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Center(
                  child: Text(
                    'How was your experience?',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      fontFamily: ConstantVariables.fontFamilyPoppins,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    'Your Feedback is valuable in helping us better understand your needs and tailor our service accordingly.',
                    style: TextStyle(
                      fontFamily: ConstantVariables.fontFamilyPoppins,
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FeedbackOption(
                      imagePath: 'assets/images/angry emoji.png',
                      label: 'Angry',
                    ),
                    FeedbackOption(
                      imagePath: 'assets/images/sad.png',
                      label: 'Not Satisfied',
                    ),
                    FeedbackOption(
                      imagePath: 'assets/images/satisfied.png',
                      label: 'Satisfied',
                    ),
                    FeedbackOption(
                      imagePath: 'assets/images/lovedIt.png',
                      label: 'Loved it',
                    ),
                  ],
                ),
                SizedBox(height: 30),
                TextField(
                  maxLines: 10,
                  decoration: InputDecoration(
                    hintText: 'Write your feedback here...',
                    hintStyle: TextStyle(
                      fontFamily: ConstantVariables.fontFamilyPoppins,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Center(
                  child: SizedBox(
                    width: 317,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 15,
                        ),
                        textStyle: TextStyle(fontSize: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          fontFamily: ConstantVariables.fontFamilyPoppins,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
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
  double scale = 1.0;

  void onTapDown(TapDownDetails details) {
    setState(() {
      scale = 1.2;
    });
  }

  void onTapUp(TapUpDetails details) {
    setState(() {
      scale = 1.0;
    });
  }

  void onTapCancel() {
    setState(() {
      scale = 1.0;
    });
  }

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
            duration: Duration(milliseconds: 200),
            child: Image.asset(widget.imagePath, height: 79, width: 79),
          ),
          SizedBox(height: 30),
          Text(
            widget.label,
            style: TextStyle(
              fontSize: 16,
              fontFamily: ConstantVariables.fontFamilyPoppins,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
