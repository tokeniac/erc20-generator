// SPDX-License-Identifier: MIT

pragma solidity ^0.7.0;

import "@openzeppelin/contracts/token/ERC20/TokenTimelock.sol";

import "../../service/ServicePayer.sol";
import "../../utils/GeneratorCopyright.sol";

/**
 * @title SimpleTimelock
 * @author ERC20 Generator (https://vittominacori.github.io/erc20-generator)
 * @dev Implementation of the SimpleTimelock
 */
contract SimpleTimelock is TokenTimelock, ServicePayer, GeneratorCopyright("v4.1.0") {

    constructor (
        IERC20 token_,
        address beneficiary_,
        uint256 releaseTime_,
        address payable feeReceiver
    ) TokenTimelock(token_, beneficiary_, releaseTime_) ServicePayer(feeReceiver, "SimpleTimelock") payable {}
}
