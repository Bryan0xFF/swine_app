import 'package:flutter/material.dart';

class UnderscreenMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      height: MediaQuery.of(context).size.height * 0.06,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Tooltip(
            message: 'Notificaciones',
            waitDuration: Duration(seconds: 2),
            child: IconButton(
              icon: Icon(
                Icons.add_alert_outlined,
                color: Theme.of(context).accentColor,
              ),
              onPressed: () {
                // Navigator.of(context)
                //     .pushReplacementNamed(DashboardScreen.routeName);
              },
            ),
          ),
          Tooltip(
            message: 'Otros (más)',
            waitDuration: Duration(seconds: 2),
            child: IconButton(
              icon: Icon(
                Icons.add,
                color: Theme.of(context).accentColor,
              ),
              onPressed: () {
                // Navigator.of(context)
                //     .pushReplacementNamed(AgendaScreen.routeName);
              },
            ),
          ),
          Tooltip(
            message: 'Fecha de Confirmación',
            waitDuration: Duration(seconds: 2),
            child: IconButton(
              icon: Icon(
                Icons.done_outline_outlined,
                color: Theme.of(context).accentColor,
              ),
              onPressed: () {
                // Navigator.of(context)
                //     .pushReplacementNamed(DocuSignScreen.routeName);
              },
            ),
          ),
          Tooltip(
            message: 'Cerrar Sesión',
            waitDuration: Duration(seconds: 2),
            child: IconButton(
              icon: Icon(
                Icons.logout,
                color: Theme.of(context).accentColor,
              ),
              onPressed: () {
                // Navigator.of(context)
                //     .pushReplacementNamed(DocuSignScreen.routeName);
              },
            ),
          ),
        ],
      ),
    );
  }
}
