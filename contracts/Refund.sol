//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;


contract Refund {
    address owner;
    struct EmployeeDetail {
        string name;
        uint256 lat;
        uint256 lon;
        uint256 allowedDistance;
    }
    mapping (address => EmployeeDetail) employeeDetail;
    mapping(address => bool) public employeeCondition;
    address[] public employees;


    constructor() {
        owner = msg.sender;
    }

    function addEmployee(address empAddress, string memory name, uint256 lat, uint256 lon, uint256 allowedDistance) public {
        // restrict employee creation to owner
        // Builds a basic employee struc and adds the employee to 
        require(msg.sender == owner);

        employeeDetail[empAddress].name = name;

        employeeDetail[empAddress].lat = lat;

        employeeDetail[empAddress].lon = lon;

        employeeDetail[empAddress].allowedDistance = allowedDistance;

        employees.push(empAddress);
    }

    function getEmployeeDetail(address empAddress) public view returns (string memory, uint256, uint256, uint256) {
        return (employeeDetail[empAddress].name, employeeDetail[empAddress].lat, employeeDetail[empAddress].lon, employeeDetail[empAddress].allowedDistance);
    }

    function ingestCoordinate(uint256 lat, uint256 lon, uint256 etimestamp) public  {
       require(etimestamp >= 0 && etimestamp <= 86400);
       uint256 distance = calculateDistance(lat, lon);
       if (distance > employeeDetail[msg.sender].allowedDistance) {
           employeeCondition[msg.sender] = false;
       } else {
           employeeCondition[msg.sender] = true;
       }

    }


    // Calculate Square root
    function sqrt(uint x) public pure returns (uint y) {
    uint z = (x + 1) / 2;
    y = x;
        while (z < y) {
            y = z;
            z = (x / z + z) / 2;
        }
        return y;
    }

    function calculateDistance(uint256 lat2, uint256 lon2) public view returns (uint256 dist)
    {
   
        // The math module contains a function
        // named toRadians which converts from
        // degrees to radians.
        (,uint256 lat1, uint256 lon1,) = getEmployeeDetail(msg.sender);

        uint256 distance = uint256(sqrt((lat2 - lat1) ** 2 + (lon2 - lon1) ** 2));
        return uint256(distance);

    }
}