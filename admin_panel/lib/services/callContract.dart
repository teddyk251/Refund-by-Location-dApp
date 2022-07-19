import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

class CallContract {
  dynamic ethClient;
  dynamic httpClient;
  String infuraUrl =
      "https://ropsten.infura.io/v3/6f8474e0630c4d56a55269172680c338";

  CallContract() {
    this.httpClient = Client();
    this.ethClient = Web3Client(this.infuraUrl, this.httpClient);
  }

  Future<DeployedContract> loadContract() async {
    String abi = await rootBundle.loadString("assets/abi.json");
    String contractAddress = "0xE57228Ed80D5350cB3EeE8850c3E757c4FEdA905";

    final contract = DeployedContract(ContractAbi.fromJson(abi, "Refund"),
        EthereumAddress.fromHex(contractAddress));
    return contract;
  }
}
