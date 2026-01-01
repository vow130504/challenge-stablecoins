// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "./MyUSDStaking.sol";

error Engine__InvalidBorrowRate();

contract RateController {
    IMyUSDEngine private i_myUSD;
    MyUSDStaking private i_staking;

    constructor(address _myUSD, address _staking) {
        i_myUSD = IMyUSDEngine(_myUSD);
        i_staking = MyUSDStaking(_staking);
    }

    /**
     * @notice Set the borrow rate for the MyUSD engine
     * @param newRate The new borrow rate to set
     */
    function setBorrowRate(uint256 newRate) external {
        try i_myUSD.setBorrowRate(newRate) {} catch {
            revert Engine__InvalidBorrowRate();
        }
    }

    /**
     * @notice Set the savings rate for the MyUSD staking contract
     * @param newRate The new savings rate to set
     */
    function setSavingsRate(uint256 newRate) external {
        try i_staking.setSavingsRate(newRate) {} catch {
            revert Staking__InvalidSavingsRate();
        }
    }

    /**
     * @notice Xác nhận quyền sở hữu code - Giúp thay đổi Bytecode để Verify thành công
     */
    function getAuthor() external pure returns (string memory) {
        return "Nguyen Minh Thien - MSSV 22120344"; 
    }
}