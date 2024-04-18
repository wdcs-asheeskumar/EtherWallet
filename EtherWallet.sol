// SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;

contract EtherWallet {
    address payable owner;

    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable {}

    function getBalance() public view returns (uint256) {
        return owner.balance;
    }

    function sendEther(address payable _addr, uint256 _amount) public payable {
        (bool sent, ) = _addr.call{value: _amount}("");
        require(sent, "Withdrawal failed");
    }

    function withDraw(uint256 _amount) public payable {
        (bool sent, ) = payable(msg.sender).call{value: _amount}("");
        require(sent, "Withdrawal failed");
    }
}
