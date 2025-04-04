import 'package:driver/ui/page/home/home_controller.dart';
import 'package:driver/ui/page/login/login_controller.dart';
import 'package:provider/provider.dart' show ChangeNotifierProvider;
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers() => [
  ChangeNotifierProvider(create: (_) => HomeController()),
  ChangeNotifierProvider(create: (_) => LoginController()),
];