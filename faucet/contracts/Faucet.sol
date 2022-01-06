pragma solidity ^0.4.22;

import "./Mortal.sol";


contract Faucet is Mortal {

    event Withdrawal(address indexed to, uint amount);
    event Deposit(address indexed from, uint amount);

    function withdraw(uint withdraw_amount) public {
        require(withdraw_amount <= 0.1 ether);
        require(this.balance >= withdraw_amount, "Insufficient amount in Faucet");

        msg.sender.transfer(withdraw_amount);
        emit Withdrawal(msg.sender, withdraw_amount);
    }

    function destroy() public onlyOwner {
        selfdestruct(owner);
    }

    function () public payable {
        emit Deposit(msg.sender, msg.value);
    }
}