// NOT MY FILE
// Presented at Ethereum Hackathon on October 21, 2017

/* eslint-env mocha */
/* global assert artifacts contract */

//deploy fake tokens if the mode is development/testing.
// truffle uses a JS transpilation of solidity.


const Dead = artifacts.require('Dead.sol');
const Token = artifacts.require('./tokens/HumanStandardToken.sol');

const utils = require('./utils.js');
const BN = require('bignumber.js');


contract('Dead', (accounts) => {
  describe('Function: heartbeat', () => {
    const [owner, beneficiary] = accounts; // accounts object, pulls first one as owner.

    it('should increment lastHeartbeat by heartbeatPeriod', async () => {
      const dead = await Dead.deployed();
      // gives back an instance of the contract.
      // we can have multiple instances.
      const heartbeatPeriod = await dead.heartbeatPeriod.call();
      // .call... -> we don't want to send a transaction, we just want to read from the block chain.
      // we don't need to pay for this, we just run it locally.
      // a call will NEVER CHANGE STATE.

      const timeToHeartbeat = heartbeatPeriod.dividedToIntegerBy('2');

      const initialLastHeartbeat = await dead.lastHeartbeat.call();

      await utils.increaseTime(timeToHeartbeat.toNumber());
      // copy this code for testing. increase the time in the testrpc (3 months into the future).
      // i ether is 10^18 w. JS is not good at number support. be aware of this.

      await utils.as(owner, dead.heartbeat);
      // in the context of being an owner, call dead.heartbeat. use util function.

      const finalLastHeartbeat = await dead.lastHeartbeat.call();

      assert(finalLastHeartbeat.gte(initialLastHeartbeat.add(timeToHeartbeat.sub(new BN('10', 10)))),
        'lastHeartbeat was not incremented as-expected');
      assert(finalLastHeartbeat.lte(initialLastHeartbeat.add(timeToHeartbeat.add(new BN('10', 10)))),
        'lastHeartbeat was not incremented as-expected');
        // BIG NUMBER equals function.
    });

    it('should not let a non-owner increment lastHeartbeat', async () => {
      const dead = await Dead.deployed();

      const initialLastHeartbeat = await dead.lastHeartbeat.call();

      try {
        await utils.as(beneficiary, dead.heartbeat);
      } catch (err) {
        assert(utils.isEVMException(err), err.toString());
      }
      // try block. expect an error.
      // npm install, truffle compile, truffle run tests.
      // but we haven't told truffle how to deploy our contracts.

      const finalLastHeartbeat = await dead.lastHeartbeat.call();

      assert(finalLastHeartbeat.eq(initialLastHeartbeat),
        'A non-owner was able to increment lastHeartbeat');
    });
  });
});

contract('Dead', (accounts) => {
  describe('Function: depositERC20', () => {
    const [owner, tokenOwner] = accounts;

    it('should fire an event indicating the amount of tokens deposited ' +
       'and its address', async () => {
      const dead = await Dead.deployed();
      const token = await Token.deployed();

      const ownerInitialBalance = await token.balanceOf.call(owner);

      await utils.as(owner, token.transfer, tokenOwner, ownerInitialBalance);

      const tokenOwnerInitialBalance = await token.balanceOf.call(tokenOwner);

      const receipt = await utils.depositTokens(tokenOwner, tokenOwnerInitialBalance, dead.address);

      assert.strictEqual(utils.getReceiptValue(receipt, '_addr').toString(), token.address);
      assert.strictEqual(utils.getReceiptValue(receipt, '_amount').toString(), '1000');

      const tokenOwnerFinalBalance = await token.balanceOf.call(tokenOwner);
      assert(tokenOwnerFinalBalance.eq(new BN('0', 10)),
        'the token owner\'s balance was not properly decremented');

      const deadFinalBalance = await token.balanceOf.call(dead.address);
      assert(deadFinalBalance.eq(tokenOwnerInitialBalance),
        'the DMS\' final balance was not properly incremented');
    });
  });
});

contract('Dead', (accounts) => {
  describe('Function: withdrawERC20', () => {
    const [owner, beneficiary, bigNerd] = accounts;

    it('should allow the owner to withdraw tokens before lastPeriod + heartbeatPeriod',
      async () => {
        const dead = await Dead.deployed();
        const token = await Token.deployed();

        const ownerInitialBalance = await token.balanceOf.call(owner);

        await utils.depositTokens(owner, ownerInitialBalance, dead.address);

        assert((await token.balanceOf.call(owner)).eq(new BN('0', 10)),
          'tokens were not deposited successfully');

        await utils.as(owner, dead.withdrawERC20, token.address);

        const ownerFinalBalance = await token.balanceOf.call(owner);
        assert(ownerFinalBalance.eq(ownerInitialBalance),
          'the owner was unable to withdraw tokens when they should have been able to');
      });

    it('should not allow a beneficiary to withdraw tokens before lastPeriod + heartbeatPeriod',
      async () => {
        const dead = await Dead.deployed();
        const token = await Token.deployed();

        const beneficiaryInitialBalance = await token.balanceOf.call(beneficiary);

        const ownerInitialBalance = await token.balanceOf.call(owner);
        await utils.depositTokens(owner, ownerInitialBalance, dead.address);

        try {
          await utils.as(beneficiary, dead.withdrawERC20, token.address);
        } catch (err) {
          assert(utils.isEVMException(err), err.toString());
        }

        const beneficiaryFinalBalance = await token.balanceOf.call(beneficiary);
        assert(beneficiaryFinalBalance.eq(beneficiaryInitialBalance),
          'the beneficiary was able to withdraw tokens when they should not have been able to');
      });

    it('should not allow anybody other than the beneficiary to withdraw tokens after lastPeriod ' +
       'heartbeatPeriod', async () => {
      const dead = await Dead.deployed();
      const token = await Token.deployed();

      const bigNerdInitialBalance = await token.balanceOf.call(beneficiary);

      const heartbeatPeriod = await dead.heartbeatPeriod.call();
      await utils.increaseTime(heartbeatPeriod);
      try {
        await utils.as(bigNerd, dead.withdrawERC20, token.address);
      } catch (err) {
        assert(utils.isEVMException(err), err.toString());
      }

      const bigNerdFinalBalance = await token.balanceOf.call(beneficiary);
      assert(bigNerdFinalBalance.eq(bigNerdInitialBalance),
        'someone other than the beneficiary or owner was able to withdraw tokens');
    });

    it('should allow a beneficiary to withdraw tokens after lastPeriod + heartbeatPeriod',
      async () => {
        const dead = await Dead.deployed();
        const token = await Token.deployed();

        const beneficiaryInitialBalance = await token.balanceOf.call(beneficiary);
        const deadInitialBalance = await token.balanceOf.call(dead.address);

        await utils.as(beneficiary, dead.withdrawERC20, token.address);

        const beneficiaryFinalBalance = await token.balanceOf.call(beneficiary);
        assert(beneficiaryFinalBalance.eq(beneficiaryInitialBalance.add(deadInitialBalance)),
          'the beneficiary was not able to withdraw tokens when they should have been able to');
      });

    it('should fire an event indicating the amount of tokens withdrawn ' +
       'and its address', async () => {
      const dead = await Dead.deployed();
      const token = await Token.deployed();

      const receipt = await utils.as(beneficiary, dead.withdrawERC20, token.address);

      assert.strictEqual(utils.getReceiptValue(receipt, '_addr').toString(), token.address);
      assert.strictEqual(utils.getReceiptValue(receipt, '_amount').toString(), '0');
    });
  });
});
