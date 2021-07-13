import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'dart:convert' as convert;

class Factura {
  final int id;
  final double peso;
  final double precio;
  final double subtotal;
  final String cliente;
  final double total;

  Factura({
    @required this.id,
    @required this.peso,
    @required this.precio,
    @required this.subtotal,
    @required this.cliente,
    @required this.total,
  });

  factory Factura.fromJson(Map<String, dynamic> map) {
    return Factura(
      id: map["NumFactura"],
      peso: double.parse(map["Peso"].toString()),
      cliente: map["Cliente"],
      precio: double.parse(map["Precio"].toString()),
      subtotal: double.parse(map["Subtotal"].toString()),
      total: double.parse(map["Total"].toString()),
    );
  }
}

class Facturas extends ChangeNotifier {
  Future<List<Factura>> getFacturas() async {
    List<Factura> facturas = [];
    var uri =
        Uri.parse("https://analysistestproyect.ue.r.appspot.com/facturas");
    var response = await http.Client().get(uri);

    if (response.statusCode >= 400) {
      return null;
    } else {
      final List<dynamic> json = convert.jsonDecode(response.body);

      for (int i = 0; i < json[0].length; i++) {
        facturas.add(Factura.fromJson(json[0][i]));
        print(facturas[i]);
      }
      return facturas;
    }
  }

  Future<bool> addFactura(Factura factura) async {
    var uri =
        Uri.parse("https://analysistestproyect.ue.r.appspot.com/facturas/add");

    var body = {
      "Cliente": factura.cliente,
      "Peso": factura.peso,
      "Precio": factura.precio,
      "Subtotal": factura.subtotal,
      "Total": factura.total,
    };

    final jsonData = convert.jsonEncode(body);

    var response = await http.Client().post(
      uri,
      body: jsonData,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode >= 400) {
      return false;
    } else {
      notifyListeners();
      return true;
    }
  }
}
