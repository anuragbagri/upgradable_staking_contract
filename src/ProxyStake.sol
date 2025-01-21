// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;
import "./stakeStorage.sol";


contract ProxyStake is stakeStorage {
    address implementation;
    address owner;

    constructor(address _owner, uint256 _implementation) {
        owner = _owner;
        implementation = _implementation;
    }

    fallback() external payable {
        (bool success, ) = implementation.delegatecall(msg.data);
      if (!success) {
             revert();
         }
     }

     function setImplementation(address _address){
         require(msg.sender == owner);
         implementation = _address
     }
 }
