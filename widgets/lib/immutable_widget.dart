import 'package:flutter/material.dart';

class ImmutableWidget extends StatelessWidget{
  const ImmutableWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Transform.rotate(angle: 0.80,
      child: Padding(
        padding: const EdgeInsets.all(80),
        child: Container(
          decoration:
          BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(30),
            boxShadow: const [
              BoxShadow(blurRadius: 20),
              ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(50.0),
             child:_buildShinyCircle(),
          ),
        ),
      ),
      ),
    );
  }
  Widget _buildShinyCircle() {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            Colors.lightBlueAccent,
            Colors.blueAccent,
          ],
          center: Alignment(-0.3, -0.5),
        ),
        boxShadow: [
          BoxShadow(blurRadius: 20),
        ],
      ),
    );
  }
}
