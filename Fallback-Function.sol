// SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

/* Definition of Fallback Functions:
1. Cannot have a name (anonymous)
2. Does not take any inputs
3. Does not return any outputs
4. Must be declared as external

Why use it? When you call functions that does not exist - or send ether to a contract by send, transfer or call 

statement: send and transfer method recieves 2300 gas but call method receives more (all of the gas) 

*/

contract FallBack {

    event Log(uint gas);    // 'event' is a keyword that tracks a particular event. 2nd step is 'emit'.

    fallback() external {

        // not recommended to write much code in here - because the function will fail if it uses too much gas
        // invoke the send and transfer methods: we get 2300 gas which is enough to emit a log   
        // invoke the call method: we get all the gas 
        
        emit Log(gasleft());    // After an event is created, 'emit' is what broadcasts (sends out) the event.
        // 'gasleft' is a special solidity function that returns how much gas is left after a function runs.
    }

    function GetBalance() public view returns(uint) {

        // returns the current balance of the contract via the contract address.
        return address(this).balance;   // 'this' keyword refers to the address of this 'FallBack' contract.
    }
}

// 'SendToFallBack' contract will send ether to 'FallBack' contract which will triggger 'fallback' function
contract SendToFallBack {

    function TransferToFallBack(address payable _to) public payable {

        // Send ether with the 'transfer' method.
        // Automatically, transfer will transfer 2300 gas amount.

        _to.transfer(msg.value);
    }

    function CallFallBack(address payable _to) public payable {

        // Send ether with the 'call' method.
        // All the gas will be available for use.
        (bool sent,) = _to.call{value:msg.value} (" ");  // The syntax for 'call' is a bit different.
        require(sent, "Failed to send");
    }
}
