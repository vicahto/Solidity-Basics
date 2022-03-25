// SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

// For Loop Exercise:
//1. create a contract myLoopingPracticeContract and place all the following code within:
// 2. create a list that ranges from 1 to 20 called longList
// 3. create a list called numbersList of the following numbers: 1, 4, 34, 56
// 4. create a function that loops through numbersList and returns a true value if the number
//  that the user inputs exists in the list otherwise it should return false 
// 5. create a function that loops trhough and returns how many even numbers there are in the long list

contract myLoopingPracticeContract {

    uint [] public longList = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];
    uint [] numbersList = [1,4,34,56];

    function numberExists(uint inputtedNumber) public view returns(bool) {

        uint count = 0;

       for(uint i = 0; i < numbersList.length;  i++) {
           if(inputtedNumber == numbersList[i]) {
               count++; // increment 'count' by 1 if the no. inputted by user and the number being
           }            // compared on the numberList array are the same.
       }

       if(count != 0) { 
           // count NOT EQUALS to zero(0) means an increment occured and that would only occur
           // if the user input exists in the list.

               return true;
           }
           else {
               return false;
           }    
    }


    function evenNumbers() public view returns(uint) {

        uint count = 0;

        for(uint i = 0; i < longList.length; i++) {
            if(longList[i] % 2 == 0) {
                count++;
            }
        }
        return count;
    }


    // The below functions just shows that the number 2 is actually the 3rd position
    // in the array because the array starts from 0.
    function test2() public view returns(uint) {
        return numbersList[2];
    }

}
