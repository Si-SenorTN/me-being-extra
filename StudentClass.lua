--[[
	I know this is very extra for an assignment but I thought id showcase the only thing im useful for(lol).
	I had fun making this and thought what better of way to showcase my programming skills in prgramming class than
	to use programming to complete an assignment for me.
--]]

local Student = {}
Student.__index = Student
Student.ClassName = "Student"

function Student.new(Name)
	assert(type(Name) == "string")

	local self = setmetatable({}, Student)

	self.Name = Name

	-- represents values 25 - 100 (like stat points)
	-- will not go as low as 1 because i dont want grades below 25%
	self.Focus = math.random(25, 100)
	-- goes off realtive to focus so we cant be less determined than we are focused
	-- nor can we be way determined compared to focus (clamp it 0-100)
	self.Determination = math.clamp(math.random(self.Focus, self.Focus + 70), 0, 100)
	-- this way we get a student whos stats are relative to eachother

	self.GradeBook = {} -- where we will store all of our grades
	
	print("\n-------------")
	print(self.Name, " Enrolled\nDetermination:", self.Determination, "\nFocus:", self.Focus)
	print("-------------\n")

	return self
end

function Student:DetermineRandomGrade()
	assert(getmetatable(self) == Student, "Cannot invoke method when you have not defined a Student")
	-- just some sanity checks had anyone decided to use this

	local Val = (self.Determination + self.Focus)/200
	-- add up our stats and divide them by 100 each so we always end up with a decimal below 1
	-- 1 will represent a 100
	local Jitter = math.random(-23, 23)
	-- assign a random jitter so our grades arent too linear
	-- Jitter can just as well be 0

	local PreFinal = Val * 100 -- cleans up the decimal value bringing it 3 places forward
	local FinalGrade = math.clamp((PreFinal + Jitter), 0, 100)
	print("Assignment - Final Grade:", FinalGrade, "/StackPrevent:", os.time()) -- prevents stacking in output window

	table.insert(self.GradeBook, FinalGrade)
end

function Student:DetermineGradeAverage()
	assert(getmetatable(self) == Student, "Cannot invoke method when you have not defined a Student")

	local ArgCount = select("#", table.unpack(self.GradeBook))
	-- prevents nil edgecases
	-- idk why it would be there just good practice

	if ArgCount < 1 then
		error(self.Name, "'s grade book is empty")
	end

	local Sum = 0
	for i = 1, ArgCount do
		local Grade = self.GradeBook[i]
		Sum = Sum + Grade
	end
	local Average = Sum/ArgCount

	return Average
end

return Student