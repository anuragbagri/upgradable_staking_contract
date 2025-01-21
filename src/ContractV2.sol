// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;
// upgradable staking contract that has bug in it
import "./stakeStorage.sol";

contract ContractV2 is stakeStorage {
    uint256 public constant MIN_STAKED_PERIOD = 7;
    event Staked(address indexed sender, uint256 amount);
    event Unstaked(address indexed receiver, uint256 amount);

    // The constructor is not used for proxy-delegated contracts. only use modifiers...

    function stake(uint256 _amount) external payable {
        require(_amount > 0, "amounts need to be greater than 0");
        balances[msg.sender] += _amount;
        timeStaked[msg.sender] = block.timestamp;
        totalstaked += _amount;
        emit Staked(msg.sender, _amount);
    }

    function unstake(uint256 _amount) external {
        require(
            balances[msg.sender] >= _amount && _amount > 0,
            "amount should be gretaer than zero"
        );
        require(
            timeStaked[msg.sender] + 7 <= block.timestamp,
            "minimum time stamp period has not been reached yet"
        );
        payable(msg.sender).transfer(_amount / 2); // this functioon contains the bug that returns the half of total amount requested.
        balances[msg.sender] -= _amount;
        totalstaked -= _amount;
        emit Unstaked(msg.sender, _amount);
    }

    function totalStakedToken() external view returns (uint256) {
        return totalstaked;
    }

    function totalTimeStaked() external view returns (uint256) {
        return block.timestamp - timeStaked[msg.sender];
    }
}
