pragma solidity 0.8.0;

import "../interface/IOperate.sol";

contract WriteTest is IOperate {
    uint256 constant private N = 6; // opts maximum length

    event TestEvent(uint256 indexed value, address indexed sender, uint256 indexed blocknumber, uint256 time, uint256 gasprice , uint256 n);

    uint256 public value;

    uint256[] public array;

    uint256 key;
    mapping(uint256 => uint256) public map;


    function operate(uint256[] calldata opts, uint256 times) external override {
        uint256[] memory _opts = new uint256[](N);
        for (uint256 i = 0; i < opts.length && i < N; i++) {
            _opts[i] = opts[i];
        }

        uint256 _key  = key;
        for(uint256 t = 0; t < times; t++) {
            for (uint256 i = 0; i < _opts[0]; i++) { // 0. log: 375*x + 8*data.length
                emit TestEvent(1, msg.sender, block.number, block.timestamp, tx.gasprice, i);
            }

            for (uint256 i = 0; i < _opts[1]; i++) { // 1. storage single: 20000 (x); 5000 (0)
                value = value + 1;
            }

            for (uint256 i = 1; i <= _opts[2]; i++) { // 2. storage array: 20000 (x); 5000 (0)
                array.push(i);
            }

            for (uint256 i = 0; i < _opts[3]; i++) { // 3. storage map: 20000 (x); 5000 (0)
                _key++;
                map[_key] = _key;
            }

            for (uint256 i = 0; i < _opts[4]; i++) {
                array.pop();
            }

            for (uint256 i = 0; i < _opts[5]; i++) {
                delete map[_key];
                _key--;
            }
        }

        key  = _key;
    }
}
