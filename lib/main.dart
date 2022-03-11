import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'visordacalc.dart';
import 'botoes.dart';

void main() {
  runApp(const MaterialApp(home: Calculadora()));
}

class Calculadora extends StatefulWidget {
  const Calculadora({Key? key}) : super(key: key);

  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String numero = '';
  double primeiroNumero = 0;
  String operacao = '';

  void calcular(String tecla) {
    switch (tecla) {
      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
      case ',':
        setState(() {
          numero += tecla;
        });
        break;

      case '+':
      case '-':
      case 'X':
      case '/':
        operacao = tecla;
        numero = numero.replaceAll(',', '.');
        primeiroNumero = double.parse(numero);
        numero = '';
        break;

      case '=':
        double resultado = 0;

        if (operacao == '') {
          return;
        }

        if (operacao == '+') {
          numero = numero.replaceAll(',', '.');
          resultado = primeiroNumero + double.parse(numero);
          operacao = '';
        }

        if (operacao == '-') {
          numero = numero.replaceAll(',', '.');
          resultado = primeiroNumero - double.parse(numero);
          operacao = '';
        }

        if (operacao == 'X') {
          numero = numero.replaceAll(',', '.');
          resultado = primeiroNumero * double.parse(numero);
          operacao = '';
        }

        if (operacao == '/') {
          if (double.parse(numero) * 1 == 0) {
            setState(() {
              print(numero = "ERRO: divisão por zero");
            });
            numero = primeiroNumero.toString();
          } else {
            numero = numero.replaceAll(',', '.');
            resultado = primeiroNumero / double.parse(numero);
            operacao = '';
          }
        }

        String resultadoString = resultado.toString();

        List<String> resultadoPartes = resultadoString.split('.');
        // 3         .     0
        // parte1 = 3, parte 2 = 0
        print(resultadoPartes);

        if (int.parse(resultadoPartes[1] * 1) == 0) {
          // print('parte fracionária zero'); Converteu a posição 1 da Lista, multiplicou por 1 e comparou se é igual a 0, ou seja se for igual a 0 é porque é um número inteiro...
          setState(() {
            numero = resultadoPartes[0].toString();
            // aqui o número recebe a posição [0], (que é o número(s) antes do .) e converte para String e coloca na variável numero.
          });
        } else {
          setState(() {
            numero = resultado.toString();
            numero = numero.replaceAll('.', ',');
          });
        }

        if (resultado == 0) {
          setState(() {
            log(numero = "ERRO: divisão por zero");
          });
        }

        break;

      case 'AC':
        setState(() {
          numero = '';
        });
        break;

      case '<X':
        // 35      3
        // 35.1
        setState(() {
          if (numero.isNotEmpty) {
            numero = numero.substring(0, numero.length - 1);
          }
        });

        break;

      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Calculadora')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VisordaCalc(numero),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Botoes(calcular, 'AC', 'AC'),
              const Text('', style: TextStyle(fontSize: 48)),
              const Text('', style: TextStyle(fontSize: 48)),
              Botoes(calcular, '<X', '<X'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Botoes(calcular, '7', '7'),
              Botoes(calcular, '8', '8'),
              Botoes(calcular, '9', '9'),
              Botoes(calcular, '/', '/'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Botoes(calcular, '4', '4'),
              Botoes(calcular, '5', '5'),
              Botoes(calcular, '6', '6'),
              Botoes(calcular, 'X', 'X'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Botoes(calcular, '1', '1'),
              Botoes(calcular, '2', '2'),
              Botoes(calcular, '3', '3'),
              Botoes(calcular, '-', '-'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Botoes(calcular, '0', '0'),
              Botoes(calcular, ',', ','),
              Botoes(calcular, '=', '='),
              Botoes(calcular, '+', '+'),
            ],
          ),
          const Text('Coluna 6'),
        ],
      ),
    );
  }
}
