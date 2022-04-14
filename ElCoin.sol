// SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

// A create simple coin

contract ElCoin {

    address Minter;
    mapping(address => uint) public AvailBalance;   // This variable holds the balance for each address.
    error InsufficientFunds(uint Requested, uint AvailableBalance);        
    // Variable of datatype 'error'. Takes arguments (error is a keyword in solidity).

    event CoinSent(address SentFrom, address SentTo, uint AmountSent); 
    // Variable of datatype 'event'. Takes arguments (event is a keyword in solidity).

    uint Total_Supply;

    constructor() {
        Minter = msg.sender;
    }

    function mint(address Receiver, uint Amount) public {
    
        // The address minting (sending) brand new coins should be same with the address that deployed the contract.
        require(msg.sender == Minter); 

        // The maximum number of coins that can be minted (1 billion).
        require(Amount <= 1e27);

        // Adds to whatever was the previous balance.
        AvailBalance[Receiver] += Amount;   // OR: AvailBalance[Receiver] = AvailBalance[Receiver] + Amount

        Total_Supply += Amount;
    }

    // Keeps track of the total number of coins minted
    function TotalSupply() public view returns(uint) {
        return Total_Supply;
    }

    function Send(address Receiver, uint Amount) public {

        if(Amount < AvailBalance[msg.sender]){
        AvailBalance[msg.sender] -= Amount;
        AvailBalance[Receiver] += Amount;
        emit CoinSent(msg.sender, Receiver, Amount);
        }
        else {
            revert InsufficientFunds({  
                Requested: Amount,
                AvailableBalance: AvailBalance[msg.sender]
            });
        }

        /*  The 'if' statement above can also be written this way:

        if(Amount > AvailBalance[msg.sender])
            revert InsufficientFunds({
                Requested: Amount,
                AvailableBalance: AvailBalance[msg.sender]

            });
        AvailBalance[msg.sender] -= Amount;
        AvailBalance[Receiver] += Amount;
        */
    }

}
