import 'package:component/widget/widget_button.dart';
import 'package:component/widget/widget_container.dart';
import 'package:component/widget/widget_scaffold.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const route = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return WidgetScaffold(
      appBar: false,
      margin: 0.0,
      child: Column(children: [Map(), WidgetButton(text: "Buttonn", onPressed: () {})]),
    );
  }
}

class Map extends StatelessWidget {
  const Map({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetContainer(
      width: double.infinity,
      height: 300,
      color: Colors.red,
      child: Text("Mapa"),
    );
  }
}
