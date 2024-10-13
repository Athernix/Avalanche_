// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MiToken is ERC20, Ownable {
    address public minter;

    constructor(address initialAccount, uint256 initialSupply, address minterAddress) ERC20("MiToken", "MTK") {
        _mint(initialAccount, initialSupply * 10 ** decimals()); // Suministro inicial de 10k tokens
        minter = minterAddress; // Dirección específica para acuñar
    }

    // Solo la dirección permitida puede acuñar tokens
    function mint(address to, uint256 amount) public {
        require(msg.sender == minter,);
        _mint(to, amount);
    }

    // Permitir cambiar el minter si es necesario
    function setMinter(address newMinter) public onlyOwner {
        minter = newMinter;
    }
}
