import 'package:flutter/material.dart';

class TweenAnimation2 extends StatefulWidget {
  const TweenAnimation2({Key? key}) : super(key: key);

  @override
  State<TweenAnimation2> createState() => _TweenAnimation2State();
}

class _TweenAnimation2State extends State<TweenAnimation2> {
  // You create a function that opacity can use and at the end after setstate it can be updated to a new value.
  double customOpacity = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TweenAnimationBuilder(
                  curve: Curves.bounceOut,
                  onEnd: () {
                    setState(() {
                      customOpacity = 1;
                    });
                  },
                  tween: Tween<double>(begin: 30, end: 100),
                  duration: Duration(milliseconds: 300),
                  builder: (context, value, child) {
                    return Icon(
                      Icons.flash_on_rounded,
                      size: value,
                      color: Colors.red,
                    );
                  },
                ),

                // In other to Animate the text widget you have to wrap it with an Animated Opacity and then ask for it's opacity.If you want the text to animate at the end of the Icon, you add the property onEnd in TweenAnimationBuilder.
                AnimatedOpacity(
                  opacity: customOpacity,
                  duration: Duration(seconds: 1),
                  child: Text(
                    'Energizer',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
