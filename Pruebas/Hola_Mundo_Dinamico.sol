// SPDX-License-Identifier: MIT
//Contrato de saludo dinamico
pragma solidity ^0.8.24;
contract Hola_Mundo_Dinamico {
    string saludo_d ="Hola Dinamico";
    string public saludo_e = "Hola estatico";

    function leerSaludo () public view returns  (string memory) {
        return saludo_d;
    }

    function GuardarSaludo(string memory nuevoSaludo) public {
        saludo_d = nuevoSaludo;
    }

}