import 'package:flutter/material.dart';

class Sandbox extends StatefulWidget {
  const Sandbox({Key? key}) : super(key: key);

  @override
  State<Sandbox> createState() => _SandboxState();
}

class _SandboxState extends State<Sandbox> {
  double _opacity = 1;
  double _margin = 20;
  double _width = 200;
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AnimatedContainer(
          duration: Duration(seconds: 1),
          margin: EdgeInsets.all(_margin),
          width: _width,
          color: _color,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // {} this SQUARED Bracket is the same as  this => .....This is known as the fat arrow
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _margin = 70;
                  });
                },
                child: Text('Animatess Margin'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _color = Colors.green;
                  });
                },
                child: Text('Animate Color'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _width = 400;
                  });
                },
                child: Text('Animate Width'),
              ),
              // Animated Container doesn't have an opacity property so we have to Write out the Animated Opacity separately.
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _opacity = 0;
                  });
                },
                child: Text('Animate Opacity'),
              ),
              AnimatedOpacity(
                opacity: _opacity,
                duration: Duration(seconds: 2),
                child: Text(
                  'Hide Me',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
