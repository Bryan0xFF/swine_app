import 'package:flutter/material.dart';
import 'package:swine_app/models/facturas.dart';
import 'package:swine_app/helpers/underscreen_menu.dart';
import 'package:provider/provider.dart';

class FacturasScreen extends StatefulWidget {
  static const routeName = '/facturas';
  @override
  _FacturasScreenState createState() => _FacturasScreenState();
}

class _FacturasScreenState extends State<FacturasScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final getFacturas = Provider.of<Facturas>(context).getFacturas();

    return Scaffold(
      body: Container(
        height: height,
        child: Column(
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
            FutureBuilder(
              future: getFacturas,
              builder: (ctx, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Expanded(
                    child: Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                    ),
                  );
                } else {
                  return Container(
                    height: height * 0.76,
                    child: ListView.separated(
                      itemCount: snapshot.data.length,
                      separatorBuilder: (context, index) => Divider(
                        indent: width * 0.04,
                        endIndent: width * 0.04,
                        color: Colors.grey,
                      ),
                      itemBuilder: (context, index) => Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: width * 0.84,
                          height: height * 0.34,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Número Factura: ${snapshot.data[index].id.toString()}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .color,
                                ),
                              ),
                              Text(
                                'Cliente: ${snapshot.data[index].cliente}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .color,
                                ),
                              ),
                              Text(
                                'Peso: ${snapshot.data[index].peso.toString()}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .color,
                                ),
                              ),
                              Text(
                                'Precio: ${snapshot.data[index].precio.toString()}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .color,
                                ),
                              ),
                              Text(
                                'Subtotal: ${snapshot.data[index].subtotal.toString()}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .color,
                                ),
                              ),
                              Text(
                                'Total: ${snapshot.data[index].total.toString()}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .color,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            UnderscreenMenu()
          ],
        ),
      ),
    );
  }
}
