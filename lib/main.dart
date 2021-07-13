import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swine_app/models/facturas.dart';
import 'package:swine_app/screens/add_factura_screen.dart';
import 'package:swine_app/screens/facturas_screen.dart';
import 'dart:io' as IO;
import './screens/home_screen.dart';

void main() => runApp(SwineApp());

class SwineApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Facturas(),
      child: IO.Platform.isAndroid
          ? MaterialApp(
              title: 'Swine App',
              theme: ThemeData(
                primaryColor: Colors.pink[500],
                accentColor: Colors.grey[50],
                appBarTheme: AppBarTheme(
                  backgroundColor: Color.fromRGBO(105, 105, 105, 1),
                ),
                textTheme: TextTheme(
                  headline6: TextStyle(color: Colors.white),
                ),
              ),
              home: HomeScreen(),
              routes: {
                FacturasScreen.routeName: (ctx) => FacturasScreen(),
                AddFacturaScreen.routeName: (ctx) => AddFacturaScreen()
              },
            )
          : CupertinoApp(),
    );
  }
}
