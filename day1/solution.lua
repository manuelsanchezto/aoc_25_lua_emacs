local data = {}
for line in io.lines("input_real") do 
	table.insert(data, line)
end
local currNumber = 50
local numberOfTimes = 0
for i,dat in ipairs(data) do
	local rotation = string.sub(dat, 1, 1)=="R"
	local movement = string.sub(dat, 2)
	if rotation then
		currNumber = currNumber + movement
		currNumber = math.floor(currNumber%100)
	else
		currNumber =  currNumber - movement
		currNumber = math.floor(currNumber%100)
	end
	if currNumber == 0 then
		numberOfTimes = numberOfTimes +1
	end

end

print(numberOfTimes)
