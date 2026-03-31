local boxes = {}
-- cambiar por un break en el find smallest distance
for line in io.lines("input_final") do 
	local position = {}
	for  val in string.gmatch(line, "%d+") do
		table.insert(position, val)
	end
	table.insert(boxes, position)
end
local endVal=1
local distances={}
local circuits={}
for i, box in ipairs(boxes) do
	local distancesFromBox={}
	for j=1, #boxes do
		local distance = 0
		local px=box[1] - boxes[j][1]
		local py=box[2] - boxes[j][2]
		local pz=box[3] - boxes[j][3]
		distancesFromBox[j] = math.sqrt(px^2 + py^2 + pz^2)
	end
	distances[i] = distancesFromBox
	table.insert(circuits, {i})
end

local changedPrim , changedSec= 0, 0
local alreadyPassedOneCircuit = false
while true do
	local prim = 0
	local sec = 0
	local minDist = 0
	for i=1, #boxes do
		for j=1, #boxes do
			if distances[i][j]>0 and (minDist == 0 or minDist > distances[i][j]) then 
				minDist = distances[i][j]
				prim = i
				sec = j
			end
		end
	end
	local indexPrim, indexSec = nil, nil
		
	for i, circuit in ipairs(circuits) do 
		for _, v in ipairs(circuit) do 
			if v==prim then indexPrim = i end
			if v==sec then indexSec = i end
		end
	end
	

	if not indexPrim and not indexSec then
		table.insert(circuits, {prim, sec})
		changedPrim = prim
		changedSec = sec
	elseif indexPrim and not indexSec then 
		table.insert(circuits[indexPrim], sec)
		changedPrim = prim
		changedSec = sec
	elseif not indexPrim and indexSec then 
		table.insert(circuits[indexSec], prim)
		changedPrim = prim
		changedSec = sec
	elseif indexPrim ~= indexSec then
		for _, v in ipairs(circuits[indexSec]) do
			table.insert(circuits[indexPrim], v)
		end
		table.remove(circuits, indexSec)
		changedPrim = prim
		changedSec = sec
		if #circuits == 1 then
			break
		end
	else
	end

	print (#circuits)
	distances[prim][sec]=0
	distances[sec][prim]=0
 
end

		
local uno = boxes[changedPrim][1]
local dos = boxes[changedSec][1]
print(uno*dos)
