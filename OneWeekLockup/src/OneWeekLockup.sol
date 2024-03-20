// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract OneWeekLockup {
    mapping(address => uint256) public balances;
    mapping(address => uint256) public lastCall;

    /**
     * In this exercise you are expected to create functions that let users deposit ether
     * Users can also withdraw their ether (not more than their deposit) but should only be able to do a week after their last deposit
     * Consider edge cases by which users might utilize to deposit ether
     *
     * Required function
     * - depositEther()
     * - withdrawEther(uint256 )
     * - balanceOf(address )
     */

    function balanceOf(address user) public view returns (uint256) {
        // return the user's balance in the contract
        return balances[user];
    }

    function depositEther() external payable {
        /// add code here
        balances[msg.sender] += msg.value;
        lastCall[msg.sender] = block.timestamp;
    }

    function withdrawEther(uint256 amount) external {
        /// add code here
        require(
            block.timestamp > lastCall[msg.sender] + 1 weeks + 1 days,
            "hasn't been a week"
        );
        require(
            amount <= balanceOf(msg.sender),
            "You don't have enough balance"
        );
        balances[msg.sender] -= amount;
        msg.sender.call{value: balanceOf(msg.sender)}("");
    }
}
