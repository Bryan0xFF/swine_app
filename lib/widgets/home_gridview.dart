import 'package:flutter/material.dart';
import 'package:swine_app/screens/add_factura_screen.dart';
import 'package:swine_app/screens/facturas_screen.dart';

import './grid_tile_widget.dart';

class HomeGridView extends StatelessWidget {
  final List<IconData> _homeIcons = [
    Icons.analytics_outlined,
    Icons.add_box_outlined,
    Icons.logout,
    Icons.date_range,
    Icons.autorenew_outlined,
    Icons.cancel_outlined
  ];

  final _homeTexts = [
    'Ver Facturas',
    'Agregar Facturas',
    'Destete',
    'Proyección de Partos',
    'Ficha Hembra',
    'Ingreso de Reemplazos',
    'Dar de Baja'
  ];

  final _screenPaths = [
    FacturasScreen.routeName,
    AddFacturaScreen.routeName,
    FacturasScreen.routeName,
    AddFacturaScreen.routeName,
    FacturasScreen.routeName,
    AddFacturaScreen.routeName,
    FacturasScreen.routeName,
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: _homeIcons.length,
      itemBuilder: (context, index) {
        return GridTileWidget(
          iconItem: _homeIcons[index],
          homeName: _homeTexts[index],
          screenRouteName: _screenPaths[index],
        );
      },
    );
  }
}
