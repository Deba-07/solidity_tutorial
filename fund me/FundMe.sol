// get fund from users
// withdraw funds
// set a minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract FundMe {
    uint256 public minimumUSD = 5;
    function fund() public payable {
        require(msg.value > minimumUSD);
    }

    function getPrice() public {
        // address - 0x694AA1769357215DE4FAC081bf1f309aDC325306
        // ABI

    }
}
