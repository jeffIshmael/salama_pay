// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract SalamaPay is ERC20 {

    address public owner;
    
    // mapping(address => uint256) public userStreak;

    event TransactionCompleted(address indexed user, uint256 tokensAwarded);

    constructor() ERC20("SalamaPay", "SALS") {
       owner = msg.sender;
        
    }

    // Function to reward users after a transaction
    function rewardUser(uint _amount) public {
        _mint(msg.sender, _amount);
        emit TransactionCompleted(user, _amount);
    }

    // Function to allow users to spend tokens
    function spendTokens(uint _amount) public {
        require(balanceOf(msg.sender) >= _amount, "Insufficient tokens");
        _burn(msg.sender, _amount);
    }

    // Function to get the user's current token balance
    function getUserBalance(address user) external view returns (uint256) {
        return balanceOf(user);
    }

    //modifier for onlyowner
    modifier onlyOwner(){
        require(msg.sender == owner, "only owner can perform this.");
        _;
    }
}