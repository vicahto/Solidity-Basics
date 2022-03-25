// SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

// create a string called favoriteColor.
// Initialize the string to 'blue'.
// Create a function that returns the string literal of favoriteColor.
// Create a function that changes favoriteColor string literal to your own favourite color.
// Create a function that can return how many characters there are in the string favoriteColor.

contract stringPractice {

    string favoriteColor = "Blue";
    string y;

    // We add 'memory' or 'calldata' [or 'storage' (I think)] to string variables
    // and bytes variable when saving to them in functions
    function seeFavouriteColour() public view returns(string memory) {
        return favoriteColor;
    }

    function changeFavouriteColour(string memory yourColour) public {
        favoriteColor = yourColour;
    }

    function getColorLength() public view returns(uint) {

        // We convert to bytes because Solidity cant't get the length of a String
        
        // First, define a bytes variable.
        bytes memory stringToBytes = bytes(favoriteColor);

        return stringToBytes.length;
    }

}
