import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_final/config/themeConfig.dart';
import 'package:real_final/models/soap/soapMng.dart';
import 'package:real_final/screens/menu/index.dart';
import 'package:real_final/screens/work/soap.dart';
import 'package:real_final/config/menuMng.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => soapMng()),
        ChangeNotifierProvider(create: (_) => themeData()),

      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        routes: {
          '/index': (context) => IndexScreen(),
          menu.soap: (context) => SoapWorkspace(),
        },
        initialRoute: '/index',
      ),
    );
  }
}