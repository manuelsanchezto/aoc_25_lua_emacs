local ranges = {}
local ing = {}
local inRanges = true
local nums = 0

for line in io.lines("input_final") do 
	if inRanges and line == "" then
		inRanges = false
	else
		if inRanges then
			local min,max =  line:match("(%d+)%-(%d+)")
			table.insert(ranges,{min=tonumber(min), max=tonumber(max)})
		end
	end
end

table.sort(ranges, function(x,y) return x.min<y.min or (x.min == y.min and x.max < y.max) end)

local finalRanges = {}
local temporalRange = {min=ranges[1].min,max=ranges[1].max}
for i,range in ipairs(ranges) do
	print(range.min.." "..range.max)
	if range.min == temporalRange.min then
		print("1")
		temporalRange.max = math.max(temporalRange.max, range.max)
	else
		if range.min <= temporalRange.max then
			if range.max > temporalRange.max then
				temporalRange.max = range.max
				print("2")
			end
		else

			table.insert(finalRanges, temporalRange)
			temporalRange = {min=range.min, max=range.max}
			print("3")
		end
	end
	if i == #ranges then
		table.insert(finalRanges, temporalRange)
	end
end


for i,range in ipairs(finalRanges) do
	print(range.min.." "..range.max)
	nums = nums + 1 + (range.max-range.min)
end
print (nums)

