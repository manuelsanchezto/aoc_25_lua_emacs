local data_lines = {}
local operators_line = ""
local operators = {}

for line in io.lines("input_real") do 
input_realif string.find(line, "[%+%*]") == nil then
		table.insert(data_lines, line)
		--local dataline = {}
		--table.insert(data_lines, line)
		--for v in string.gmatch(line, "%d+") do
		--table.insert(dataline, v)
		--end
		--table.insert(data, dataline)
	else
		operators_line = line
		for v in string.gmatch(line, "[%+%*]") do
			table.insert(operators, v)
		end
	end
end
local numTotal = 0

local operation = 0
local index = 0
for k,v in ipairs(operators) do
	operation = 0
	-- Now I have to get the number or columns which will be the distance between operators
	local startCol, endCol = string.find(operators_line, "[%+%*]", 2)

	local columNum = 0
	if startCol ~= nil then
		operators_line = string.sub(operators_line, endCol)
		columNum = endCol - 2
	else
		columNum = string.len(operators_line)
	end

	local columns = {}
	for i=1, columNum do
		local column = 0
		for j,s in ipairs(data_lines) do
			if string.sub(s, i+index, i+index) ~= " " then
				column = column * 10 + tonumber(string.sub(s, i+index, i+index))
			end
		end
		print(column)
		table.insert(columns, column)
	end

	for i, column in ipairs(columns) do
		if v=="+" then
			operation = operation + column
		else
			if operation == 0 then
				operation = 1
			end
			operation = operation * column
		end
	end

	if startCol ~= nil then
		index = index + columNum+1
	end

	numTotal = numTotal + operation
end

print(numTotal)
