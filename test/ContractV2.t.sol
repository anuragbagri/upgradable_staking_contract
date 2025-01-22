// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "src/ContractV2.sol";
import "src/AnuragCoin.sol";

contract TestContract is Test {
    ContractV2 c;
    AnuragCoin d;

    function setUp() public {
        c = new ContractV2();
        d = new AnuragCoin(address(this));
    }

    function testStake() {
        c.stake(100);
        assert(c.totalstaked == 100);
    }

    function testUnstake() {
        c.unstake(100);
        assertEq(c.balances[msg.sender] == 0, "ok");
    }

    function testMint() {
        d.mint(msg.sender, 100);
        assertEq(d.balanceOf(msg.sender) == 100, "ok");
    }
}
