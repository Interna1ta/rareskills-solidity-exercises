// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

// You may modify this contract
contract Parent {
    uint256 private value;

    constructor(uint256 _value) {
        value = _value;
    }

    function setValue(uint256 _newValue) public virtual {
        value = _newValue;
    }

    function getValue() public view virtual returns (uint256) {
        return value;
    }
}

contract Child is Parent(10) {
    /*
        This exercise assumes you understand how access modifiers works.
        1. `_value` variable is private and can only be accessed by `Parent` contract. Make the variable accessible
           to `Parent` and `Child` contract ONLY.
    */

    function setValue(uint256 newValue) public override {
        super.setValue(newValue);
    }

    function getValue() public view override returns (uint256) {
        return super.getValue();
    }
}
