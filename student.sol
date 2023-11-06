// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentData {
    // Define a struct to represent a student's information
    struct Student {
        uint256 rollNumber; // Unique identifier for the student
        string name;        // Name of the student
        uint256 age;        // Age of the student
    }

    // Declare an array to store student records
    Student[] public students;

    // Event to log when a new student is added
    event StudentAdded(uint256 rollNumber, string name, uint256 age);

    // Function to add a new student with the provided information
    function addStudent(uint256 _rollNumber, string memory _name, uint256 _age) public {
        // Create a new student struct with the given information
        Student memory newStudent = Student(_rollNumber, _name, _age);
        
        // Add the new student to the array of students
        students.push(newStudent);

        // Emit an event to log the addition of the new student
        emit StudentAdded(_rollNumber, _name, _age);
    }

    // Function to get the total count of students in the array
    function getStudentCount() public view returns (uint256) {
        return students.length;
    }

    // Function to retrieve the details of a student by their index in the array
    function getStudent(uint256 index) public view returns (uint256 rollNumber, string memory name, uint256 age) {
        // Ensure the provided index is within the bounds of the array
        require(index < students.length, "Student index out of bounds");
        
        // Retrieve the student information at the specified index
        Student memory student = students[index];
        rollNumber = student.rollNumber;
        name = student.name;
        age = student.age;
    }

    // Fallback function to revert any unintended calls to the contract
    fallback() external {
        revert("Fallback function called. Use the defined functions.");
    }
}
