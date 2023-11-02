// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentData {
    struct Student {
        uint256 rollNumber;
        string name;
        uint256 age;
    }

    Student[] public students;

    event StudentAdded(uint256 rollNumber, string name, uint256 age);

    function addStudent(uint256 _rollNumber, string memory _name, uint256 _age) public {
        Student memory newStudent = Student(_rollNumber, _name, _age);
        students.push(newStudent);
        emit StudentAdded(_rollNumber, _name, _age);
    }

    function getStudentCount() public view returns (uint256) {
        return students.length;
    }

    function getStudent(uint256 index) public view returns (uint256 rollNumber, string memory name, uint256 age) {
        require(index < students.length, "Student index out of bounds");
        Student memory student = students[index];
        rollNumber = student.rollNumber;
        name = student.name;
        age = student.age;
    }

    fallback() external {
        revert("Fallback function called. Use the defined functions.");
    }
}
