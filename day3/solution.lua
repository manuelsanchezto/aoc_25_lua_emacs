local data = {}
for line in io.lines("input_final") do 
	table.insert(data, line)
end
local tot = 0
for i,dat in ipairs(data) do
	local max1=0
	local max2=0
	for j = 0, (dat:len()-1) do
		local currNum = dat:sub(j,j)
		if currNum ~= "" then
			print(currNum)
			currNum = tonumber(currNum)
			if currNum > max1 then
				max1 = currNum
				max2 = 0
			else
				if currNum > max2 then
					max2 = currNum
				end
			end

		end
	end
	print(dat:sub(-1))
	local lastNum = tonumber(dat:sub(-1))
	if lastNum > max2 then
		max2 = lastNum
	end
	tot = tot + max2
	tot = tot + (max1 * 10)
end

print(tot)
