pragma solidity >=0.7.0 <0.9.0;

contract DBank
{
    address Owner;

    // We are creating the Mapping for the Adding and Withdrawal of Amount in Account
    mapping(address => uint) Balance;

    // Constructor for the address of the Owner
    constructor()
    {
        Owner = msg.sender;
    }

    // Function for adding Ethereum to the Account
    function addBalance(uint amount) public returns (uint)
    {
        // First, we have to check if it is the Owner's Account or Not
        require(msg.sender == Owner, "Yes, it is Owner's Account !!");
        Balance[msg.sender] = Balance[msg.sender] + amount;
        return Balance[msg.sender];
    }

    // Function to Get the Balance from an Account
    function getBalance() public view returns (uint)
    {
        return Balance[msg.sender];
    }

    // Function for the owner to withdraw a specified amount
    function withdraw(uint amount) public returns (uint)
    {
        require(msg.sender == Owner, "Only the owner can withdraw");
        require(Balance[msg.sender] >= amount, "Insufficient balance for withdrawal");
        
        Balance[msg.sender] = Balance[msg.sender] - amount;
        return Balance[msg.sender];
    }
}
