pragma solidity 0.8.0;

import "../interface/IOperate.sol";

contract ComputeTest is IOperate {
    uint256 constant private N = 8; // opts maximum length

    function operate(uint256[] calldata opts, uint256 times) external override {
        uint256[] memory _opts = new uint256[](N);
        for (uint256 i = 0; i < opts.length && i < N; i++) {
            _opts[i] = opts[i];
        }

        uint256 rand1 = 0xffe7649d5eca8417 * 3 + 0xf47ed85c4b9a6379;
        uint256 rand2 = 0xf8e5dd9a5c994bba * 5 + 0xf91d87e4b8b74e55;
        uint256 rand3 = 0xff97f6f3b29cda52 * 7 + 0xf393ada8dd75c938;
        uint256 rand4 = 0xfe8d437c45bb3735 * 11 + 0xf47d9a7b5428ffec;
        bytes32 trand = keccak256(abi.encodePacked(rand1 ^ rand2 ^ rand3 ^ rand4, block.timestamp, tx.origin));
        uint256 rand  = uint256(trand);
        uint256 srand = rand;

        uint256 n;
        for(uint256 t = 0; t < times; t++) {
            n = _opts[0];  // add, sub: 3
            assembly {
                for {let i := 0x0 } lt(i, n) { i := add(i, 0x1) }
                {
                    rand := add(rand, sub(rand, i))
                }
            }

            n = _opts[1];  // mul, div, mod, sdiv, smod: 5
            assembly {
                for {let i := 0x0 } lt(i, n) { i := add(i, 0x1) }
                {
                    rand := mul(rand, div(rand, mod(rand, 0xa)))
                    srand := mul(srand, sdiv(srand, smod(srand, 0xa)))
                }
            }

            n = _opts[2];  // addmod, mulmod: 8
            assembly {
                for {let i := 0x0 } lt(i, n) { i := add(i, 0x1) }
                {
                    srand := addmod(srand, mulmod(srand, i, 0xa), 0xa)
                }
            }

            n = _opts[3]; // exp: 10 + 10 * (1 + log256(exp))
            assembly {
                for {let i := 0x0 } lt(i, n) { i := add(i, 0x1) }
                {
                    srand := exp(srand, 0xa)
                }
            }

            n = _opts[4];  // lt, gt, slt, sgt, eq, iszero, and, or, xor, not, byte, shl, shr, sar: 3
            assembly {
                for {let i := 0x0 } lt(i, n) { i := add(i, 0x1) }
                {
                    if lt(rand, srand) {}
                    if gt(rand, srand) {}
                    if slt(rand, srand) {}
                    if sgt(rand, srand) {}
                    if eq(rand, srand) {}
                    if iszero(rand) {}
                    if and(rand, srand) {}
                    if or(rand, srand) {}
                    if xor(rand, srand) {}
                    if not(rand) {}
                    if byte(srand, 0x20) {}
                    if shl(srand, 0xa) {}
                    if shr(srand, 0xa) {}
                    if sar(srand, 0xa) {}
                }
            }

            n = _opts[5];  // keccak256: 30 + 6 * (size of input in words)
            for(uint256 i = 0; i < n; i++) {
                trand = keccak256(abi.encodePacked(trand));
            }

            n = _opts[6];  // origin, caller, callvalue, calldatasize, codesize, gasprice, coinbase, timestamp, number, difficulty, gaslimit, chainid, gas: 2
            assembly {
                for {let i := 0x0 } lt(i, n) { i := add(i, 0x1) }
                {
                    trand := origin()
                    trand := caller()
                    trand := callvalue()
                    trand := calldatasize()
                    trand := codesize()
                    trand := gasprice()
                    trand := coinbase()
                    trand := timestamp()
                    trand := number()
                    trand := difficulty()
                    trand := gaslimit()
                    trand := chainid()
                    trand := gas()
                }
            }

            n = _opts[7];  // memory array;
            for(uint256 i = 0; i < n; i++) {
                init_array();
            }
        }

    }

    function init_array() internal {
        uint8[] memory m_array = new uint8[](48);
        for(uint256 i = 0; i < 48; i++) {
            m_array[i] = uint8(i);
        }
    }
}