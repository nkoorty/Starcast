var ethers = require('ethers');  
var crypto = require('crypto');
const fs = require('fs');
const { execSync } = require('child_process');
var Web3 = require('web3');
const web3 = new Web3('https://evm.shibuya.astar.network');

function connectWallet() {
  const secrets = JSON.parse(fs.readFileSync('private.json'));
  const privateKey = secrets.privateKey;
  const wallet = new ethers.Wallet(privateKey);

  web3.eth.accounts.wallet.add(wallet.privateKey);
  web3.eth.defaultAccount = wallet.address;
  return wallet;
}

const privateWallet = connectWallet();

function generateWallet() {
  const id = crypto.randomBytes(32).toString('hex');
  const privateKey = "0x" + id;
  console.log("SAVE BUT DO NOT SHARE THIS:", privateKey);
  const wallet = new ethers.Wallet(privateKey);

  const secrets = { privateKey };
  fs.writeFileSync('generated.json', JSON.stringify(secrets));

  console.log("Address: " + wallet.address);
  return [privateKey, wallet];
}

const [privateKey, wallet] = generateWallet();
web3.eth.accounts.wallet.add(privateKey);
web3.eth.defaultAccount = wallet.address;

// Send wallets from private wallet to generated wallet
const amount = web3.utils.toWei('0.003', 'ether');
const transaction = {
  from: privateWallet.address,
  to: wallet.address,
  value: amount,
  gas: 21000
};

web3.eth.sendTransaction(transaction, (error, hash) => {
    if (error) {
      console.error(error);
    } else {
      console.log(`Transaction hash: ${hash}`);
      setTimeout(() => {
        web3.eth.getTransactionReceipt(hash, (error, receipt) => {
          if (error) {
            console.error(error);
          } else if (receipt) {
            console.log(`Transaction mined in block ${receipt.blockNumber}`);
  
            // const command = `npx hardhat run --network shibuya scripts/deploy.js`;
            const output = execSync(command);
            console.log(output.toString());
          } else {
            console.log('Transaction not yet mined');
          }
        });
      }, 25000);
    }
  });
