# evm-benchmark-public
## OEC Testnet Infos
* Router: 0x6cc0277c979325800294774d7ae478A96B824271
  * compute: 0 -> 0xDa6Ea4daEa89a3180BF0C2Cc8A46F286314CB7A2
  * read:    1 -> 0x9576124E3317c1FB17f28a326b6f9822e67050ff
  * write:   2 -> 0xa146B704C4DCD11E59f50bF09a3D2F0dC7751614

## Statistics
### 1. 计算合约: ComputeTest
* 1 time gas 消耗 (所有opt均不执行):   30,032
* 1 time gas 消耗 (所有opt均执行一遍): 44,474

|  opt id   | 作用  | opt单独1次运行消耗gas  |
|  ----  | ----  | ----  |
| 0  | 加、减 | 83 |
| 1  | 乘、除、模 | 127 |
| 2  | 加模、乘模 | 99 |
| 3  | 幂 (^10) | 134 |
| 4  | 判断、位运算 | 63 |
| 5  | keccak256 | 498 |
| 6  | 原生方法 | 154 |
| 7  | 初始化内存数组[48] | 13,283 |

### 2. 读合约: ReadTest
* --iavl-cache-size=0 情况下测试
  * 1 time gas 消耗 (所有opt均不执行):    41,125
  * 1 time gas 消耗 (所有opt均执行一遍): 580,330

|  opt id   | 作用  | opt单独1次运行消耗gas  |
|  ----  | ----  | ----  |
| 0  | 1个string | 240  |
| 1  | 3个string, 3个map | 9,494  |
| 2  | 1个数组[5],1个二维数组[5][5], 1个结构体数组[5], 每个结构体内嵌一个结构体数组[5]| 472,981 |
| 3  | 32个uint值类型| 28,256 |
| 4  | 32个bytes值类型| 28,234 |


### 3. 写合约: WriteTest
* 1 time gas 消耗 (所有opt均不执行):   34,560
* 1 time gas 消耗 (所有opt均执行一遍): 94,924

|  opt id   | 作用  | opt单独1次运行消耗gas   |
|  ----  | ----  | ----  |
| 0  | 触发event事件 | 3,282 |
| 1  | 存储值类型 | 6,248 |
| 2  | 存储array | 26,160 |
| 3  | 存储mapping | 24,674 |
| 4  | 删除array的最后一个 | \ |
| 5  | 删除map的一个key | \ |
