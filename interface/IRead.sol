pragma solidity 0.8.0;

interface IContainer {
    function length() external view returns (uint256);
    function storages(uint256 i) external view returns (address);
}

interface IStorage {
    function Title() external view returns (string memory);
    function read_map() external view;
    function read_array_struct() external view;
    function read_uint() external view;
    function read_byte() external view;
}