import 'dart:html';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  dynamic ethClient;
  dynamic httpClient;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String infuraUrl =
        "https://ropsten.infura.io/v3/6f8474e0630c4d56a55269172680c338";
    httpClient = Client();
    ethClient = Web3Client(infuraUrl, httpClient);

    // getBalance();
  }

  Future<DeployedContract> loadContract() async {
    String abi = await rootBundle.loadString("assets/abi.json");
    String contractAddress = "0xE57228Ed80D5350cB3EeE8850c3E757c4FEdA905";

    final contract = DeployedContract(ContractAbi.fromJson(abi, "Refund"),
        EthereumAddress.fromHex(contractAddress));
    return contract;
  }

  Future<List<dynamic>> query(String functionName, List<dynamic> args) async {
    final contract = await loadContract();
    final ethFunction = contract.function(functionName);
    final result = await ethClient.call(
        contract: contract, function: ethFunction, params: args);

    return result;
  }

  Future<void> getBalance(String targetAddress) async {
    EthereumAddress address = EthereumAddress.fromHex(targetAddress);
  }

  String walletAddress = "";
  TextEditingController myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 200,
              child: TextField(
                controller: myController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter your wallet address"),
              ),
            ),
            ElevatedButton(
              onPressed: (() {
                setState(() {
                  walletAddress = myController.text;
                });
              }),
              child: Text('Add'),
            )
          ],
        ),
        Text(walletAddress),
      ]),
    );
  }
}
