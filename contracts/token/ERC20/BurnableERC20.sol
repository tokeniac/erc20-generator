// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

import "./behaviours/ERC20Decimals.sol";
import "../../service/ServicePayer.sol";

/**
 * @title BurnableERC20
 * @dev Implementation of the BurnableERC20
 */
contract BurnableERC20 is ERC20Decimals, ERC20Burnable, ServicePayer {

    constructor (
        string memory name_,
        string memory symbol_,
        uint8 decimals_,
        uint256 initialBalance_,
        address payable feeReceiver_
    )
        ERC20(name_, symbol_)
        ERC20Decimals(decimals_)
        ServicePayer(feeReceiver_, "BurnableERC20")
        payable
    {
        require(initialBalance_ > 0, "BurnableERC20: supply cannot be zero");

        _mint(_msgSender(), initialBalance_);
    }

    function decimals() public view virtual override(ERC20, ERC20Decimals) returns (uint8) {
        return super.decimals();
    }
}
