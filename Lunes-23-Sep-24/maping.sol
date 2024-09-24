// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
contract Mapping  {
    //Definimos un mapping de direcciones y enteros
    mapping(address => uint256) balances;
    //Función para establecer el balance de Avax en el mapping 
    function setBalance(address _addr) public {
        uint256 avaxBalance = _addr.balance;
         balances[_addr] = avaxBalance;
    }
    //función para obtener el valor de mapping en la dirección del indice
    function getBalance(address _addr) public view returns (uint256) {
        return balances[_addr];
    }
    //Función que permite eliminar un valor de mapping
    function remove(address _addr) public {
        delete balances[_addr];
    }
    //funcióin que llama otra función para actualizar el balance del mapping
    function updateBalanceAvax(address _addr) public  {
        setBalance(_addr);
    }

}