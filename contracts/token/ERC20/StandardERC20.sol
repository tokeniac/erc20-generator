// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./behaviours/ERC20Decimals.sol";
import "../../service/ServicePayer.sol";

/**
 * @title StandardERC20
 * @dev Implementation of the StandardERC20
 */
contract StandardERC20 is ERC20Decimals, ServicePayer {

    constructor (
        string memory name_,
        string memory symbol_,
        uint8 decimals_,
        uint256 initialBalance_,
        address payable feeReceiver_
    )
        ERC20(name_, symbol_)
        ERC20Decimals(decimals_)
        ServicePayer(feeReceiver_, "StandardERC20")
        payable
    {
        require(initialBalance_ > 0, "StandardERC20: supply cannot be zero");

        _mint(_msgSender(), initialBalance_);
    }

    function decimals() public view virtual override returns (uint8) {
        return super.decimals();
    }
}
