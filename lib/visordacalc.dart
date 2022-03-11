import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class VisordaCalc extends StatefulWidget {
  final String numero;
  const VisordaCalc(this.numero, {Key? key}) : super(key: key);

  @override
  _VisordaCalcState createState() => _VisordaCalcState();
}

class _VisordaCalcState extends State<VisordaCalc> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          widget.numero,
          style: const TextStyle(fontSize: 48),
        ),
      ],
    );
  }
}
