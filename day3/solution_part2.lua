local data = {}
for line in io.lines("input_final") do 
	table.insert(data, line)
end
local tot = 0
for i,dat in ipairs(data) do
	local currNum = dat
	local maxVal = 0
	local indexMaxVal = 0
	local carryNum = 0
	for pos = 1, 12 do
		local indexInSubstring = 1
		local subString = currNum:sub(indexMaxVal+1, -13 + pos )
		print(subString)
		for j = 1, subString:len() do
			if tonumber(subString:sub(j, j))>maxVal then
				maxVal = tonumber(subString:sub(j, j))
				indexInSubstring = j
			end
		end
		print("maxVal")
		print(maxVal)
		-- Esto esta mal, aqui casi es mejor hacer un append de los max val e ir quitando los que toquen
		-- Siempre debería entrar uno y poder avanzarlo (por ejemplo, 11111111111111111 tiene que funcionar)
		--currNum = currNum:sub(pos).. subString:sub(indexMaxVal) .. currNum:sub(-12+pos+indexMaxVal)
		--indexMaxVal=0
		carryNum = (carryNum * 10)+maxVal
		maxVal=0
		indexMaxVal = indexMaxVal + indexInSubstring

	end
	--print(currNum--)
	tot = tot + carryNum

end
print(tot)
