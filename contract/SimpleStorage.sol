// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// EVM Ethereum Virtual Machine
// Polygon

contract SimpleStorage {
    struct People {
        uint256 favoriteNumber;
        string name;
    }

    uint256 public favoriteNumber;
    bool public isOpen;
    bytes32 public bytes32Var;

    // 0:uint256: favoriteNumber 2
    // 1:string: name erwin
    People public person = People({favoriteNumber: 2, name: "erwin"});

    People[] public people;

    mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    // view pure 不需要消耗gas
    // view 不允许修改数据状态
    function retrieve() public view returns (uint256) {
        return favoriteNumber;
    }

    // pure 不允许读取区块链数据
    function add() public pure returns (uint256) {
        return (1 + 1);
    }

    // calldata , memory , storage
    // calldata , memory 只是暂时存在
    // storage 持久化存储
    // calldata 不可修改
    // memory 可修改
    // string 本质是bytes数组
    // uint 类型不需要加 memory
    function addPerson(uint256 _favoriteNumber, string memory _name) public {
        // People memory newPeople =  People(_favoriteNumber, _name);
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }


}
