local data = {}
for line in io.lines("input_final") do 
	table.insert(data, line)
end
local line = {}
for i, dat in ipairs(data) do
	local column = {}
	for j=1, dat:len() do
		table.insert(column, dat:sub(j,j))
	end
	table.insert(line, column)
end
local numberOfTimes = 0

local iterationNewRolls = 1
while iterationNewRolls ~= 0 do
	iterationNewRolls = 0
	for i,l in ipairs(line)do
		for j, c in ipairs(l) do
			if c == "@" then
				local surrounds = 0
				-- Top row
				if i-1 > 0 and j-1 > 0 then
					if line[i-1][j-1] == "@" or line[i-1][j-1]=="x" then
						surrounds = surrounds +1
					end
				end

				if i-1 > 0 then
					if line[i-1][j] == "@" or line[i-1][j]=="x" then
						surrounds = surrounds +1
					end
				end
				if i-1 > 0 and j+1 <= #l then
					if line[i-1][j+1] == "@" or line[i-1][j+1]=="x" then
						surrounds = surrounds +1
					end
				end
				-- Mid row

				if j-1 > 0 then
					if line[i][j-1] == "@" or line[i][j-1]=="x" then
						surrounds = surrounds +1
					end
				end

				if j+1 <= #l then
					if line[i][j+1] == "@" or line[i][j+1]=="x" then
						surrounds = surrounds +1
					end
				end

				-- Bot row
				if i+1<= #line and j-1 > 0 then
					if line[i+1][j-1] == "@" or line[i+1][j-1]=="x" then
						surrounds = surrounds +1
					end
				end

				if i+1 <= #line then
					if line[i+1][j] == "@" or line[i+1][j]=="x" then
						surrounds = surrounds +1
					end
				end

				if i+1 <= #line and j+1 <= #l then
					if line[i+1][j+1] == "@" or line[i+1][j+0]=="x" then
						surrounds = surrounds +1
					end
				end

				if surrounds <4 then
					--				print(i)
					--				print(j)
					iterationNewRolls = iterationNewRolls + 1
					line[i][j] = "x"
				end

			end
		end
	end

	for i,l in ipairs(line)do
		for j, c in ipairs(l) do
			if c == "x" then
				line[i][j] = "."
			end
		end
	end
	numberOfTimes = numberOfTimes + iterationNewRolls
end
print(numberOfTimes)
