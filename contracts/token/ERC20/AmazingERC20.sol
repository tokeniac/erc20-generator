// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

import "erc-payable-token/contracts/token/ERC1363/ERC1363.sol";

import "eth-token-recover/contracts/TokenRecover.sol";

import "./behaviours/ERC20Decimals.sol";
import "./behaviours/ERC20Mintable.sol";
import "../../service/ServicePayer.sol";

/**
 * @title AmazingERC20
 * @dev Implementation of the AmazingERC20
 */
contract AmazingERC20 is ERC20Decimals, ERC20Mintable, ERC20Burnable, ERC1363, TokenRecover, ServicePayer {

    constructor (
        string memory name_,
        string memory symbol_,
        uint8 decimals_,
        uint256 initialBalance_,
        address payable feeReceiver_
    )
        ERC20(name_, symbol_)
        ERC20Decimals(decimals_)
        ServicePayer(feeReceiver_, "AmazingERC20")
        payable
    {
        _mint(_msgSender(), initialBalance_);
    }

    function decimals() public view virtual override(ERC20, ERC20Decimals) returns (uint8) {
        return super.decimals();
    }

    /**
     * @dev Function to mint tokens.
     *
     * NOTE: restricting access to addresses with MINTER role. See {ERC20Mintable-mint}.
     *
     * @param account The address that will receive the minted tokens
     * @param amount The amount of tokens to mint
     */
    function _mint(address account, uint256 amount) internal override onlyOwner {
        super._mint(account, amount);
    }

    /**
     * @dev Function to stop minting new tokens.
     *
     * NOTE: restricting access to owner only. See {ERC20Mintable-finishMinting}.
     */
    function _finishMinting() internal override onlyOwner {
        super._finishMinting();
    }
}
