const HDWalletProvider = require('truffle-hdwallet-provider');
const fs = require('fs');
module.exports = {
  networks: {
    inf_Refund_rinkeby: {
      network_id: 4,
      gasPrice: 100000000000,
      provider: new HDWalletProvider(fs.readFileSync('/home/teddy/Desktop/mnemonic', 'utf-8'), "https://rinkeby.infura.io/v3/4da69d9471234d6bb025ae8546390f48")
    }
  },
  mocha: {},
  compilers: {
    solc: {
      version: "0.8.15"
    }
  }
};
