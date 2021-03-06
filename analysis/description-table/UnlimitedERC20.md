## SÅ«rya's Description Report

### Files Description Table


|  File Name  |  SHA-1 Hash  |
|-------------|--------------|
| dist/UnlimitedERC20.dist.sol | eb7a02e3fd1591ca66a00c9c4d35a8f423df33e8 |


### Contracts Description Table


|  Contract  |         Type        |       Bases      |                  |                 |
|:----------:|:-------------------:|:----------------:|:----------------:|:---------------:|
|     â      |  **Function Name**  |  **Visibility**  |  **Mutability**  |  **Modifiers**  |
||||||
| **Context** | Implementation |  |||
| â | _msgSender | Internal ð |   | |
| â | _msgData | Internal ð |   | |
||||||
| **Ownable** | Implementation | Context |||
| â | <Constructor> | Public âï¸ | ð  |NOâï¸ |
| â | owner | Public âï¸ |   |NOâï¸ |
| â | renounceOwnership | Public âï¸ | ð  | onlyOwner |
| â | transferOwnership | Public âï¸ | ð  | onlyOwner |
||||||
| **IERC20** | Interface |  |||
| â | totalSupply | External âï¸ |   |NOâï¸ |
| â | balanceOf | External âï¸ |   |NOâï¸ |
| â | transfer | External âï¸ | ð  |NOâï¸ |
| â | allowance | External âï¸ |   |NOâï¸ |
| â | approve | External âï¸ | ð  |NOâï¸ |
| â | transferFrom | External âï¸ | ð  |NOâï¸ |
||||||
| **IERC20Metadata** | Interface | IERC20 |||
| â | name | External âï¸ |   |NOâï¸ |
| â | symbol | External âï¸ |   |NOâï¸ |
| â | decimals | External âï¸ |   |NOâï¸ |
||||||
| **ERC20** | Implementation | Context, IERC20, IERC20Metadata |||
| â | <Constructor> | Public âï¸ | ð  |NOâï¸ |
| â | name | Public âï¸ |   |NOâï¸ |
| â | symbol | Public âï¸ |   |NOâï¸ |
| â | decimals | Public âï¸ |   |NOâï¸ |
| â | totalSupply | Public âï¸ |   |NOâï¸ |
| â | balanceOf | Public âï¸ |   |NOâï¸ |
| â | transfer | Public âï¸ | ð  |NOâï¸ |
| â | allowance | Public âï¸ |   |NOâï¸ |
| â | approve | Public âï¸ | ð  |NOâï¸ |
| â | transferFrom | Public âï¸ | ð  |NOâï¸ |
| â | increaseAllowance | Public âï¸ | ð  |NOâï¸ |
| â | decreaseAllowance | Public âï¸ | ð  |NOâï¸ |
| â | _transfer | Internal ð | ð  | |
| â | _mint | Internal ð | ð  | |
| â | _burn | Internal ð | ð  | |
| â | _approve | Internal ð | ð  | |
| â | _beforeTokenTransfer | Internal ð | ð  | |
||||||
| **ERC20Burnable** | Implementation | Context, ERC20 |||
| â | burn | Public âï¸ | ð  |NOâï¸ |
| â | burnFrom | Public âï¸ | ð  |NOâï¸ |
||||||
| **ERC20Decimals** | Implementation | ERC20 |||
| â | <Constructor> | Public âï¸ | ð  |NOâï¸ |
| â | decimals | Public âï¸ |   |NOâï¸ |
||||||
| **ERC20Mintable** | Implementation | ERC20 |||
| â | mintingFinished | External âï¸ |   |NOâï¸ |
| â | mint | External âï¸ | ð  | canMint |
| â | finishMinting | External âï¸ | ð  | canMint |
| â | _finishMinting | Internal ð | ð  | |
||||||
| **Strings** | Library |  |||
| â | toString | Internal ð |   | |
| â | toHexString | Internal ð |   | |
| â | toHexString | Internal ð |   | |
||||||
| **IERC165** | Interface |  |||
| â | supportsInterface | External âï¸ |   |NOâï¸ |
||||||
| **ERC165** | Implementation | IERC165 |||
| â | supportsInterface | Public âï¸ |   |NOâï¸ |
||||||
| **IAccessControl** | Interface |  |||
| â | hasRole | External âï¸ |   |NOâï¸ |
| â | getRoleAdmin | External âï¸ |   |NOâï¸ |
| â | grantRole | External âï¸ | ð  |NOâï¸ |
| â | revokeRole | External âï¸ | ð  |NOâï¸ |
| â | renounceRole | External âï¸ | ð  |NOâï¸ |
||||||
| **AccessControl** | Implementation | Context, IAccessControl, ERC165 |||
| â | supportsInterface | Public âï¸ |   |NOâï¸ |
| â | hasRole | Public âï¸ |   |NOâï¸ |
| â | _checkRole | Internal ð |   | |
| â | getRoleAdmin | Public âï¸ |   |NOâï¸ |
| â | grantRole | Public âï¸ | ð  | onlyRole |
| â | revokeRole | Public âï¸ | ð  | onlyRole |
| â | renounceRole | Public âï¸ | ð  |NOâï¸ |
| â | _setupRole | Internal ð | ð  | |
| â | _setRoleAdmin | Internal ð | ð  | |
| â | _grantRole | Private ð | ð  | |
| â | _revokeRole | Private ð | ð  | |
||||||
| **Roles** | Implementation | AccessControl |||
| â | <Constructor> | Public âï¸ | ð  |NOâï¸ |
||||||
| **IPayable** | Interface |  |||
| â | pay | External âï¸ |  ðµ |NOâï¸ |
||||||
| **ServicePayer** | Implementation |  |||
| â | <Constructor> | Public âï¸ |  ðµ |NOâï¸ |
||||||
| **UnlimitedERC20** | Implementation | ERC20Decimals, ERC20Mintable, ERC20Burnable, Ownable, Roles, ServicePayer |||
| â | <Constructor> | Public âï¸ |  ðµ | ERC20 ERC20Decimals ServicePayer |
| â | decimals | Public âï¸ |   |NOâï¸ |
| â | _mint | Internal ð | ð  | onlyMinter |
| â | _finishMinting | Internal ð | ð  | onlyOwner |


### Legend

|  Symbol  |  Meaning  |
|:--------:|-----------|
|    ð    | Function can modify state |
|    ðµ    | Function is payable |
