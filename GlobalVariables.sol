// SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract LedgerBalance {

    // 'msg.sender', 'msg.value', etc. are global variables.

    // Create a map of wallets with amounts
    mapping(address => uint) balance;

    // Updates the balance in the wallet
    function updateBalance(uint newBalance) public {
        balance[msg.sender] = newBalance;
    }
}

// A contract that uses the 'LedgerBalance' contract as a datatype
contract updated {

    // Declare a variable ledger_Balance 
    LedgerBalance ledger_Balance;   // contracts can be used as datatypes, similar to Structs and Enums.

    function update_Balance() public {

        ledger_Balance = new LedgerBalance();   // Create a new instance of the contract and sets it to the variable.
        ledger_Balance.updateBalance(30);       // Calls the function in the contract through the variable and passes it a value.
    }

}
