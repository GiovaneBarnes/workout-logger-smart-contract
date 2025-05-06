// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract WorkoutLogger {
    address public owner;

    struct Workout {
        string name;
        uint256 timestamp;
    }

    mapping(address => Workout[]) public userWorkouts;

    constructor() {
        owner = msg.sender;
    }

    function logWorkout(string memory _name) public {
        userWorkouts[msg.sender].push(Workout(_name, block.timestamp));
    }

    function getMyWorkouts() public view returns (Workout[] memory) {
        return userWorkouts[msg.sender];
    }
}
