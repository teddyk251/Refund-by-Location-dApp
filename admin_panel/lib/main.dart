import 'package:flutter/material.dart';
import 'package:admin_panel/services/metamask.dart';
import 'package:provider/provider.dart';

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
    return ChangeNotifierProvider(
      create: ((context) => MetaMaskProvider()..init()),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Welcome to the Admin Panel'),
            actions: [
              Consumer<MetaMaskProvider>(
                builder: (context, provider, child) {
                  late final String text;

                  if (provider.isConnected && provider.isInOperatingChain) {
                    text = 'Connected';
                  } else if (provider.isConnected &&
                      !provider.isInOperatingChain) {
                    text =
                        'Wrong chain. Please connect to ${MetaMaskProvider.operatingChain}';
                  } else if (provider.isEnabled) {
                    return ElevatedButton(
                        onPressed: () {
                          context.read<MetaMaskProvider>().connect();
                        },
                        child: const Text('Connect Wallet'));
                  } else {
                    text = "Please use a Web3 supported browser";
                  }
                };
              ),
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
                        border: OutlineInputBorder(),
                        hintText: "Enter Latitude"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: lonController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter Longitude"),
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
      },
    );
  }
}
