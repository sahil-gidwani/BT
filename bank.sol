// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract DBank {
    address Owner;  // Store the address of the owner of the contract

    // Create a mapping to track the account balances of users
    mapping(address => uint) Balance;

    // Constructor that sets the owner of the contract to the address that deploys it
    constructor() {
        Owner = msg.sender;
    }

    // Function for the owner to add Ethereum to the account
    function addBalance(uint amount) public returns (uint) {
        // Ensure that only the owner can add funds to the contract
        require(msg.sender == Owner, "Only the owner can add funds.");
        Balance[msg.sender] = Balance[msg.sender] + amount;
        return Balance[msg.sender];
    }

    // Function to get the balance of the sender's account
    function getBalance() public view returns (uint) {
        return Balance[msg.sender];
    }

    // Function for the owner to withdraw a specified amount from the contract
    function withdraw(uint amount) public returns (uint) {
        // Ensure that only the owner can withdraw funds
        require(msg.sender == Owner, "Only the owner can withdraw.");
        // Check if the owner has sufficient balance for withdrawal
        require(Balance[msg.sender] >= amount, "Insufficient balance for withdrawal.");
        Balance[msg.sender] = Balance[msg.sender] - amount;
        return Balance[msg.sender];
    }
}
