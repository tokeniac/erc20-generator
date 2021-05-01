// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

import "../../service/ServicePayer.sol";
import "../../utils/GeneratorCopyright.sol";

/**
 * @title SimpleERC20
 * @author ERC20 Generator (https://vittominacori.github.io/erc20-generator)
 * @dev Implementation of the SimpleERC20
 */
contract SimpleERC20 is ERC20, ServicePayer, GeneratorCopyright("v5.0.0") {

    constructor (
        string memory name_,
        string memory symbol_,
        uint256 initialBalance_,
        address payable feeReceiver_
    )
        ERC20(name_, symbol_)
        ServicePayer(feeReceiver_, "SimpleERC20")
        payable
    {
        require(initialBalance_ > 0, "SimpleERC20: supply cannot be zero");

        _mint(_msgSender(), initialBalance_);
    }
}
