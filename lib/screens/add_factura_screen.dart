import 'package:flutter/material.dart';
import 'package:swine_app/helpers/underscreen_menu.dart';
import 'dart:math';

import 'package:swine_app/models/facturas.dart';

class AddFacturaScreen extends StatefulWidget {
  static const routeName = '/add-factura';
  @override
  _AddFacturaScreenState createState() => _AddFacturaScreenState();
}

class _AddFacturaScreenState extends State<AddFacturaScreen> {
  final _key = GlobalKey<FormState>();
  final FocusNode _clientNode = FocusNode();
  final FocusNode _pesoNode = FocusNode();
  final FocusNode _precioNode = FocusNode();

  void _updateClient() {
    if (!_clientNode.hasFocus) {
      setState(() {});
    }
  }

  void _sendData() {
    _key.currentState.validate();
    Factura factura = Factura(
      id: 0,
      peso: double.parse(_values["Peso"]),
      precio: double.parse(_values["Precio"]),
      subtotal: double.parse(_values["Subtotal"]),
      cliente: _values["Cliente"],
      total: double.parse(_values["Total"]),
    );
    Facturas facturas = Facturas();
    facturas.addFactura(factura);
  }

  @override
  void initState() {
    _clientNode.addListener(_updateClient);
    super.initState();
  }

  @override
  void dispose() {
    _pesoNode.dispose();
    _precioNode.dispose();
    _clientNode.removeListener(_updateClient);
    super.dispose();
  }

  Map<String, String> _values = {
    "Cliente": "",
    "Peso": "",
    "Precio": "",
    "Subtotal": "",
    "Total": "",
  };

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Container(
                alignment: Alignment.center,
                width: width * 0.8,
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Cliente',
                    labelStyle: TextStyle(fontFamily: 'Raleway'),
                    contentPadding: EdgeInsets.all(0),
                  ),
                  focusNode: _clientNode,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter Value';
                    }
                    _values["Cliente"] = value;
                    return null;
                  },
                  onFieldSubmitted: (_) =>
                      FocusScope.of(context).requestFocus(_pesoNode),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Container(
                width: width * 0.8,
                child: TextFormField(
                  focusNode: _pesoNode,
                  decoration: InputDecoration(
                    labelText: 'Peso',
                    labelStyle: TextStyle(fontFamily: 'Raleway'),
                    contentPadding: EdgeInsets.all(0),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter Value';
                    }
                    _values["Peso"] = value;
                    return null;
                  },
                  onFieldSubmitted: (_) =>
                      FocusScope.of(context).requestFocus(_precioNode),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Container(
                width: width * 0.8,
                child: TextFormField(
                  focusNode: _precioNode,
                  decoration: InputDecoration(
                    labelText: 'Precio',
                    labelStyle: TextStyle(fontFamily: 'Raleway'),
                    contentPadding: EdgeInsets.all(0),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter Value';
                    }
                    _values["Precio"] = value;
                    _values["Subtotal"] =
                        '${double.parse(_values["Peso"]) * double.parse(_values["Precio"])}';
                    _values["Total"] =
                        '${double.parse(_values["Peso"]) * double.parse(_values["Precio"]) + (double.parse(_values["Peso"]) * double.parse(_values["Precio"]) * 0.12)}';
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              _values["Peso"] != ""
                  ? Text(
                      'Subtotal: ${_values["Subtotal"]}',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  : Text(
                      'Subtotal: 0',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              _values["Peso"] != ""
                  ? Text(
                      'Total: ${_values["Total"]}',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  : Text(
                      'Total: 0',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              TextButton.icon(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all(Theme.of(context).primaryColor),
                ),
                onPressed: _sendData,
                icon: Padding(
                  padding: EdgeInsets.only(bottom: height * 0.005),
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationZ(-pi / 4),
                    child: Icon(
                      Icons.send_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
                label: Text(
                  'Enviar Factura',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).textTheme.headline6.color,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(
                child: LimitedBox(),
              ),
              UnderscreenMenu(),
            ],
          ),
        ),
      ),
    );
  }
}
