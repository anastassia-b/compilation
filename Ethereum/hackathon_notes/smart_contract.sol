pragms solidity ^0.4.0;

contract SimpleStorage {
  uint storedData;

  function set(uint x) {
    storedData = x;
  }

  function get() constant returns (uint) {
    return storedData;
  }
}

contract Coin {
  address minter;
  mapping (address => uint) balances;

  function Coin() {
    minter = msg.sender;
  }

  function mint(address owner, uint amount) {
    if (msg.sender != minter) return;
    balances[owner] += amount;
  }

  function send(address receiver, uint amount) {
    if (balances[msg.sender] < amount) return;
    balances[msg.sender] -= amount;
    balances[receiver] += amount;
  }

  function queryBalance(address addr) constant returns (uint balance) {
    return balances[addr];
  }
}
