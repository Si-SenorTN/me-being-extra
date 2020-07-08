local Students = require(script.Parent.StudentClass)

local function EnrollStudent(StudentName, AssignmentCount)
	local Student = Students.new(StudentName)

	local function DetermineClassWithAverage(ClassName)
		for i = 1, AssignmentCount do
			Student:DetermineRandomGrade()
		end

		local Average = Student:DetermineGradeAverage()
		print("\n", Student.Name, "'s Grade Average for ", ClassName, "\n", Average)
	end

	DetermineClassWithAverage("English")
	DetermineClassWithAverage("Math")
	DetermineClassWithAverage("Social Studies")
	DetermineClassWithAverage("Science")
	DetermineClassWithAverage("Art")
end

-- this is all psuedo bs and not meant to have any weight factors or any of that. i could create personal
-- stats such as stress and personal growth/motivation increase/decrease depending on grades recived but
-- thatd be going way too far whereas ive already gone way too far for this assignment lol
EnrollStudent("Adam", 5)
EnrollStudent("Baker", 5)
EnrollStudent("Clark", 5)
EnrollStudent("Davis", 5)
EnrollStudent("Frank", 5)