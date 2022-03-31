// SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract MakingAssertions {

    string text = "NICCCCEEEEEEE";

    function ethAssertions() public view returns(string memory) {

        // 'assert' is a keyword in Solidity that checks if something is true before running the function
        // We have multiple 'assert' expressions in this function but it can also be one.
        // Solidity recognises the word 'wei' and 'ether' and can compare there values.

        assert(1000000000000000000 wei == 1 ether);
        assert(1 ether == 1e18 wei);
        assert(1 wei == 1);

        // If the three assertions are true, the function will run. Else it will throw an error.

        return text;
    }

    function timeAssertions() public view returns(string memory) {

        // Solidity recognises the word 'seconds' and 'minutes' and can compare there values.
        // Always keep them in plural form.
        assert(2 minutes == 120 seconds);
        assert(24 hours == 1 days);
        assert(60 seconds == 1 minutes);


        return text;

    }
    
}
