// get fund from users
// withdraw funds
// set a minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract FundMe{
    function fund() public payable {
        require(msg.value > 1e18);
    }
}