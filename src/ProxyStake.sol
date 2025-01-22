// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;
import "./stakeStorage.sol";
import "./AnuragCoin.sol";

interface IRUP {
    function mint(uint256 _amount , address _to) public ;
}

contract ProxyStake is stakeStorage {
    address implementation;
    address owner;
    address customToken;

    constructor(address _owner, uint256 _implementation , address _customToken) {
        owner = _owner;
        implementation = _implementation;
        customToken = _customToken;   
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
    // this functions returns the equal amount of custom AnuragCoin to the address staking the conins in the address.this 
     function redeemReward(address _to ) public {
      require(block.timestamp-timeStaked[_to] >= 7);
      require(balances[_to] > 0);
      IRUP(customToken).mint(balances[_to], _to);
     }
 }
