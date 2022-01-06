pragma solidity ^0.4.22;

contract Owned {

	address owner;

	constructor() {
		owner = msg.sender;
	}

	modifier onlyOwner {
		require(msg.sender == owner, "Only the contract owner can call this function");
		_;
	}
}