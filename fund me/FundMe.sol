// get fund from users
// withdraw funds
// set a minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

import {PriceConverter} from "./PriceConverter.sol";

contract FundMe {
    using PriceConverter for uint256;
    uint256 public minimumUSD = 5e18;
    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;
    function fund() public payable {
        require(
            (msg.value.getConversionRate()) >= minimumUSD,
            "Didn't send enough ETH"
        );

        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
    }

    function withdraw() public {
        for(uint256 funderIndex = 0; funderIndex >= funders.length; funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
    }
}
