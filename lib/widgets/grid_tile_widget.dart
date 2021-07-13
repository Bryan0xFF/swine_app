import 'dart:math';

import 'package:flutter/material.dart';

class GridTileWidget extends StatelessWidget {
  final IconData iconItem;
  final String homeName;
  final String screenRouteName;
  GridTileWidget({this.iconItem, this.homeName, this.screenRouteName});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(screenRouteName),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: LimitedBox(
            maxHeight: height * 0.2,
            maxWidth: width * 0.2,
            child: homeName != 'Destete'
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        iconItem,
                        color: Theme.of(context).primaryColor,
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Text(
                        homeName,
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontStyle:
                              Theme.of(context).textTheme.headline6.fontStyle,
                        ),
                      ),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Transform(
                        child: Icon(
                          iconItem,
                          color: Theme.of(context).primaryColor,
                        ),
                        transform: Matrix4.rotationZ(-pi / 2),
                        alignment: Alignment.center,
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Text(
                        homeName,
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontStyle:
                              Theme.of(context).textTheme.headline6.fontStyle,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
