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
		if string.len(currNum)%2 == 0 then
			local halfPoint = string.len(currNum)/2
			local fhalf = string.sub(currNum, 1, halfPoint)
			local shalf = string.sub(currNum, halfPoint+1, -1)
			if fhalf == shalf then
				sum = sum + currNum
				print(currNum)
			end
		end
	end

end
print(sum)
