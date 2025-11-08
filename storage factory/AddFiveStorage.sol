// SPDX-License-Identifier: MIT

pragma solidity 0.8.30;

import {SimpleStorage} from "./SimpleStorage.sol";

// inheritance
contract AddFiveStorage is SimpleStorage {
    function store(uint256 _favoriteNumber) public override {
        myFavoriteNumber = _favoriteNumber + 5;
    }
}
