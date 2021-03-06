## SÅ«rya's Description Report

### Files Description Table


|  File Name  |  SHA-1 Hash  |
|-------------|--------------|
| dist/PausableERC20.dist.sol | 393336a2ac27f6e0edee82fc614f10df769ce978 |


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
| **Pausable** | Implementation | Context |||
| â | <Constructor> | Public âï¸ | ð  |NOâï¸ |
| â | paused | Public âï¸ |   |NOâï¸ |
| â | _pause | Internal ð | ð  | whenNotPaused |
| â | _unpause | Internal ð | ð  | whenPaused |
||||||
| **ERC20Pausable** | Implementation | ERC20, Pausable |||
| â | _beforeTokenTransfer | Internal ð | ð  | |
||||||
| **ERC20Decimals** | Implementation | ERC20 |||
| â | <Constructor> | Public âï¸ | ð  |NOâï¸ |
| â | decimals | Public âï¸ |   |NOâï¸ |
||||||
| **IPayable** | Interface |  |||
| â | pay | External âï¸ |  ðµ |NOâï¸ |
||||||
| **ServicePayer** | Implementation |  |||
| â | <Constructor> | Public âï¸ |  ðµ |NOâï¸ |
||||||
| **PausableERC20** | Implementation | ERC20Decimals, ERC20Burnable, ERC20Pausable, Ownable, ServicePayer |||
| â | <Constructor> | Public âï¸ |  ðµ | ERC20 ERC20Decimals ServicePayer |
| â | pause | External âï¸ | ð  | onlyOwner |
| â | unpause | External âï¸ | ð  | onlyOwner |
| â | decimals | Public âï¸ |   |NOâï¸ |
| â | _beforeTokenTransfer | Internal ð | ð  | |


### Legend

|  Symbol  |  Meaning  |
|:--------:|-----------|
|    ð    | Function can modify state |
|    ðµ    | Function is payable |
