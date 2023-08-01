pragma solidity ^0.4.2;

import "./Xeret.sol";

contract XeretSale {
    // store admin account 
    address admin;

    // references the erc20 token smart contract 
    XeretToken public tokenContract;

    // store the token price 
    uint256 public tokenPrice;

    // stores the number of tokens sold 
    uint256 public tokenSold;

    // implements sell event so that consumers can get notifications whenever a token has been sold 
    event Sell(address _buyer, uint256 _amount);

    function XeretSale(XeretToken, _tokenContract, uint256 _tokenPrice) public {
        admin = msg.sender;
        tokenContract = _tokenContract;
        tokenPrice = _tokenPrice;
    }

    function multiply(uint x, uint y) internal pure returns (uint z) {
        require(y == 0 || (z = x * y) / y == x);
    }

    // implements a buytoken function that allows users to purchase tokens in a crowd sale 
    function buyTokens(uint256 _numberOfTokens) public payable {
        require(msg.value == multiply(_numberOfTokens, tokenPrice));
        require(tokenContract.balanceOf(this) >= _numberOfTokens);
        require(tokenContract.transfer(msg.sender, numberOfTokens));

        tokenSold += _numberOfTokens;

        Sell(msg.sender, _numberOfTokens);
    }

    // implements an endsale function that allows an admin to end the crowd sale and collect the ether
    // funds that was raised during the sale.
    function endSale() public {
        require(msg.sender == admin);
        require(tokenContract.transfer(admin, tokenContract.balanceOf(this)));

        admin.transfer(address(this).balance);
    }
} 