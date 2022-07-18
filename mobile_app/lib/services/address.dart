import 'package:web3dart/web3dart.dart';
import 'dart:math';

class Address {
  dynamic address;
  late Credentials credentials;

  Future<void> generateKey() async {
    var rng = Random.secure();
    print(rng);
    credentials = EthPrivateKey.createRandom(rng);

    address = await credentials.extractAddress();
    print(address.hex);
  }
}
