local data = {}
for line in io.lines("input_real") do 
	local x,y = string.match(line, "(%d+),(%d+)")
	table.insert(data, {x,y})
end
local max = 0
for i,dat in ipairs(data) do
	for j,coor in ipairs(data) do
		local difx = math.abs((dat[1]-coor[1]))+1
		local dify = math.abs((dat[2]-coor[2]))+1
		if difx*dify > max then  
			max = difx*dify
		end
	end
end

print(max)
