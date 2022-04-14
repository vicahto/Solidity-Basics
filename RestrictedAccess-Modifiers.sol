// SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

/* It's common practice to Restrict Access to a Contract.
We can restrict who can modify the contract's state or call a contract's functions using modifiers. 

Common modifier patterns:

    onlyBy − only the stated caller(s) can call this function.

    onlyAfter − called after certain time period.

    costs − call this function only if certain value is provided.
*/

contract RestrictedAccess{

    address public owner = msg.sender;
    uint public CreationTime = block.timestamp; // initialized to the time the contract was deployed.

    // Any function that uses this modifier can only be called by the owner address.
    modifier OnlyOwner() {
        require(msg.sender == owner, "Sender not authorized");  // 'require' takes an error argument.
        _;
    }

    // This function changes the owner address. It uses the modifier OnlyOwner which ensures that only the
    // current owner can change the owner's address.
    function ChangeOwner(address NewOwner) public OnlyOwner {
        owner = NewOwner;
    }

     // Any function that uses this modifier can only be called after a certain period of time, say 3 weeks,
     // or 7 seconds, etc. Remember, Solidity understands time.
    modifier OnlyAfter(uint time) {     // This modifier takes an argument
        require(block.timestamp >= time, "Function called too early");  // 'require' takes an error argument.
        _;
    }

    // We pass 'CreationTime' + a timeframe to the 'OnlyAfter' modifier. This is compared with the current time 
    // in the 'OnlyAfter' modifier. Just passing the timeframe, eg 1 minutes, will not work.
    function DeleteOwner() public OnlyAfter(CreationTime + 7 seconds) {
        delete owner;       // just like arrays, we can delete the content of an address variable.
    }

    // Any function that uses this modifier can only be called after a certain amount is provided. 
    modifier cost(uint amount) {

        require(msg.value >= amount, "Not enough Ether provided");
        _;

    }

    function forceOwnerChange(address NewOwner) public payable {

        owner = NewOwner;

    }
}
