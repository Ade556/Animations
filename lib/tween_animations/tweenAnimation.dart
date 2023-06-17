import 'package:flutter/material.dart';

class TweenAnimations extends StatefulWidget {
  const TweenAnimations({Key? key}) : super(key: key);

  @override
  State<TweenAnimations> createState() => _TweenAnimationsState();
}

class _TweenAnimationsState extends State<TweenAnimations> {
  // I created a variable  named  animationEnd then i put it in a setState in other to update the values from the old gones to new.
  double animationEnd = 0.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder(
              onEnd: () {
                setState(() {
                  animationEnd = 1.0;
                });
              },
              curve: Curves.bounceInOut,
              tween: Tween<double>(begin: 100.0, end: 500.0),
              duration: Duration(seconds: 3),
              // Remove the Buildcontext but  leave the context there
              builder: (context, value, child) {
                return Container(
                  child: Center(
                    child: Image.asset(
                      'assets/images/Screenshot (9).png',
                      height: value,
                      width: value,
                    ),
                  ),
                );
              },
            ),
            AnimatedOpacity(
              opacity: animationEnd,
              duration: Duration(milliseconds: 500),
              child: Text(
                ' Hello Mobile Developer',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
