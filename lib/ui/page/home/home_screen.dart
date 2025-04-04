import 'package:component/widget/widget_button.dart';
import 'package:component/widget/widget_container.dart';
import 'package:component/widget/widget_icon.dart';
import 'package:component/widget/widget_map.dart';
import 'package:component/widget/widget_scaffold.dart';
import 'package:component/widget/widget_text_sub_title.dart';
import 'package:component/widget/widget_text_title.dart';
import 'package:driver/ui/page/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const route = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context.read<HomeController>().initHome();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const WidgetScaffold(
      appBar: false,
      margin: 0,
      child: Stack(children: [Map(), InfoDriver()]),
    );
  }
}

class Map extends StatelessWidget {
  const Map({super.key});

  @override
  Widget build(BuildContext context) {
    return context.watch<HomeController>().mapPosition != null
        ? WidgetMap(
          latitudeInitial: context.watch<HomeController>().mapPosition!.latitude,
          longitudeInitial: context.watch<HomeController>().mapPosition!.longitude,
          googleMapController: context.read<HomeController>().initMapController,
      markers: context.watch<HomeController>().markers

        )
        : Container();
  }
}

class InfoDriver extends StatelessWidget {
  const InfoDriver({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: WidgetContainer(
            width: double.infinity,
            height: context.read<HomeController>().isOpenCard ? 200 : 50,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(child: WidgetTextTitle(title: "Información del viaje")),
                    InkWell(
                      onTap: () {
                        print('ronny ingreso 1');
                        context.read<HomeController>().isOpenCard =
                            !context.read<HomeController>().isOpenCard;
                      },
                      child: WidgetIcon(
                        icon:
                            context.read<HomeController>().isOpenCard
                                ? FontAwesomeIcons.circleChevronDown
                                : FontAwesomeIcons.circleChevronUp,
                      ),
                    ),
                  ],
                ),

                Visibility(
                  visible: context.watch<HomeController>().isOpenCard,
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: Column(
                      spacing: 10,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Row(
                              spacing: 10,
                              children: [
                                WidgetContainer(
                                  radius: 50,
                                  child: WidgetIcon(icon: Icons.person, size: 25),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    WidgetTextTitle(title: "Ronny Contento"),
                                    WidgetTextTitle(title: "Chofer"),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              spacing: 5,
                              children: [
                                WidgetContainer(
                                  radius: 50,
                                  child: WidgetIcon(
                                    icon: FontAwesomeIcons.phone,
                                    size: 15,
                                  ),
                                ),
                                WidgetContainer(
                                  radius: 50,
                                  child: WidgetIcon(icon: FontAwesomeIcons.car, size: 15),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            WidgetTextSubTitle(title: "Fecha y Hora"),
                            WidgetTextSubTitle(title: "Vie 4 Abr 1:00 pm"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            WidgetTextSubTitle(title: "Tiempo de viaje"),
                            WidgetTextSubTitle(title: "1:50 min"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            WidgetTextSubTitle(title: "Velocidad"),
                            WidgetTextSubTitle(title: "30 km"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
          child: WidgetButton(text: 'Finalizar viaje', onPressed: () {}),
        ),
      ],
    );
  }
}
