// SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

/*
1. Create a contract called 'base' which stores a fully accessible integer called 'data' 
    upon deployment.
2. Create another contract called 'derived' which derives the data from base and runs 
    a function that always outputs (returns) 5.
*/

contract base {

    uint public data;

    constructor(uint _data) {
        data = _data;
    }

}

contract derived is base {     // Contract 'derived' inherits from contract 'base'

    uint _d = 5;               // creates and instantiates variabe _d

    constructor () base(_d) {   // 'derived' contract constructor passes _d to 'base' contract
                                // constructor as its input argument
    } 

    function returnData() public view returns(uint) {
            return data;
    }

}

// Another way to write the 'derived' contract
contract derived_2 is base(20) {    // Passed 20 on purpose instead of 5

    function returnData() public view returns(uint) {
            return data;
    }
}
