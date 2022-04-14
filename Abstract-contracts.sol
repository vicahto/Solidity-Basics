// SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

/*
ABSTRACT CONTRACTS
Contract that contains at least one function without any implementation. 
It is usually used as a base contract. 
Generally an abstract contract contains both implemented functions ie, functions with body or 
curly brackets {}, as well as abstract functions ie, functions without body or curly brackets {}. 

Derived contract (ie contracts that inherit the abstract contract) will implement the abstract 
function and use the existing functions when required. */

// Base contract
contract Colleague {
    string name;
    uint age = 25;

    // Functions without implementation should be marked as virtual
    function setName() public virtual returns(string memory) {}

    function getAge() public view returns(uint) {
        return age;
    }
    // The contract is still abstract because it has atleast one function without body (implementation).

}

// Derived contract
contract Teacher is Colleague {

    // Implementing the function without body from contract 'Colleague'
    function setName() public pure override returns(string memory) {
        return "Ellah";
    }
}

//////////////////////////////////////////////////////////////////////

/*Scenario 2: By statically declaring contract 'Colleague_2' as 'abstract' we have to remove the
curly braces {} from the function without implementation ('setName') . Note that this will make 
the base contract UNDEPLOYABLE but the derived contract will still work even as 
the base contract is not deployed. */

// Base contract
abstract contract Colleague_2 {
    string name;
    uint age = 25;

    // Functions without implementation {} should be marked as virtual
    function setName() public virtual returns(string memory);

    function getAge() public view returns(uint) {
        return age;
    }
    // The contract is still abstract because it has atleast one function without body (implementation).

}

// Derived contract
contract Teacher_2 is Colleague_2 {

    // Implementing the function without body from contract 'Colleague_2'
    function setName() public pure override returns(string memory) {
        return "Ellah";
    }
}

//////////////////////////////////////////////////////////////////////

// Base contract
contract Calculator {
    function calc() public virtual returns(uint) {}
}

contract test is Calculator {
    function calc() public pure override returns(uint) {
        return 1 + 2;
    }
}
