// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentManagement {

    struct Student {
        uint id;
        string name;
        uint age;
        string department;
        bool exists;
    }

    mapping(uint => Student) public students;

    // Add Student
    function addStudent(
        uint _id,
        string memory _name,
        uint _age,
        string memory _department
    ) public {

        require(!students[_id].exists, "Student already exists");

        students[_id] = Student(
            _id,
            _name,
            _age,
            _department,
            true
        );
    }

    // Update Student
    function updateStudent(
        uint _id,
        string memory _name,
        uint _age,
        string memory _department
    ) public {

        require(students[_id].exists, "Student does not exist");

        students[_id].name = _name;
        students[_id].age = _age;
        students[_id].department = _department;
    }

    // Get Student
    function getStudent(uint _id)
        public
        view
        returns (
            uint,
            string memory,
            uint,
            string memory
        )
    {

        require(students[_id].exists, "Student does not exist");

        Student memory s = students[_id];

        return (
            s.id,
            s.name,
            s.age,
            s.department
        );
    }
}