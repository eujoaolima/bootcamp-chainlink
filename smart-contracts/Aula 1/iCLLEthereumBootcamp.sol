// Contrato para interagir com outros contratos da rede Ethereum

// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

struct NameScruct {
    address owner;
    address scName;
    string name;
}

interface iCLLEthereumBootcamp {
    function addName (address scNameAddress, string memory name) external returns (bool);
    function deleteName () external returns (bool);
    function existsOwner (address account) external view returns (bool);
    function getNameInfoByOwner(address account) external view returns (NameScruct memory);
    function owner () external view returns (address);
    function bootcampInfo() external view returns (string memory);
}