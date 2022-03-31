// SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

// Function overloading means having two or more functions with the same name.
// This is allowed in Solitidy but the number of arguments taken by the functions have to differ.

contract FunctionOverload {

    // Name 'overload'
    function overload(uint a, uint b) public pure returns(uint) { 
        return a + b;
    }

    // Same name 'overload'. Different number of arguements
    function overload(uint a, uint b, uint c) public pure returns(uint) {     
        return a + b + c;
    }

    // Functions that call the 'overload' functions above

    function twoArgs() public pure returns(uint) {  
        return overload(2, 8);  // The number of arguments passed determines which 'overload' function gets called
    }

      function threeArgs() public pure returns(uint) { 
        return overload (2, 2, 2);  // // The number of arguments passed determines which 'overload' function gets called
    }
}
