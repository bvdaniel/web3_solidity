// SPDX-License-Identifier: MIT
pragma solidity 0.8.8;

contract SimpleStorage {
    /* boolean, uint (positive int), int, address, bytes
     bool hasFavoriteNumber = true;
     uint FavoriteNumber = 123; 
     unit8 number = 4; a unit with only 8 bytes of space in memory
     uint256 etc
     string favoriteNumberInText = "123";
     int256 hoa = -6;
     address myadress = 0xB9f810Ba1A0700Ad78F7fcB54804F6D9C0927011
     bytes32 favoriteByte = "cat"; 32 is maximum size for bytes
    */

    uint256 public favoriteNumber;  
    mapping(string => uint256) public nameToFavoriteNumber; 
    People public person = People({favoriteNumber: 2, name: "Daniel"});

    struct People {
        uint256 favoriteNumber;
        string name;
    }

    People[] public people;

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
        retrieve();
    }
    // view, pure doesn't expend gas
    function retrieve () public view returns (uint256){
        return favoriteNumber;
    }
    // only exist temporarily, during the transaction: calldata, memory
    // storage, for variables to store, default type for variable creation 
    // calldata, temporary you can modified
    // memory, temporary can't be modified
    // storage, permanent thta can be modified

    // a unit's location doesn't need to be specified
    // arrays do, and a string is an array 
    // storage can't be called in a function, cause functions are temporary

    function addPerson(string memory _name,uint256 _favoriteNumber) public{
        People memory newPerson = People(_favoriteNumber,_name);
        people.push(newPerson);
        nameToFavoriteNumber[_name]= _favoriteNumber;
    }
    // pure when you don't need info from the blockchain
    function add() public pure returns(uint256){
        return (1+1);
    }

}
