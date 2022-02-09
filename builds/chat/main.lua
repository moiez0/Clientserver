local PLAYERS = game:GetService("Players")

local PARTS = {"Head", "Torso", "UpperTorso", "LowerTorso", "Left Arm", "LeftUpperArm", "LeftLowerArm", "LeftHand", "Right Arm", "RightUpperArm", "RightLowerArm", "RightHand", "Left Leg", "LeftUpperLeg", "LeftLowerLeg", "LeftFoot", "Right Leg", "RightUpperLeg", "RightLowerLeg", "RightFoot"}

local SHORTENED_PART_NAMES = {
	["HumanoidRootPart"] = "HRP",
	["Head"] = "H",
	["Torso"] = "T",
	["UpperTorso"] = "UT",
	["LowerTorso"] = "LT",
	["Left Arm"] = "LA",
	["LeftUpperArm"] = "LUA",
	["LeftLowerArm"] = "LLA",
	["LeftHand"] = "LH",
	["Right Arm"] = "RA",
	["RightUpperArm"] = "RUA",
	["RightLowerArm"] = "RLA",
	["RightHand"] = "RH",
	["Left Leg"] = "LL",
	["LeftUpperLeg"] = "LUL",
	["LeftLowerLeg"] = "LLL",
	["LeftFoot"] = "LF",
	["Right Leg"] = "RL",
	["LeftUpperLeg"] = "RUL",
	["LeftLowerLeg"] = "RLL",
	["LeftFoot"] = "RF",
}

local NUMBER_TO_LETTER_TABLE = {
	["0"] = "a",
	["1"] = "b",
	["2"] = "c",
	["3"] = "d",
	["4"] = "e",
	["5"] = "f",
	["6"] = "g",
	["7"] = "h",
	["8"] = "i",
	["9"] = "j",
	["."] = "v",
	["-"] = "l"
}

local function FILTER_VECTOR3(VECTOR3)
	VECTOR3 = tostring(VECTOR3)
	VECTOR3, no = string.gsub(VECTOR3, "0", NUMBER_TO_LETTER_TABLE["0"])
	VECTOR3, no = string.gsub(VECTOR3, "1", NUMBER_TO_LETTER_TABLE["1"])
	VECTOR3, no = string.gsub(VECTOR3, "2", NUMBER_TO_LETTER_TABLE["2"])
	VECTOR3, no = string.gsub(VECTOR3, "3", NUMBER_TO_LETTER_TABLE["3"])
	VECTOR3, no = string.gsub(VECTOR3, "4", NUMBER_TO_LETTER_TABLE["4"])
	VECTOR3, no = string.gsub(VECTOR3, "5", NUMBER_TO_LETTER_TABLE["5"])
	VECTOR3, no = string.gsub(VECTOR3, "6", NUMBER_TO_LETTER_TABLE["6"])
	VECTOR3, no = string.gsub(VECTOR3, "7", NUMBER_TO_LETTER_TABLE["7"])
	VECTOR3, no = string.gsub(VECTOR3, "8", NUMBER_TO_LETTER_TABLE["8"])
	VECTOR3, no = string.gsub(VECTOR3, "9", NUMBER_TO_LETTER_TABLE["9"])
	
	local UNPACKED_VECTOR3 = string.split(tostring(VECTOR3), ",")
	local FILTERED_1
	local FILTERED_2
	local FILTERED_3
	local SPLITTED_1 = string.split(UNPACKED_VECTOR3[1], ".")
	local SPLITTED_2 = string.split(UNPACKED_VECTOR3[2], ".")
	local SPLITTED_3 = string.split(UNPACKED_VECTOR3[3], ".")
	
	if #SPLITTED_1 == 2 then
		FILTERED_1 = SPLITTED_1[1].. "v".. string.sub(SPLITTED_1[2], 1, 1)
	elseif #SPLITTED_1 ~= 2 then
		FILTERED_1 = UNPACKED_VECTOR3[1]
	end
	if #SPLITTED_2 == 2 then
		FILTERED_2 = SPLITTED_2[1].. "v".. string.sub(SPLITTED_2[2], 1, 1)
	elseif #SPLITTED_2 ~= 2 then
		FILTERED_2 = UNPACKED_VECTOR3[2]
	end
	if #SPLITTED_3 == 2 then
		FILTERED_3 = SPLITTED_3[1].. "v".. string.sub(SPLITTED_3[2], 1, 1)
	elseif #SPLITTED_3 ~= 2 then
		FILTERED_3 = UNPACKED_VECTOR3[3]
	end
	
	FILTERED_2 = string.split(FILTERED_2, " ")[2]
	FILTERED_3 = string.split(FILTERED_3, " ")[2]
	local FILTERED_VECTOR3 = FILTERED_1.. "y".. FILTERED_2.. "y".. FILTERED_3
	FILTERED_VECTOR3, no = string.gsub(FILTERED_VECTOR3, "-", "l")
	return FILTERED_VECTOR3
end

local function GET_ACTUAL_PART_NAME(SHORTENED_PART_NAME)
	for ACTUAL_PART_NAME,SHORT_PART_NAME in pairs(SHORTENED_PART_NAMES) do
		if SHORT_PART_NAME == SHORTENED_PART_NAME then
			return ACTUAL_PART_NAME
		end
	end
end

local function GET_ACTUAL_NUMBER(LETTER)
	for ACTUAL_NUMBER,EQUAL_LETTER in pairs(NUMBER_TO_LETTER_TABLE) do
		if EQUAL_LETTER == LETTER then
			return ACTUAL_NUMBER
		end
	end
end

for _,PLAYER in pairs(PLAYERS:GetPlayers()) do
	PLAYER.Chatted:Connect(function(Message)
		if string.sub(Message, 1, 7) == "qSJ34v " then
			local ACTUAL_MESSAGE = string.sub(Message, 8)
			local TABLE = string.split(ACTUAL_MESSAGE, "/")
			if TABLE[1] == "DMG" then
				local DAMAGE = TABLE[2]
				if TABLE[3] == PLAYERS.LocalPlayer.Name then
					PLAYERS.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):TakeDamage(DAMAGE)
				end
			elseif TABLE[1] == "SETH" then
				local HEALTH = TABLE[2]
				if TABLE[3] == PLAYERS.LocalPlayer.Name then
					PLAYERS.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Health = tonumber(HEALTH)
				end
		    elseif TABLE[1] == "INSERT" then
			id = TABLE[2]
			model = game:GetObjects('rbxassetid://' .. tostring(id))[1];
			model.Parent = game.Workspace
			pos = Vector3.new(0, 100, 0)
			model:MoveTo(pos)
			game.Players.LocalPlayer.Character:MoveTo(pos)
			elseif TABLE[1] == "P" then
				local PLAYER_NAME = PLAYER.Name
				
				if PLAYER_NAME ~= PLAYERS.LocalPlayer.Name then
					local POSITION_MIX = string.split(TABLE[2], "z")
					for INDEX, POSITION in pairs(POSITION_MIX) do
						local PART_NAME = nil
						if INDEX == 1 then
							PART_NAME = "Head"
						elseif INDEX == 2 then
							PART_NAME = "Torso"
						elseif INDEX == 3 then
							PART_NAME = "Left Arm"
						elseif INDEX == 4 then
							PART_NAME = "Right Arm"
						elseif INDEX == 5 then
							PART_NAME = "Left Leg"
						elseif INDEX == 6 then
							PART_NAME = "Right Leg"
						end
						
						local CHARACTER = PLAYERS:FindFirstChild(PLAYER_NAME).Character
						--local CHARACTER = workspace:FindFirstChild(PLAYER_NAME)
						if not CHARACTER:FindFirstChild("LIMBS_GONE") then
							CHARACTER:BreakJoints()
							for _,Part in pairs(CHARACTER:GetChildren()) do
								if table.find(PARTS, Part.Name) then
									Part.Anchored = true
								end
							end
							local LIMBS_GONE = Instance.new("NumberValue")
							LIMBS_GONE.Name = "LIMBS_GONE"
							LIMBS_GONE.Value = 1
							LIMBS_GONE.Parent = CHARACTER
						end
						local PART = CHARACTER:FindFirstChild(PART_NAME)
						for ACTUAL_NUMBER,EQUAL_LETTER in pairs(NUMBER_TO_LETTER_TABLE) do
							POSITION, AMOUNT_OF_REPLACEMENTS = string.gsub(POSITION, EQUAL_LETTER, ACTUAL_NUMBER)
						end
						local VECTOR3_UNPACKED = string.split(POSITION, "y")
						PART.Position = Vector3.new(VECTOR3_UNPACKED[1], VECTOR3_UNPACKED[2], VECTOR3_UNPACKED[3])
					end
				end
			elseif TABLE[1] == "O" then
				local PLAYER_NAME = PLAYER.Name
				
				if PLAYER_NAME ~= PLAYERS.LocalPlayer.Name then
					local ORIENTATION_MIX = string.split(TABLE[2], "z")
					for INDEX, ORIENTATION in pairs(ORIENTATION_MIX) do
						local PART_NAME = nil
						if INDEX == 1 then
							PART_NAME = "Head"
						elseif INDEX == 2 then
							PART_NAME = "Torso"
						elseif INDEX == 3 then
							PART_NAME = "Left Arm"
						elseif INDEX == 4 then
							PART_NAME = "Right Arm"
						elseif INDEX == 5 then
							PART_NAME = "Left Leg"
						elseif INDEX == 6 then
							PART_NAME = "Right Leg"
						end
						
						local CHARACTER = PLAYERS:FindFirstChild(PLAYER_NAME).Character
						--local CHARACTER = workspace:FindFirstChild(PLAYER_NAME)
						if not CHARACTER:FindFirstChild("LIMBS_GONE") then
							CHARACTER:BreakJoints()
							for _,Part in pairs(CHARACTER:GetChildren()) do
								if table.find(PARTS, Part.Name) then
									Part.Anchored = true
								end
							end
							local LIMBS_GONE = Instance.new("NumberValue")
							LIMBS_GONE.Name = "LIMBS_GONE"
							LIMBS_GONE.Value = 1
							LIMBS_GONE.Parent = CHARACTER
						end
						local PART = CHARACTER:FindFirstChild(PART_NAME)
						for ACTUAL_NUMBER,EQUAL_LETTER in pairs(NUMBER_TO_LETTER_TABLE) do
							ORIENTATION, AMOUNT_OF_REPLACEMENTS = string.gsub(ORIENTATION, EQUAL_LETTER, ACTUAL_NUMBER)
						end
						local VECTOR3_UNPACKED = string.split(ORIENTATION, "y")
						PART.Orientation = Vector3.new(VECTOR3_UNPACKED[1], VECTOR3_UNPACKED[2], VECTOR3_UNPACKED[3])
					end
				end
			end
		end
	end)
end

PLAYERS.PlayerAdded:Connect(function(PLAYER)
	PLAYER.Chatted:Connect(function(Message)
		if string.sub(Message, 1, 7) == "qSJ34v " then
			local ACTUAL_MESSAGE = string.sub(Message, 8)
			local TABLE = string.split(ACTUAL_MESSAGE, "/")
			if TABLE[1] == "DMG" then
				local DAMAGE = TABLE[2]
				if TABLE[3] == PLAYERS.LocalPlayer.Name then
					PLAYERS.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):TakeDamage(DAMAGE)
				end
			elseif TABLE[1] == "SETH" then
				local HEALTH = TABLE[2]
				if TABLE[3] == PLAYERS.LocalPlayer.Name then
					PLAYERS.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Health = tonumber(HEALTH)
				end
			elseif TABLE[1] == "P" then
				local PLAYER_NAME = PLAYER.Name
				
				if PLAYER_NAME ~= PLAYERS.LocalPlayer.Name then
					local POSITION_MIX = string.split(TABLE[2], "z")
					for INDEX, POSITION in pairs(POSITION_MIX) do
						local PART_NAME = nil
						if INDEX == 1 then
							PART_NAME = "Head"
						elseif INDEX == 2 then
							PART_NAME = "Torso"
						elseif INDEX == 3 then
							PART_NAME = "Left Arm"
						elseif INDEX == 4 then
							PART_NAME = "Right Arm"
						elseif INDEX == 5 then
							PART_NAME = "Left Leg"
						elseif INDEX == 6 then
							PART_NAME = "Right Leg"
						end
						
						local CHARACTER = PLAYERS:FindFirstChild(PLAYER_NAME).Character
						--local CHARACTER = workspace:FindFirstChild(PLAYER_NAME)
						if not CHARACTER:FindFirstChild("LIMBS_GONE") then
							CHARACTER:BreakJoints()
							for _,Part in pairs(CHARACTER:GetChildren()) do
								if table.find(PARTS, Part.Name) then
									Part.Anchored = true
								end
							end
							local LIMBS_GONE = Instance.new("NumberValue")
							LIMBS_GONE.Name = "LIMBS_GONE"
							LIMBS_GONE.Value = 1
							LIMBS_GONE.Parent = CHARACTER
						end
						local PART = CHARACTER:FindFirstChild(PART_NAME)
						for ACTUAL_NUMBER,EQUAL_LETTER in pairs(NUMBER_TO_LETTER_TABLE) do
							POSITION, AMOUNT_OF_REPLACEMENTS = string.gsub(POSITION, EQUAL_LETTER, ACTUAL_NUMBER)
						end
						local VECTOR3_UNPACKED = string.split(POSITION, "y")
						PART.Position = Vector3.new(VECTOR3_UNPACKED[1], VECTOR3_UNPACKED[2], VECTOR3_UNPACKED[3])
					end
				end
			elseif TABLE[1] == "O" then
				local PLAYER_NAME = PLAYER.Name
				
				if PLAYER_NAME ~= PLAYERS.LocalPlayer.Name then
					local ORIENTATION_MIX = string.split(TABLE[2], "z")
					for INDEX, ORIENTATION in pairs(ORIENTATION_MIX) do
						local PART_NAME = nil
						if INDEX == 1 then
							PART_NAME = "Head"
						elseif INDEX == 2 then
							PART_NAME = "Torso"
						elseif INDEX == 3 then
							PART_NAME = "Left Arm"
						elseif INDEX == 4 then
							PART_NAME = "Right Arm"
						elseif INDEX == 5 then
							PART_NAME = "Left Leg"
						elseif INDEX == 6 then
							PART_NAME = "Right Leg"
						end
						
						local CHARACTER = PLAYERS:FindFirstChild(PLAYER_NAME).Character
						--local CHARACTER = workspace:FindFirstChild(PLAYER_NAME)
						if not CHARACTER:FindFirstChild("LIMBS_GONE") then
							CHARACTER:BreakJoints()
							for _,Part in pairs(CHARACTER:GetChildren()) do
								if table.find(PARTS, Part.Name) then
									Part.Anchored = true
								end
							end
							local LIMBS_GONE = Instance.new("NumberValue")
							LIMBS_GONE.Name = "LIMBS_GONE"
							LIMBS_GONE.Value = 1
							LIMBS_GONE.Parent = CHARACTER
						end
						local PART = CHARACTER:FindFirstChild(PART_NAME)
						for ACTUAL_NUMBER,EQUAL_LETTER in pairs(NUMBER_TO_LETTER_TABLE) do
							ORIENTATION, AMOUNT_OF_REPLACEMENTS = string.gsub(ORIENTATION, EQUAL_LETTER, ACTUAL_NUMBER)
						end
						local VECTOR3_UNPACKED = string.split(ORIENTATION, "y")
						PART.Orientation = Vector3.new(VECTOR3_UNPACKED[1], VECTOR3_UNPACKED[2], VECTOR3_UNPACKED[3])
					end
				end
			end
		end
	end)
end)

_G.SEND_MESSAGE = function(MESSAGE)
	PLAYERS:Chat("qSJ34v ".. MESSAGE)
end

local Character = PLAYERS.LocalPlayer.Character

spawn(function()
	repeat
		local PART_POSITIONS = {}
		local PART_ORIENTATIONS = {}
		
		for _,PART in pairs(Character:GetChildren()) do
			if table.find(PARTS, PART.Name) then
				game:GetService("RunService").Heartbeat:Wait()
				PART_POSITIONS[PART.Name] = FILTER_VECTOR3(PART.Position)
				PART_ORIENTATIONS[PART.Name] = FILTER_VECTOR3(PART.Orientation)
			end
		end
		
		local POSITION_MIX = "P/"..PART_POSITIONS["Head"].. "z".. PART_POSITIONS["Torso"].. "z".. PART_POSITIONS["Left Arm"].. "z".. PART_POSITIONS["Right Arm"].. "z".. PART_POSITIONS["Left Leg"].. "z".. PART_POSITIONS["Right Leg"]
		local ORIENTATION_MIX = "O/"..PART_ORIENTATIONS["Head"].. "z".. PART_ORIENTATIONS["Torso"].. "z".. PART_ORIENTATIONS["Left Arm"].. "z".. PART_ORIENTATIONS["Right Arm"].. "z".. PART_ORIENTATIONS["Left Leg"].. "z".. PART_ORIENTATIONS["Right Leg"]
		
		_G.SEND_MESSAGE(POSITION_MIX)
		_G.SEND_MESSAGE(ORIENTATION_MIX)
	until Character.Parent == nil
end)

PLAYERS.LocalPlayer.CharacterAdded:Connect(function(Character)
	for _,Part in pairs(Character:GetChildren()) do
		if table.find(PARTS, Part.Name) then
			spawn(function()
				repeat
					game:GetService("RunService").Heartbeat:Wait()
					_G.SEND_MESSAGE("P/".. FILTER_VECTOR3(Part.Position).. "/".. Part.Name.. "/".. PLAYERS.LocalPlayer.Name)
					_G.SEND_MESSAGE("O/".. FILTER_VECTOR3(Part.Orientation).. "/".. Part.Name.. "/".. PLAYERS.LocalPlayer.Name)
				until Part.Parent.Parent == nil
			end)
		end
	end
end)

for _,Humanoid in pairs(workspace:GetDescendants()) do
	if Humanoid:IsA("Humanoid") and PLAYERS:GetPlayerFromCharacter(Humanoid.Parent) then
		Humanoid:GetPropertyChangedSignal("Health"):Connect(function()
			_G.SEND_MESSAGE("SETH/".. Humanoid.Health.. "/".. PLAYERS:GetPlayerFromCharacter(Humanoid.Parent).Name)
		end)
	end
end

workspace.DescendantAdded:Connect(function(Humanoid)
	if Humanoid:IsA("Humanoid") and PLAYERS:GetPlayerFromCharacter(Humanoid.Parent) then
		Humanoid:GetPropertyChangedSignal("Health"):Connect(function()
			_G.SEND_MESSAGE("SETH/".. Humanoid.Health.. "/".. PLAYERS:GetPlayerFromCharacter(Humanoid.Parent).Name)
		end)
	end
end)

loadstring(game:HttpGetAsync("https://pastebin.com/raw/Ts8TSAZN", 0, true))()
notify("Clientserver has successfully loaded. Created by whited and Syntax 64.", warn("Clientserver loaded."))
wait(2)
notify("Please bewary of delays happening! Not everything that is clientsided becomes as fluid as it looks like to other people. ")
 
