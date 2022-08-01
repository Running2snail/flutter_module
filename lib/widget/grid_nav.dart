import 'package:flutter/cupertino.dart';
import 'package:flutter_module/model/grid_nav_model.dart';

class GridNav extends StatefulWidget {

  final GridNavModel gridNavModel;
  final String name;

  const GridNav({Key? key, required this.gridNavModel, required this.name}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _GridNavState();
    // TODO: implement createState
    throw UnimplementedError();
  }

}

class _GridNavState extends State<GridNav> {
  @override
  Widget build(BuildContext context) {
    return Text("data");
    // TODO: implement build
    throw UnimplementedError();
  }

}

