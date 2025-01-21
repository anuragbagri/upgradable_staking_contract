// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

contract stakeStorage {
    uint256 public totalstaked;
    mapping(address => uint256) balances;
    mapping(address => uint256) timeStaked;
}
