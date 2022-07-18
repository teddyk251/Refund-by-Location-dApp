import 'package:flutter/material.dart';
import 'dart:math';
import 'package:web3dart/web3dart.dart';
import 'package:services/address.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  var acc;
  dynamic private_key;

  void setupAddress() async {
    Address address = Address();
    await address.generateKey();
    setState(() {
      acc = address.address;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupAddress();
    // print(address.hex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Card(
              child: Text('${acc}'),
            ),
            Text('$acc.key'),
            AlertDialog(
              title: Text('Please save your wallet address!'),
              content: Text("Address : $acc"),
              actions: [
                TextButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop(); // dismiss dialog
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
