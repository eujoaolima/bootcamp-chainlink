// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

// Definição de contrato
contract Register {
    // Criação de uma variável privada, que só pode ser acessada dentro do seu smart contract
    string private info;

    // Mostra as informações gravadas na variável info
    function getInfo() public view returns (string memory) {
        return info;
    }

    // Salva as informações na variável _info, fazendo com que outras pessoas possam ver o histórico da variável
    function setInfo(string memory _info) public {
        info = _info;
    }
}