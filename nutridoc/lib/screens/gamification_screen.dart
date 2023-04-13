import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class GamificationScreen extends StatefulWidget {
  static const String routeName = '/game';
  GamificationScreen({super.key});

  final List<Widget> fortuneOptions = <Widget>[
    const Text('Free day'),
    const Text('30%  at The Olympic Gym'),
    const Text('1 day free Spa access'),
    const Text('15% percent voucher JD Sports'),
    const Text('Try Again'),
    const Text('No Luck'),
  ];

  @override
  State<GamificationScreen> createState() => _GamificationScreenState();
}

class _GamificationScreenState extends State<GamificationScreen> {
  StreamController<int> selected = StreamController<int>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: FortuneWheel(
              indicators: const <FortuneIndicator>[
                FortuneIndicator(
                  alignment: Alignment.topCenter,
                  child: TriangleIndicator(
                    color: Color.fromRGBO(241, 117, 95, 1),
                  ),
                )
              ],
              selected: selected.stream,
              items: widget.fortuneOptions
                  .map(
                    (option) => FortuneItem(
                      child: option,
                      style: const FortuneItemStyle(
                        color: Color.fromRGBO(
                            1, 72, 65, 1), // <-- custom circle slice fill color
                        borderColor: Color.fromRGBO(1, 72, 65,
                            1), // <-- custom circle slice stroke color
                        borderWidth: 3, // <-- custom circle slice stroke width
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(241, 117, 95, 1),
            ),
            onPressed: () => setState(() => selected
                .add(Fortune.randomInt(0, widget.fortuneOptions.length))),
            child: const Text('Spin'),
          )
        ],
      ),
    );
  }
}
