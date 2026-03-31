local data = {}
local initialState = ""
for line in io.lines("input_final") do 
	local lineArr = {}
	local parsedLine = string.gsub(line, "[.]", "0")
	parsedLine = string.gsub(parsedLine, "[S]", "1")
	for i = 1, string.len(line) do
		table.insert(lineArr, line.sub(parsedLine, i, i))
	end
	table.insert(data, lineArr)
end
initialState = data[1]

for i=2, #data do
	local representation=""
	local newLine = data[i]
	for j, val in ipairs(initialState) do
		if val ~= "^" then
			local numChar = tonumber(val)
			if numChar > 0 and i-1 < #data then
				local nextChar = newLine[j]
				if nextChar == "^" then
					if j > 1 and newLine[j-1] ~= "^" then
						local summedChar = newLine[j-1]
						summedChar = summedChar + numChar
						newLine[j-1] = summedChar
					end
					if j < #newLine and newLine[j+1] ~= "^" then
						local summedChar = newLine[j+1]
						summedChar = summedChar + numChar
						newLine[j+1] = summedChar
					end
				else
					newLine[j] = newLine[j] + numChar
				end
			end
		end
		representation = representation .. val

	end
	print(representation)
	initialState = newLine
end
local numberOfTimes = 0
for i=1, #initialState do
	print(initialState[i])
	if initialState[i] ~= "^" then
		numberOfTimes = numberOfTimes + tonumber(initialState[i])
	end
end
print(numberOfTimes)
