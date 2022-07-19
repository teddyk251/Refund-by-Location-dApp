import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:refund_by_location/pages/create_account.dart';
import 'package:refund_by_location/pages/register.dart';
import 'package:refund_by_location/pages/mainPage.dart';
import 'services/location.dart';
import 'pages/login.dart';

void main() => runApp(MaterialApp(
      // home: HomePage(),
      initialRoute: '/login',
      routes: {
        '/': (context) => const Register(),
        '/login': (context) => const Login(),
        '/create': (context) => const CreateAccount(),
        '/main': (context) => const MainPage(),
      },
    ));

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String Latitude = "";
  String Longitude = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentLocation();
  }

  getCurrentLocation() async {
    Position position = await Location().getLocation();
    setState(() {
      Latitude = '$position.latitude';
      Longitude = '$position.longitude';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(Latitude),
          // Text(Longitude),
        ],
      ),
    );
  }
}
