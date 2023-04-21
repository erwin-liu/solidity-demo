// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract SimpleStorage {
    struct People {
        uint256 favoriteNumber;
        string name;
    }

    uint256 public favoriteNumber;

    // 0:uint256: favoriteNumber 2
    // 1:string: name erwin
    People public person = People({favoriteNumber: 2, name: "erwin"});

    People[] public people;

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

    function addPerson(uint256 _favoriteNumber, string memory _name) public {
        people.push(People(_favoriteNumber, _name));
    }
}
