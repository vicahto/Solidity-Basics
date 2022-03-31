// SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract ArrayBasics {
    
    uint[] public Array1; 
    uint[] public Array2;
    uint[200] public fixedSizedArray;
  
    // The push() method adds one or more elements to the end of an array 
    // and returns the new length of the array.
  

    function pushValue(uint number) public {
        Array1.push(number);
    }
    
    // The pop() method removes the last element from an array and returns that value to the caller.
    function popValue() public {
        Array1.pop();
    }

    // The delete method, removes the value of any index (location) in the array, not just the last element
    // However, it doesn't remove the index/position/location itself. It just sets it to zero.
    function DeleteValue(uint i) public {
        delete Array1[i];
    }
    
    // length is a string property that is used to determine the length of a string.
    // length doesn't take any arguments() like push and pop.
    function getLength() public view returns(uint) {
        return Array1.length;
    } 

    // A function that inputs odd numbers into 'Array1'.
    function addNumbers() public {
        // One way to input the numbers into 'Array1'.
        /*
        Array1.push(1);
        Array1.push(3);
        Array1.push(5);
        Array1.push(7);
        Array1.push(9);
        */
        // Using For Loop to input the numbers into 'Array1'
        for(uint n = 1; n <= 9; n=n+2) {
            Array1.push(n);
        }  
    }

    /* Exercise: Create a function that can fully remove an item (value and index) from an array
     1. Create a function called removeElement which assigns the value of the index argument 
        of the array to the last element in the array
     2. Remove the last index/position/location in changeArray with the pop method
     5. remove the element 5 from the array when the contract is called */
    function removeElement(uint removeIndex) public {
        Array1[removeIndex] = Array1[Array1.length - 1];
        Array1.pop();
    }

    //Display/view the values of the array
    function viewArray1() public view returns(uint[] memory) {
        return Array1;
    }
}
