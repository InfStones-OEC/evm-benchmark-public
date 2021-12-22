pragma solidity 0.8.0;

import "../interface/IOperate.sol";

contract Storage {
    uint256 N = 5;

    string public Title = "This is a test contract for heavy reading, enjoy yourself. @OKEX";

    // complex mapping
    string key1 = "random1_str";
    mapping(string => string) random1;
    string key2 = "random2_str";
    mapping(string => mapping(string => string)) random2;
    string key3 = "random3_str";
    mapping(string => mapping(string => mapping(string => string))) random3;
    // complex array
    uint256[]     array;
    uint256[][]   matrix;

    // complex struct
    Class[] classes;
    struct Class {
        string    name;
        Student[] students;
    }
    struct Student {
        uint256 id;
        bool sex;
        string name;
        mapping(string => int256) grades;
    }
    string lesson1 = "golang";
    string lesson2 = "rust";
    string lesson3 = "solidity";

    // simple values
    uint8     u8 = 8;
    uint16   u16 = 16;
    uint24   u24 = 24;
    uint32   u32 = 32;
    uint40   u40 = 40;
    uint48   u48 = 48;
    uint56   u56 = 56;
    uint64   u64 = 64;
    uint72   u72 = 72;
    uint80   u80 = 80;
    uint88   u88 = 88;
    uint96   u96 = 96;
    uint104 u104 = 104;
    uint112 u112 = 112;
    uint120 u120 = 120;
    uint128 u128 = 128;
    uint136 u136 = 136;
    uint144 u144 = 144;
    uint152 u152 = 152;
    uint160 u160 = 160;
    uint168 u168 = 168;
    uint176 u176 = 176;
    uint184 u184 = 184;
    uint192 u192 = 192;
    uint200 u200 = 200;
    uint208 u208 = 208;
    uint216 u216 = 216;
    uint224 u224 = 224;
    uint232 u232 = 232;
    uint240 u240 = 240;
    uint248 u248 = 248;
    uint256 u256 = 256;

    bytes1    b1 = 0xaa;
    bytes2    b2 = 0xaabb;
    bytes3    b3 = 0xaabbcc;
    bytes4    b4 = 0xaabbccdd;
    bytes5    b5 = 0xaabbccddee;
    bytes6    b6 = 0xaabbccddeeff;
    bytes7    b7 = 0xaabbccddeeffaa;
    bytes8    b8 = 0xaabbccddeeffaabb;
    bytes9    b9 = 0xaabbccddeeffaabbcc;
    bytes10  b10 = 0xaabbccddeeffaabbccdd;
    bytes11  b11 = 0xaabbccddeeffaabbccddee;
    bytes12  b12 = 0xaabbccddeeffaabbccddeeff;
    bytes13  b13 = 0xaabbccddeeffaabbccddeeffaa;
    bytes14  b14 = 0xaabbccddeeffaabbccddeeffaabb;
    bytes15  b15 = 0xaabbccddeeffaabbccddeeffaabbcc;
    bytes16  b16 = 0xaabbccddeeffaabbccddeeffaabbccdd;
    bytes17  b17 = 0xaabbccddeeffaabbccddeeffaabbccddee;
    bytes18  b18 = 0xaabbccddeeffaabbccddeeffaabbccddeeff;
    bytes19  b19 = 0xaabbccddeeffaabbccddeeffaabbccddeeffaa;
    bytes20  b20 = bytes20(0x85615B076615317C80F14cBad6501eec031cD51C);
    bytes21  b21 = 0xaabbccddeeffaabbccddeeffaabbccddeeffaabbcc;
    bytes22  b22 = 0xaabbccddeeffaabbccddeeffaabbccddeeffaabbccdd;
    bytes23  b23 = 0xaabbccddeeffaabbccddeeffaabbccddeeffaabbccddee;
    bytes24  b24 = 0xaabbccddeeffaabbccddeeffaabbccddeeffaabbccddeeff;
    bytes25  b25 = 0xaabbccddeeffaabbccddeeffaabbccddeeffaabbccddeeffaa;
    bytes26  b26 = 0xaabbccddeeffaabbccddeeffaabbccddeeffaabbccddeeffaabb;
    bytes27  b27 = 0xaabbccddeeffaabbccddeeffaabbccddeeffaabbccddeeffaabbcc;
    bytes28  b28 = 0xaabbccddeeffaabbccddeeffaabbccddeeffaabbccddeeffaabbccdd;
    bytes29  b29 = 0xaabbccddeeffaabbccddeeffaabbccddeeffaabbccddeeffaabbccddee;
    bytes30  b30 = 0xaabbccddeeffaabbccddeeffaabbccddeeffaabbccddeeffaabbccddeeff;
    bytes31  b31 = 0xaabbccddeeffaabbccddeeffaabbccddeeffaabbccddeeffaabbccddeeffaa;
    bytes32  b32 = 0xaabbccddeeffaabbccddeeffaabbccddeeffaabbccddeeffaabbccddeeffaabb;

    // create: 11714295 gas
    constructor() public {
        random1[key1]             = "random1random1random1random1random1random1random1random1random1random1random1random1random1random1random1random1random1random1"; // fulfill key -> value
        random2[key1][key2]       = "random2random2random2random2random2random2random2random2random2random2random2random2random2random2random2random2random2random2"; // fulfill key -> mapping
        random3[key1][key2][key3] = "random3random3random3random3random3random3random3random3random3random3random3random3random3random3random3random3random3random3"; // fulfill key -> mapping -> mapping

        for (uint256 i = 0; i < N; i++) {
            array.push(i);   // fulfill array

            uint256[] storage _array = matrix.push();
            for (uint256 j = 0; j < N; j++) { // fulfill matrix
                _array.push(j);
            }
        }

        for (uint256 i = 0; i < N; i++) {
            Class storage c = classes.push();
            for (uint256 j = 0; j < N; j++) {
                Student storage s = c.students.push();
                s.id = j;
                s.sex = true;
                s.name = "studentstudentstudentstudentstudentstudentstudentstudentstudentstudentstudent";
                s.grades[lesson1] = 100;
                s.grades[lesson2] = 60;
                s.grades[lesson3] = 80;
            }
            c.name = "class";
        }
    }

    function read_map() external view {
        random1[key1];
        random2[key1][key2];
        random3[key1][key2][key3];
    }

    function read_array_struct() external view {
        for (uint256 i = 0; i < N; i++) {
            array[i];
            classes[i].name;
            for (uint256 j = 0; j < N; j++) {
                matrix[i][j];

                classes[i].students[j].name;
                classes[i].students[j].id;
                classes[i].students[j].sex;
                classes[i].students[j].grades[lesson1];
                classes[i].students[j].grades[lesson2];
                classes[i].students[j].grades[lesson3];
            }
        }
    }

    function read_uint() external view {
        u8; u16; u24; u32; u40; u48; u56; u64;
        u72; u80; u88; u96; u104; u112; u120; u128;
        u136; u144; u152; u160; u168; u176; u184; u192;
        u200; u208; u216; u224; u232; u240; u248; u256;
    }

    function read_byte() external view {
        b1; b2; b3; b4; b5; b6; b7; b8;
        b9; b10; b11; b12; b13; b14; b15; b16;
        b17; b18; b19; b20; b21; b22; b23; b24;
        b25; b26; b27; b28; b29; b30; b31; b32;
    }
}

// Testnet: 0xa1ddCC79DAAf7d3bE05E83f8d583EE353713cAe0
contract Container {
    address[] public storages;

    function length() external view returns (uint256) {
        return storages.length; // 101942
    }

    // ensure we creates more than 10000 contracts
    // 1 contract: 7 765 696 gas
    function initialize(uint256 num) external {
        for (uint256 i = 0; i < num; i++) {
            Storage s = new Storage();
            storages.push() = address(s);
        }
    }

    function append(address[] calldata _storages) external {
        for (uint256 i = 0; i < _storages.length; i++) {
            storages.push() = _storages[i];
        }
    }
}

contract ReadTest is IOperate {
    uint256 constant private N = 5; // opts maximum length

    address public container;
    uint256 public counter;

    constructor(address _container) {
        container = _container;
    }

    function operate(uint256[] calldata opts, uint256 times) external override {
        uint256[] memory _opts = new uint256[](N);
        for (uint256 i = 0; i < opts.length && i < N; i++) {
            _opts[i] = opts[i];
        }

        uint256 cnt = counter;
        Container c = Container(container);
        uint256 length = c.length();
        for (uint256 t = 0; t < times; t++) {
            Storage s = Storage(c.storages(cnt%length));

            for (uint256 i = 0; i < _opts[0]; i++) {
                s.Title;
            }

            for (uint256 i = 0; i < _opts[1]; i++) {
                s.read_map();
            }

            for (uint256 i = 0; i < _opts[2]; i++) {
                s.read_array_struct();
            }

            for (uint256 i = 0; i < _opts[3]; i++) {
                s.read_uint();
            }

            for (uint256 i = 0; i < _opts[4]; i++) {
                s.read_byte();
            }

            cnt++;
        }
        counter = cnt;
    }
}