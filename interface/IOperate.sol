pragma solidity 0.8.0;

interface IOperate {
    function operate(uint256[] calldata opts, uint256 times) external virtual;
}