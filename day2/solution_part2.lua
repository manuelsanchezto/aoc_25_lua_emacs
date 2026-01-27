local data = {}
for line in io.lines("input_final") do 
	table.insert(data, line)
end
local sum = 0
for num1, num2 in string.gmatch(data[1], "(%d+)-(%d+)(,*)") do
	for i=num1, num2 do
		local currNum = i
		if string.sub(i, 1, 2) == 0 then
			currNum = string.sub(i, 2, -1)
		end
		currNum = string.sub(currNum, 1, -3)
		local added = false
		for testedFactor = 1, string.len(currNum)/2 do

			if not added then
				if string.len(currNum)%testedFactor then
					local number = currNum:sub(1, testedFactor)
					local equality = true
					for j = 1, #currNum, testedFactor do
						if number ~= currNum:sub(j, j+testedFactor-1) then
							equality = false
						end
					end
					if equality then
						print("equality")
						sum = sum + currNum
						added = true
					end

				end
			end
		end
	end

end
print(sum)
