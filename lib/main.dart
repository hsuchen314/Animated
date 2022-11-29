import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Animated Example';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}


class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  double padValue = 0.0;
  void _updatePadding(double value) {
    setState(() {
      padValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AnimatedPadding(
          padding: EdgeInsets.all(padValue),
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const <Widget>[
                  Icon(
                      Icons.airplanemode_active,
                      color: Colors.blue,
                      size: 80.0,
                  ),
                ],
            ),
        ),
        Text('Padding: $padValue'),
        ElevatedButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
               children: const [Icon(Icons.airplanemode_active),Text('起飛'),],
            ),
            onPressed: () {
              _updatePadding(padValue == 0.0 ? 100.0 : 0.0);
            }),
      ],
    );
  }
}
