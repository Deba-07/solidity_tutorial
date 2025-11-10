// get fund from users
// withdraw funds
// set a minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe {
    uint256 public minimumUSD = 5e18;
    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;
    function fund() public payable {
        require(
            getConversionRate(msg.value) >= minimumUSD,
            "Didn't send enough ETH"
        );

        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
    }

    function getPrice() public view returns (uint256) {
        // address - 0x694AA1769357215DE4FAC081bf1f309aDC325306
        // ABI

        AggregatorV3Interface priceFeed = AggregatorV3Interface(
            0x694AA1769357215DE4FAC081bf1f309aDC325306
        );
        (, int256 price, , , ) = priceFeed.latestRoundData();

        // ETH/USD has 8 decimals, so multiply by 1e10 to get 18 decimals
        return uint256(price * 1e10);
    }

    function getConversionRate(
        uint256 ethAmount
    ) public view returns (uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }
}
