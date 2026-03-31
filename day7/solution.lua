local data = {}
local initialState = ""
for line in io.lines("input_final") do 
	table.insert(data, line)
end
initialState = data[1]

local numberOfTimes = 0

local function replaceAt( str, at, with ) 
	return string.sub(str, 1, at-1 )..with..(string.sub(str, at+1, string.len(str))) 
end

for i=2, #data do
	local newLine = data[i]
	for j=1, string.len(initialState) do
		local currChar = string.sub(initialState, j,j)
		if currChar == "S" then
			local nextChar = string.sub(newLine, j,j)
			if nextChar == "^" then
				numberOfTimes= numberOfTimes +1
				if j > 1 and string.sub(newLine, j-1, j-1) ~= "^" then
					newLine = replaceAt(newLine, j-1, "S")
				end
				if j < string.len(newLine) and string.sub(newLine, j+1, j+1) ~= "^" then
					newLine = replaceAt(newLine, j+1, "S")
				end
			else
				newLine = replaceAt(newLine, j, "S")
			end
		end
	end
	initialState = newLine
end

print(numberOfTimes)
