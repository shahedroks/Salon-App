import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class PieChat extends StatefulWidget {
  const PieChat({super.key});

  @override
  State<PieChat> createState() => _PieChatState();
}

class _PieChatState extends State<PieChat> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final heigth = size.height;
    final width = size.width;
    return Stack(
      children: [
        Container(
          alignment: Alignment.topLeft,
          height: heigth * 0.22,
          width: width * 0.99,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: width * 0.43,
                child: SfRadialGauge(
                  axes: <RadialAxis>[
                    RadialAxis(
                      minimum: 0,
                      maximum: 150,
                      ranges: <GaugeRange>[
                        GaugeRange(
                          startValue: 0,
                          endValue: 50,
                          color: Colors.green,
                        ),
                        GaugeRange(
                          startValue: 50,
                          endValue: 100,
                          color: Colors.orange,
                        ),
                        GaugeRange(
                          startValue: 100,
                          endValue: 150,
                          color: Colors.red,
                        ),
                      ],
                      pointers: <GaugePointer>[NeedlePointer(value: 90)],
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                          widget: Container(
                            child: Text(
                              '90.0 \n Protein',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          angle: 90,
                          positionFactor: 0.5,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Rotated Divider
            ],
          ),
        ),
        Positioned(
          top: 10,
          left: 200,
          child: InfographicSection(
            color: Colors.blue,
            icon: Icons.add,
            text: "Protein",
            width: width * 0.51,
          ),
        ),
        Positioned(
          top: 0,
          left: 170,
          child: CircleAvater(text: "100%", color: Colors.blue),
        ),
        Positioned(
          top: 45,
          left: 220,
          child: InfographicSection(
            color: Colors.red,
            icon: Icons.add,
            text: "Fat",
            width: width * 0.46,
          ),
        ),
        Positioned(
          top: 35,
          left: 190,
          child: CircleAvater(text: "100%", color: Colors.red),
        ),
        Positioned(
          top: 82,
          left: 230,
          child: InfographicSection(
            color: Colors.green,
            icon: Icons.add,
            text: "Carbohydrates",
            width: width * 0.437,
          ),
        ),
        Positioned(
          top: 72,
          left: 200,
          child: CircleAvater(text: "100%", color: Colors.green),
        ),
        Positioned(
          top: 119,
          left: 228,
          child: InfographicSection(
            color: Colors.orange,
            icon: Icons.add,
            text: "Fiber",
            width: width * 0.44,
          ),
        ),
        Positioned(
          top: 109,
          left: 198,
          child: CircleAvater(text: "100%", color: Colors.orange),
        ),
        Positioned(
          top: 156,
          left: 215,
          child: InfographicSection(
            color: Colors.deepPurpleAccent,
            icon: Icons.add,
            text: "Sugar",
            width: width * 0.465,
          ),
        ),
        Positioned(
          top: 146,
          left: 185,
          child: CircleAvater(text: "100%", color: Colors.deepPurpleAccent),
        ),
      ],
    );
  }
}

class CircleAvater extends StatelessWidget {
  String text;
  Color color;
  CircleAvater({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 17,
      backgroundColor: color,
      child: CircleAvatar(
        radius: 15,
        child: Text("$text", style: TextStyle(fontSize: 12)),
      ),
    );
  }
}

class InfographicSection extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;
  final double width;

  InfographicSection({
    required this.color,
    required this.icon,
    required this.text,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final heigth = size.height;

    return Stack(
      children: [
        Container(
          height: heigth * 0.015,
          width: width,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            children: [
              SizedBox(width: 6),
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(color: Colors.white, fontSize: 9),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
