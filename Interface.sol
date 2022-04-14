//SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

/*
INTERFACES 

Interfaces are quite similar to abstract contracts. They are created using 'interface' keyword.
Interface as the name implies is used to interface a function in one contract to another contract.
Basically, it connects functions in one contract to another contract
Following are the key characteristics of an interface.

    Interface can NOT have any function containing implementation code.
    Functions of an interface can be only of type 'external'.
    Interface can NOT have a constructor.
    Interface can NOT have state variables.
    Interface can have enum, structs which can be accessed using interface name dot notation.
*/

contract Count {
    uint public counter;

    function increment() public {
        counter += 1;
    }
}

// To interface the 'increment' function in contract 'Count' with another contract, we create
// an interface. NOTE: Interfaces are not created inside a contract but outside.

interface FetchCounter {

    // This function creates an interface to the 'counter' variable in contract 'Count' above. 
    function counter() external view returns(uint); 

    // This function creates an interface to the 'increment' function in contract 'Count' above.
    function increment() external;
}

// This contract uses the 'FetchCounter' interface to access objects in contract 'Count'.
contract IncrementCount {
    function StartCount(address _addr) external {

        FetchCounter(_addr).increment(); // Using the interface to run the 'increment' function
        // An address '_addr' is passed to the interface, so we are supposedly counting addresses.
        // The code doesn't work if one arguement is not passed to the interface
    }

    // Using the interface to view the 'counter' variable
    function ViewCounter(address _addr) external view returns(uint) {
        return FetchCounter(_addr).counter();
    }
}

////////////////////////////////////////////////////////////////////////
/* 
1. Create two interfaces that each hold separate function signatures from Uniswap Solidity docs V2 
2. One interface will be called UniswapV2Factory and will contain the function signature that gets pairs.
3. Another interface will be called UniswapV2Pair and will contain the function signature to get reserve values. 
4. Create a contract which contains addresses of the paired tokens you choose as well as the factory address.
5. Within the contract make a function which can successfully get the pair of your tokens and set it to a single address
6. Use that address to get the reserve values and finally return the reserve values 
*/

// Using interfaces to interface with Uniswap.
// https://docs.uniswap.org/protocol/V2/reference/smart-contracts/factory

// https://etherscan.io

interface UniswapV2Factory {

    // Gotten from Uniswap docs V2. Returns the address of the pair for tokenA and tokenB, 
    // if it has been created
    function getPair(address tokenA, address tokenB) external view returns (address pair);
}

interface UniswapV2Pair {

    // Gotten from Uniswap docs V2
    // Returns the reserves of token0 and token1 used to price trades and distribute liquidity
    function getReserves() external view returns (uint112 reserve0, uint112 reserve1, 
    uint32 blockTimestampLast);
}

contract Mine {
    address private factory = 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f;
    // Gotten from Uniswap docs V2. Smart Contracts > Factory page. This is the address where 
    // UniswapV2Factory was deployed to.

    address private dai = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
    address private weth = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    // dai and weth are coins on the Ethereum network. We get their deployment address by 
    // searching them up on Ether scan. 
    
    function GetReserveTokens() external view returns(uint, uint) {
        address pair = UniswapV2Factory(factory).getPair(dai, weth);

        // The comma (,) after 'uint reserve1' is there because one more argument 
        // (uint32 blockTimestampLast) is being returned by the 'getReserves' function in the 
        // 'UniswapV2Pair' interface. The comma keeps space for it.
        (uint reserve0, uint reserve1,) = UniswapV2Pair(pair).getReserves();
        return (reserve0, reserve1);
    }

}

