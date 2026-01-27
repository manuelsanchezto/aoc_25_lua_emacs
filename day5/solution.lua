local ranges = {}
local ing = {}
local inRanges = true
for line in io.lines("input_final") do 
	if inRanges and line == "" then
		inRanges = false
	else
		if inRanges then	
			table.insert(ranges, line)
		else
			table.insert(ing, line)
		end
	end
end

local numberOfTimes = 0

for i,dat in ipairs(ing) do
	local idIng = tonumber(dat)
	local idFresh = false
	for j, range in ipairs(ranges) do
		local a, b = range:match("^(%d+)%-(%d+)$")
		a, b = tonumber(a), tonumber(b)

		if idIng >=a and idIng <=b then
			print(idIng.." "..range)
			idFresh = true
		end
	end
	if idFresh then
		numberOfTimes = numberOfTimes + 1 
	end
end

print(numberOfTimes)
