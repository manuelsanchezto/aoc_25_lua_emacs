local data = {}
local operators = {}
for line in io.lines("input_real") do 
	if string.find(line, "[%+%*]") == nil then
		local dataline = {}
		for v in string.gmatch(line, "%d+") do
			table.insert(dataline, v)
		end
		table.insert(data, dataline)
	else
		for v in string.gmatch(line, "[%+%*]") do
			table.insert(operators, v)
		end
	end
end
local numTotal = 0

local operation = 0
for k,v in ipairs(operators) do
	operation = 0
	for i, line in ipairs(data) do
		if v == "+" then
			operation = operation + tonumber(line[k])
		else
			if operation == 0 then
				operation = 1
			end

			operation = operation * tonumber(line[k])
		end
	end
	numTotal = numTotal + operation
end

print(numTotal)
