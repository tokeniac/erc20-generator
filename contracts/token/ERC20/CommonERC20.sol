// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

import "./behaviours/ERC20Decimals.sol";
import "./behaviours/ERC20Mintable.sol";
import "../../service/ServicePayer.sol";

/**
 * @title CommonERC20
 * @dev Implementation of the CommonERC20
 */
contract CommonERC20 is ERC20Decimals, ERC20Capped, ERC20Mintable, ERC20Burnable, Ownable, ServicePayer {

    constructor (
        string memory name_,
        string memory symbol_,
        uint8 decimals_,
        uint256 cap_,
        uint256 initialBalance_,
        address payable feeReceiver_
    )
        ERC20(name_, symbol_)
        ERC20Decimals(decimals_)
        ERC20Capped(cap_)
        ServicePayer(feeReceiver_, "CommonERC20")
        payable
    {
        // Immutable variables cannot be read during contract creation time
        // https://github.com/ethereum/solidity/issues/10463
        require(initialBalance_ <= cap_, "ERC20Capped: cap exceeded");
        ERC20._mint(_msgSender(), initialBalance_);
    }

    function decimals() public view virtual override(ERC20, ERC20Decimals) returns (uint8) {
        return super.decimals();
    }

    /**
     * @dev Function to mint tokens.
     *
     * NOTE: restricting access to owner only. See {ERC20Mintable-mint}.
     *
     * @param account The address that will receive the minted tokens
     * @param amount The amount of tokens to mint
     */
    function _mint(address account, uint256 amount) internal override(ERC20, ERC20Capped) onlyOwner {
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
