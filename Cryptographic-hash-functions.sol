// SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

// keccak256(bytes memory). Returns (bytes32). Computes the keccak-256 hash of the input. 
// SHA256(bytes memory). Returns (bytes32). Computes the SHA-256 hash of the input. 
// ripemd160(bytes memory). Returns (bytes20). Computes the RIPEMD-160 hash of the input. 

contract hashing {

    // 'abi.encodePacked' is a method that concantenates arguments nicely. Returns bytes.
    
    bytes public a = abi.encodePacked(block.difficulty, block.timestamp); // concantenates the global variables & assigns it to 'a'
    
    uint num1 = 500;
    string text = "Hi";

    // abi.encodePacked returns bytes so we have to specify it in returns.
    // The output will remain static because the variables are initialized (values already set). 
    function Encode_1() public view returns(bytes memory) {
        return abi.encodePacked(num1, text);
    }

    // abi.encodePacked returns bytes so we have to specify it in returns
    // The output will keep changing because the blocktime and difficulty keeps changing.
    function Encode_2() public view returns(bytes memory) {
        return abi.encodePacked(block.difficulty, msg.sender, block.timestamp); 
    }


    // keccak256 returns bytes32 so we have to specify it in returns
    function HashEncode_2() public view returns(bytes32) {
        return keccak256(abi.encodePacked(block.difficulty, msg.sender, block.timestamp)); // Hashes what is encoded.
    }

    // Convert (casts) the hashed output to a positive integer (uint).
     function MakeUint() public view returns(uint) {
        return uint(keccak256(abi.encodePacked(block.difficulty, msg.sender, block.timestamp)));
    }

    // Generates random numbers
    function RandomNums(uint range) public view returns(uint) {
        
        return uint(keccak256(abi.encodePacked(block.difficulty, msg.sender, block.timestamp))) % range;
        
        // Returns random numbers less than 'range'. Eg: If range = 100, then 100 divided by the
        // interger produced will always give a remainder that's less than 100 because if it's up
        // to hundred, then there is no remainder.
    }
} 


// The 'Oracle' contract below is considered an oracle because it feeds info
// to the 'GenerateRandomNumber' contract. The info being fed in (an integer-'rand') is not
// coming from the 'GenerateRandomNumber' contract or from the blockchain but from the admin user.
contract Oracle {

    address admin; 
    uint public rand;

    constructor() {
        admin = msg.sender;
    }

    function setRand(uint n) public {
        require(msg.sender == admin);   // Makes sure that only the address that deployed the contract can set 'rand'
        rand = n;
    }
}



contract GenerateRandomNumber {

    Oracle oracle;        // Declare the variable 'oracle' of datatype 'Oracle' (the contract 'Oracle' can be used as a datatype)
    
    constructor(address OracleAddress) {

        // Syntax to provide the address where a contract was deployed to and set it to the variable 'oracle'.
        // This is important because this contract will look for the functions, variables, etc (objects) being called
        // at the address provided. If the objects are not found in the address, the function that made the call will
        // fail. Test this by providing a wallet address or a random contract address that is not actually the
        // 'Oracle' contract address during deployment.
        oracle = Oracle(OracleAddress);  
    }

    function RandomNums(uint range) public view returns(uint) {

        // Checks the address for an object named 'rand'
        if(oracle.rand() != 0) {    // Checks to make sure that the admin user inputs a number

        return uint(keccak256(abi.encodePacked(oracle.rand, block.difficulty, msg.sender, block.timestamp))) % range;
        // adds the variable 'rand' to the list of things to be encoded.
       }
       else{    // Returns zero if no number is inputted by admin user
           return 0;
        }
    }

    // The function above ('RandomNums') can also be written this way. 
    function RandomNums_2(uint range) public view returns(uint) {

        // 'require' takes an error argument.
        require(oracle.rand() != 0, "User input not set");
        return uint(keccak256(abi.encodePacked(oracle.rand, block.difficulty, msg.sender, block.timestamp))) % range;
    }
}


