// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract OneDero {
    // Estructura para almacenar información de los usuarios
    struct Usuario {
        address direccion;
        uint256 saldo;
    }

    // Mapping para almacenar la información de los usuarios
    mapping(address => Usuario) public usuarios;

    // Evento para notificar cuando se deposita Ether
    event Deposito(address indexed usuario, uint256 cantidad);

    // Evento para notificar cuando se retira Ether
    event Retiro(address indexed usuario, uint256 cantidad);

    // Función para depositar Ether
    function depositar() public payable {
        // Requiere que el usuario envíe Ether con la transacción
        require(msg.value > 0, "Debe enviar Ether para depositar");

        // Actualiza el saldo del usuario
        usuarios[msg.sender].saldo += msg.value;

        // Emite el evento de depósito
        emit Deposito(msg.sender, msg.value);
    }

    // Función para retirar Ether
    function retirar(uint256 cantidad) public {
        // Requiere que el usuario tenga suficiente saldo
        require(cantidad > 0, "La cantidad debe ser mayor que cero");
        require(usuarios[msg.sender].saldo >= cantidad, "No tiene suficiente saldo");

        // Actualiza el saldo del usuario
        usuarios[msg.sender].saldo -= cantidad;

        // Envía el Ether al usuario
        payable(msg.sender).transfer(cantidad);

        // Emite el evento de retiro
        emit Retiro(msg.sender, cantidad);
    }

    // Función para obtener el saldo del usuario
    function obtenerSaldo() public view returns (uint256) {
        return usuarios[msg.sender].saldo;
    }
}