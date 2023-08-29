import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TelaInicial();
  }
}

class TelaInicial extends StatefulWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String resultado = "";

  void _calcularIMC() {
    double peso = double.tryParse(pesoController.text) ?? 0;
    double altura = double.tryParse(alturaController.text) ?? 0;

    double imc = peso / (altura * altura);

    setState(() {
      if (imc < 18.5) {
        resultado = "IMC: ${imc.toStringAsFixed(2)} - Abaixo do peso";
      } else if (imc < 24.9) {
        resultado = "IMC: ${imc.toStringAsFixed(2)} - Peso normal";
      } else if (imc < 29.9) {
        resultado = "IMC: ${imc.toStringAsFixed(2)} - Sobrepeso";
      } else if (imc < 34.9) {
        resultado = "IMC: ${imc.toStringAsFixed(2)} - Obesidade Grau I";
      } else if (imc < 39.9) {
        resultado = "IMC: ${imc.toStringAsFixed(2)} - Obesidade Grau II";
      } else {
        resultado = "IMC: ${imc.toStringAsFixed(2)} - Obesidade Grau III";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text("App Cálculo de IMC"),
          centerTitle: true,
        ),
        body: _body(),
      ),
    );
  }

  _body() {
    return Container(
      width: double.infinity,
      color: Colors.black,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _foto(),
          _campo(pesoController, "Digite o seu peso"),
          SizedBox(height: 10),
          _campo(alturaController, "Digite a sua altura"),
          SizedBox(height: 30),
          _button(),
          SizedBox(height: 10),
          _resultado(),
        ],
      ),
    );
  }

  _foto() {
    return Center(
      child: Image.network(
        'https://ajuda.treinus.com.br/hc/article_attachments/4409281851159/image.png',
        height: 150,
        width: 150,
      ),
    );
  }

  _campo(TextEditingController controller, String labelText) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.white),
      ),
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.white, fontSize: 25),
      controller: controller,
    );
  }

  _resultado() {
    return Text(
      resultado,
      style: TextStyle(color: Colors.white, fontSize: 20),
    );
  }

  _button() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
      ),
      onPressed: _calcularIMC,
      child: Text(
        "Calcular",
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
        ),
      ),
    );
  }
}