pragma solidity 0.8.0;

import "./interface/IOperate.sol";

contract Router {
    mapping(uint256 => address) public tests;

    // OEC Testnet
    // compute: 0 -> 0xDa6Ea4daEa89a3180BF0C2Cc8A46F286314CB7A2
    // read:    1 -> 0x9576124E3317c1FB17f28a326b6f9822e67050ff
    // write:   2 -> 0xa146B704C4DCD11E59f50bF09a3D2F0dC7751614
    // mix:     3 -> 0x41692b4e838EB4a0441fB6023E1eFf4Eb0bEd1F3
    function set(uint256 id, address _test) public {
        tests[id] = _test;
    }

    function operate(uint256 id, uint256[] memory opts, uint256 times) public {
        IOperate(tests[id]).operate(opts, times);
    }
}