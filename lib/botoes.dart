import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Botoes extends StatefulWidget {
  final void Function(String s) funcao;
  final String tecla;
  final String numerodobotao;
  const Botoes(this.funcao, this.tecla, this.numerodobotao, {Key? key})
      : super(key: key);

  @override
  _BotoesState createState() => _BotoesState();
}

class _BotoesState extends State<Botoes> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.funcao(widget.tecla),
      child: Text(widget.numerodobotao, style: const TextStyle(fontSize: 48)),
    );
  }
}
