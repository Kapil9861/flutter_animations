import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class FirstTextAnimation extends StatefulWidget {
  const FirstTextAnimation({super.key});

  @override
  State<FirstTextAnimation> createState() => _FirstTextAnimationState();
}

class _FirstTextAnimationState extends State<FirstTextAnimation> {
  String getNextText(String current) {
    List<String> words = ["HUNGRY", "SHARP", "MOTIVATED"];
    int index = words.indexOf(current);
    return words[(index + 1) % words.length]; // Get next word in the list
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double top1 = 200;
    double top2 = 400;
    String animatedText = "HUNGRY"; // Initial text
    int textKey = 0;
    return Scaffold(
      body: SizedBox(
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              top: 70,
              child: Container(
                height: 100,
                margin: const EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.redAccent),
                child: Center(
                  child: DefaultTextStyle(
                    style: const TextStyle(fontSize: 30, color: Colors.white),
                    child: AnimatedTextKit(
                      repeatForever: false,
                      totalRepeatCount: 1,
                      animatedTexts: [
                        RotateAnimatedText(
                          "kapil aryal",
                          rotateOut: false,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              top: top1,
              child: Center(
                child: SizedBox(
                  width: width - 40,
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 30,
                      color: Colors.blue,
                      fontFamily: 'popin',
                    ),
                    child: AnimatedTextKit(
                      repeatForever: false,
                      totalRepeatCount: 1,
                      animatedTexts: [
                        TyperAnimatedText(
                          "Practice makes it easy to implement even the harder things",
                          speed: Duration(milliseconds: 100),
                        ),
                        TyperAnimatedText(
                          "You might get exhausted or tired but remember it helps you to be better not the company or others",
                          speed: Duration(milliseconds: 100),
                        ),
                        TyperAnimatedText(
                          "- Kapil Aryal",
                          speed: Duration(milliseconds: 100),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              top: top2,
              child: Container(
                height: 100,
                margin: const EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.redAccent,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 20),
                    Text(
                      "Stay",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    SizedBox(width: 20),
                    DefaultTextStyle(
                      style: TextStyle(fontSize: 30, color: Colors.white),
                      child: AnimatedSwitcher(
                        duration:
                            Duration(milliseconds: 300), // Smooth transition
                        child: AnimatedTextKit(
                          key: ValueKey(textKey), // Forces rebuild on update
                          onFinished: () {
                            // Update text dynamically
                            setState(() {
                              animatedText = getNextText(animatedText);
                              textKey++; // Change key to restart animation
                            });
                          },
                          repeatForever: false,
                          totalRepeatCount: 1,
                          animatedTexts: [
                            RotateAnimatedText(animatedText),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
