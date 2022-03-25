// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract learnFunctions {

    // Function to add two static numbers
    function addValues() public view returns(uint) {
        uint a = 2;
        uint b = 3;
        uint result = a + b;
        return result;
    }

    // Function to multiply two inputed (dynamic) numbers
   function multiplyCalculator(uint a, uint b) public view returns(uint) {
        uint result = a * b;
        return result;
    }   
}
