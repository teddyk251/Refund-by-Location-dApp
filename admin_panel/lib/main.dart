import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: HomePage(),
      // initialRoute: '/login',
      routes: {},
    ));

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController latController = TextEditingController();
  TextEditingController lonController = TextEditingController();
  TextEditingController distController = TextEditingController();

  String name = "";
  String latitude = "";
  String longitude = "";
  String distance = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to the Admin Panel'),
        actions: [
          ElevatedButton(
            onPressed: () {},
            child: const Text('Connect Wallet'),
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: namecontroller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Employee Name"),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: latController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Enter Latitude"),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: lonController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Enter Longitude"),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: distController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter allowed distance range"),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    name = namecontroller.text;
                    latitude = latController.text;
                    longitude = lonController.text;
                    distance = distController.text;
                  });
                },
                child: Text('Add Employee'),
              )
              // Add TextFormFields and ElevatedButton here.
            ],
          ),
        ),
      ),
    );
  }
}
