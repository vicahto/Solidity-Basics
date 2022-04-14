// SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract C {

    uint private data; uint public info;

    constructor() {
        info = 10;
    }

    function increment(uint a) private pure returns(uint) {
        return a + 1;
    }

    function updateData(uint a) public {
        data = a;
    }

    function getData() public view returns(uint) {
        return data;
    }

    function compute(uint a, uint b) internal pure returns(uint) {
        return a + b;
    }
}


contract D {

    C c = new C();

    function readInfo() public view returns(uint) {
        return c.info();
    }
}


contract E is C {

    uint private result;
    C private c;

    constructor() {
        c = new C();
    }

    function getComputedResult() public {
        result = compute(23, 5);
    }

    function getResult() public view returns(uint) {
        return result;
    }

    function GetInfo() public view returns(uint) {
        return info;
    }
}
