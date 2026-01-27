local data = {}
for line in io.lines("input_real") do 
	table.insert(data, line)
end
local currNumber = 50
local numberOfTimes = 0
print(currNumber)
for i,dat in ipairs(data) do
	local rotation = string.sub(dat, 1, 1)=="R"
	local movement = string.sub(dat, 2)
	local startNumber = currNumber
	if rotation then
		print("D")
		currNumber = currNumber + movement
		print(currNumber)
		local tempNumbRot = math.floor(currNumber/100)
		print(tempNumbRot)
		if tempNumbRot > 0 then
			numberOfTimes=numberOfTimes + tempNumbRot
		end
		if startNumber < 0 and currNumber >=0 then
			numberOfTimes = numberOfTimes +1
			print("Ajuste")
		end
		currNumber = math.floor(currNumber%100)
	else
		print("I")
		currNumber =  currNumber - movement
		print(currNumber)
		local tempNumbRot = math.ceil(currNumber/100)
		if currNumber < 0 and tempNumbRot < 0 then
			numberOfTimes=numberOfTimes - tempNumbRot
		end
		print(tempNumbRot)
		if startNumber > 0 and currNumber <= 0 then
			numberOfTimes = numberOfTimes +1
			print("Ajuste")
		end
		currNumber = math.floor(currNumber%100)
	end
	print(currNumber)
	print(numberOfTimes)

end

print(numberOfTimes)
