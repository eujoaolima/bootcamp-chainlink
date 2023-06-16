// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

// Criação do contrato
contract RegisterAccess {
    // Criação de um array de strings, vazio, que só pode ser acessado dentro do meu smart contract, que possui o nome da variável de info
    string[] private info;
    // É criado um endereço público, onde podemos controlar o acesso pela variável owner
    address public owner;
    // Criação de um map method para mapear os endereços que são permitidos de realizarem modificações no nosso smart contract
    mapping (address => bool) public whiteList;

    // Criação de um constructor para inicializar variáveis
    constructor() {
        owner = msg.sender;
        whiteList[msg.sender] = true;
    }

    // Adicionamos um evento que altera as informações, e passamos para ele capturar as informações antigas e novas
    event InfoChange(string ondInfo, string newInfo);

    // Modificamos a variável onlyOwner para que possamos adicionar algo à função
    modifier onlyOwner {
        // Definimos que a pessoa que está enviando a mensagem precisa ser um dono, senão irá retornar a mensagem "Only Owner"
        require(msg.sender == owner, "Only owner");
        _;
    }

    // Modificamos a variável onlyWhitelist para que possamos adicionar algo à função
    modifier onlyWhitelist {
        // Definimos que a pessoa que está enviando a mensagem precisa estar na lista, senão irá retornar a mensagem "Only whitelist"
        require(whiteList[msg.sender] == true, "Only whitelist");
        _;
    }

    /* CRUD */

    // Função que mostra as informações coletadas na variável info baseado em sua indexação
    function getInfo(uint index) public view returns (string memory) {
        return info[index];
    }

    // Função que adiciona uma informação ao array info
    function setInfo(uint index, string memory _info) public onlyWhitelist {
        emit InfoChange (info[index], _info);
    }

    // Função que adiciona uma informação à whitelist, retornando essa informação dentro do array de informações, e numerando a sequência com -1 (pois a contagem começa no zero)
    function addInfo(string memory _info) public onlyWhitelist returns (uint index) {
        info.push (_info);
        index = info.length -1;
    }

    // Função que mostra as informações da lista
    function listInfo() public view returns (string[] memory) {
        return info;
    }

    // Função que adiciona um membro à whitelist
    function addMember (address _member) public onlyOwner {
        whiteList[_member] = true;
    }

    // Função que deleta um membro da whitelist
    function delMember (address _member) public onlyOwner {
        whiteList[_member] = false;
    }
}