// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

// Uncomment this line to use console.log
// import "hardhat/console.sol";
contract Lock {
    struct Token {
        string name;
        string message;
        string imgUrl;
        address owner;
    }

    mapping(address => Token) public tokens;
    event TokenMinted(string name, string message, string imgUrl, address owner);
    event TokenViewed(string name, string message, string imgUrl, address owner);


    function mintToken(string memory _name, string memory _message ,string memory _imgUrl) public {
        tokens[msg.sender] = Token(_name, _message ,_imgUrl, msg.sender);
        emit TokenMinted(_name, _message ,_imgUrl, msg.sender);
    }

    function getToken() public returns (string memory, string memory, string memory) {
        Token memory token = tokens[msg.sender];

        require(token.owner == msg.sender, "You are not owner");

        emit TokenViewed(token.name, token.message, token.imgUrl, token.owner);  

        return (token.name, token.message, token.imgUrl);
    }
}