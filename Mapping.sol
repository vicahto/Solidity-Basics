//SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

// IMPORTANT: A map consists of a 'key' mapped to a 'value' (key to value)
// The 'key' MUST be any normal datatype that comes with Solidity like uint, string, address, bool, etc.
// The value can consist of normal and other datatypes (like enums and structs), and anything in general.

contract addressMapping {

    mapping(address => uint) addMap; //Syntax to create a map variable. (key => value) Read as "key (mapped) to value"

    function setMap(address _address, uint n) public {
        addMap[_address] = n;   // Tie/equate the key (address) to the value (number)
    }

    function viewMap(address _address) public view returns(uint) {
        return addMap[_address];    //The key(address) returns the value (number/uint).
    }

    function deleteMap(address _address) public {   // Delete a particular mapping.
        delete addMap[_address];
    }

}


// A contract that combines Mapping and Struct

contract movieMapping {

    struct MovieStruct {
        string title;
        string director;
    }

    MovieStruct setMovie;

    mapping(uint => MovieStruct) MovieMap;

    function addMovie(string memory _title, string memory _director, uint ID) public {    
        setMovie = MovieStruct(_title, _director);
        MovieMap[ID] = setMovie;
    }

    // Adds a movie without using the 'setMovie' variable. Makes the code shorter.
    function addMovie2(string memory _title, string memory _director, uint ID) public {    
        MovieMap[ID] = MovieStruct(_title, _director);
    }

    function getMovie(uint ID) public view returns(MovieStruct memory) {
        return MovieMap[ID];
    }
}


// Nested Mapping (A map within a map)

contract movieNestedMapping {

    struct MovieStruct {
        string title;
        string director;
    }

    // Since the 'value' of a map can be anything, we make the 'value' of the map to be a map :)
    // And that's how we create a map within a map

    mapping(address => mapping(uint => MovieStruct)) MovieMap;    

    // For the map above, the key is an ethereum wallet address and the value is a map whose
    // key is an integer and its value is a struct variable called MovieStruct.


    function addMovie(string memory _title, string memory _director, uint ID) public {

        // The nested mapping variable will take two 'key' inputs in square brackets. 
        // The 1st input is for the parent map, the 2nd input is for the nested map.

        MovieMap[msg.sender][ID] = MovieStruct(_title, _director);

        // msg.sender is a global variable in solidity so it does not need to be declared the way
        // we declare uint, string, etc. It returns the address that called the contract.
    }

     function getMovie(uint ID) public view returns(MovieStruct memory) {
        return MovieMap[msg.sender][ID];
    }
}

/*
Create a Contract, using nested mapping, to pair two contract addresses together 
(an address owner and an address spender) with a value of integers to keep track of their index.

Once you have successfully set up the map, add additional contract functionality so that the contract 
can pair up new addresses together (owner and spender) as well as retrieve their mapping value.
*/

contract Allowance {

    mapping(address => mapping(address => uint)) allowance;
 
    // this function removes the spenders allowance
    function remove(address _addrOwner, address _addrSpender) public {
        delete allowance[_addrOwner][_addrSpender];
    }

    // this function sets the spenders allowance
    function setAllowance(address _addrOwner, address _addrSpender, uint i) public {
        allowance[_addrOwner][_addrSpender] = i;
    }

    // this function retrieves the mapping value which is the spenders allowance index
    function View(address _addrOwner, address _addrSpender) public view returns(uint) {
        return allowance[_addrOwner][_addrSpender];
    }
}
