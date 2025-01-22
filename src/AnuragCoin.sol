// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

// this file contains the custom erc-20 token
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract AnuragCoin {
    address stakingContract;

    constructor(address _stakingContract) ERC20("AnuCoin", "Anu") {
        stakingContract = _stakingContract;
    }

    modifier onlyContract() {
        require(msg.sender == stakingContract);
        _;
    }

    function mint(uint256 _amount, address _to) public onlyContract {
        _mint(_to, _amount);
    }

    function updateStakingContract(address _contract) external onlyContract {
        stakingContract = _contract
    }
}
