-- Created by Syntax 64 and Whited
if not game:IsLoaded() then
    game.Loaded:Wait()
end
local PLAYERS = game:GetService("Players")
local PLAYER = PLAYERS.LocalPlayer


--|| Agent was here

warn("Initializing WebSocket.")
if getgenv().DebrisPart then getgenv().DebrisPart:Close();wait();getgenv().DebrisPart = nil end

url = 'ws://localhost:8080'

socket = syn.websocket.connect(url)


getgenv().DebrisPart = socket

ws = getgenv().DebrisPart --// only did this to confuse people who try to grab it.


--|| end ws

-- notify

loadstring([[
if _G.dAAcG3fvBqVoPzVnAFk == nil then
_G.dAAcG3fvBqVoPzVnAFk = ""
end


function notify(text, overwrite, response)

	local clickfunction = response or function() return end
	local override = overwrite or false
	if text == _G.dAAcG3fvBqVoPzVnAFk and override == false then return end
	spawn(function()
		for i,v in pairs(game.CoreGui:GetChildren())do
		spawn(function()
		if v.Name == "MNotify" then -- deleting here
			pcall(function()
			v.ImageButton.ZIndex = 58; v.ImageButton.TextLabel.ZIndex = 59
			v.ImageButton:TweenPosition(UDim2.new(0.01, 0,1, 0), "Out", "Quint", .7, true)
			game:GetService("TweenService"):Create(v.ImageButton.TextLabel,TweenInfo.new(0.8,Enum.EasingStyle.Quint,Enum.EasingDirection.Out,0,false,0), {TextTransparency = 1})
			wait(1)
			v:Destroy()
			end)
		end
		end)
	end
	
	_G.dAAcG3fvBqVoPzVnAFk = text
	local clickfunction = response or function() return end
	local function CreateInstance(cls,props)	local inst = Instance.new(cls)	for i,v in pairs(props) do	inst[i] = v	end	return inst	end
	local MNotify = CreateInstance('ScreenGui',{DisplayOrder=0,Enabled=true,ResetOnSpawn=true,Name='MNotify', Parent=game.CoreGui})
	local ImageButton = CreateInstance('ImageButton',{Image='rbxassetid://1051186612',ImageColor3=Color3.new(0.129412, 0.129412, 0.129412),ImageRectOffset=Vector2.new(0, 0),ImageRectSize=Vector2.new(0, 0),ImageTransparency=0,ScaleType=Enum.ScaleType.Slice,SliceCenter=Rect.new(20, 20, 20, 20),AutoButtonColor=true,Modal=false,Selected=false,Style=Enum.ButtonStyle.Custom,Active=true,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(1, 1, 1),BackgroundTransparency=1,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0.00999999978, 0, 1, 0),Rotation=0,Selectable=true,Size=UDim2.new(0, 234, 0, 40),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=60,Name='ImageButton',Parent = MNotify})
	local TextLabel = CreateInstance('TextLabel',{Font=Enum.Font.SourceSansLight,FontSize=Enum.FontSize.Size24,Text=text,TextColor3=Color3.new(0.807843, 0.807843, 0.807843),TextScaled=false,TextSize=24,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(1, 1, 1),BackgroundTransparency=1,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0.132478639, 0, 0, 0),Rotation=0,Selectable=false,Size=UDim2.new(0, 174, 0, 40),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=61,Name='TextLabel',Parent = ImageButton})
	local UIListLayout = CreateInstance('UIListLayout', {Padding = UDim.new(0, 0), FillDirection = Enum.FillDirection.Vertical, HorizontalAlignment = Enum.HorizontalAlignment.Center, SortOrder = Enum.SortOrder.Name, VerticalAlignment = Enum.VerticalAlignment.Top, Name = 'UIListLayout', Parent = ImageButton })
	-- not setting text ^	
	local value = 1
	if string.len(text) <= 49 then
		ImageButton.Size = UDim2.new(0, game:GetService("TextService"):GetTextSize(text, 24, Enum.Font.SourceSansLight, Vector2.new(500,900)).X+57, 0, 40)
	elseif string.len(text) > 49 then
		value = math.ceil(string.len(string.sub(text, 49))/9)
		ImageButton.Size = UDim2.new(0, game:GetService("TextService"):GetTextSize(text, 24, Enum.Font.SourceSansLight, Vector2.new(500+value*100,900)).X+57, 0, 40)
	end
	ImageButton:TweenPosition(UDim2.new(0.01, 0,1, -60), "Out", "Quint", .7, true)
	spawn(function()
		wait(6.7)
		pcall(function()
		ImageButton.ZIndex = 58; TextLabel.ZIndex = 59
		ImageButton:TweenPosition(UDim2.new(0.01, 0,1, 0), "Out", "Quint", .7, true)
		_G.dAAcG3fvBqVoPzVnAFk = ""
		wait(1)
		MNotify:Destroy()
		end)
	end)
	ImageButton.MouseButton1Up:Connect(function()
		if response == nil then return end
        spawn(function()
		pcall(function()
		ImageButton.ZIndex = 58; TextLabel.ZIndex = 59
		ImageButton:TweenPosition(UDim2.new(0.01, 0,1, 0), "Out", "Quint", .7, true)
		_G.dAAcG3fvBqVoPzVnAFk = ""
		wait(1)
		MNotify:Destroy() end)
		end)
		clickfunction()
	end)	
	end)

end
]])()




local PARTS = {"Head", "Torso", "UpperTorso", "LowerTorso", "Left Arm", "LeftUpperArm", "LeftLowerArm", "LeftHand", "Right Arm", "RightUpperArm", "RightLowerArm", "RightHand", "Left Leg", "LeftUpperLeg", "LeftLowerLeg", "LeftFoot", "Right Leg", "RightUpperLeg", "RightLowerLeg", "RightFoot"}
local ACCESSORIES = {}

for _,ACCESSORY in pairs(PLAYER.Character:GetChildren()) do
	if ACCESSORY:IsA("Accessory") then
		table.insert(ACCESSORIES, ACCESSORY.Name)
	end
end

local NUMBER_TO_LETTER_TABLE = {
	["0"] = "f",
	["1"] = "k",
	["2"] = "m",
	["3"] = "z",
	["4"] = "q",
	["5"] = "i",
	["6"] = "j",
	["7"] = "e",
	["8"] = "u",
	["9"] = "s",
	[","] = "y",
	["."] = "v",
	["-"] = "l"
}

local function ENCRYPT_NUMBER(NUMBER)
    a = tostring(NUMBER)
	NUMBER = tostring(NUMBER)
	NUMBER, AMOUNT_OF_REPLACEMENTS = string.gsub(NUMBER, "0", NUMBER_TO_LETTER_TABLE["0"])
	NUMBER, AMOUNT_OF_REPLACEMENTS = string.gsub(NUMBER, "1", NUMBER_TO_LETTER_TABLE["1"])
	NUMBER, AMOUNT_OF_REPLACEMENTS = string.gsub(NUMBER, "2", NUMBER_TO_LETTER_TABLE["2"])
	NUMBER, AMOUNT_OF_REPLACEMENTS = string.gsub(NUMBER, "3", NUMBER_TO_LETTER_TABLE["3"])
	NUMBER, AMOUNT_OF_REPLACEMENTS = string.gsub(NUMBER, "4", NUMBER_TO_LETTER_TABLE["4"])
	NUMBER, AMOUNT_OF_REPLACEMENTS = string.gsub(NUMBER, "5", NUMBER_TO_LETTER_TABLE["5"])
	NUMBER, AMOUNT_OF_REPLACEMENTS = string.gsub(NUMBER, "6", NUMBER_TO_LETTER_TABLE["6"])
	NUMBER, AMOUNT_OF_REPLACEMENTS = string.gsub(NUMBER, "7", NUMBER_TO_LETTER_TABLE["7"])
	NUMBER, AMOUNT_OF_REPLACEMENTS = string.gsub(NUMBER, "8", NUMBER_TO_LETTER_TABLE["8"])
	NUMBER, AMOUNT_OF_REPLACEMENTS = string.gsub(NUMBER, "9", NUMBER_TO_LETTER_TABLE["9"])
	NUMBER, AMOUNT_OF_REPLACEMENTS = string.gsub(NUMBER, " ", "")
	NUMBER, AMOUNT_OF_REPLACEMENTS = string.gsub(NUMBER, ",", "y")
	NUMBER, AMOUNT_OF_REPLACEMENTS = string.gsub(NUMBER, "-", "l")
	
	local ARGUMENTS = string.split(NUMBER,  "y")
	
	if #ARGUMENTS ~= 0 then
		NUMBER = ""
		for INDEX,ARGUMENT in pairs(ARGUMENTS) do
			local SPLITTED = string.split(ARGUMENT, ".")
			if #SPLITTED == 2 then
				ARGUMENT = SPLITTED[1].. "v".. SPLITTED[2]
			end
			if INDEX ~= #ARGUMENTS then
				NUMBER = NUMBER.. ARGUMENT.. "y"
			elseif INDEX == #ARGUMENTS then
				NUMBER = NUMBER.. ARGUMENT
			end
		end
	end
	
	return NUMBER
end

local function DECRYPT_NUMBER(NUMBER)
	NUMBER = tostring(NUMBER)
	local DECRYPTED_NUMBER = NUMBER
	for ACTUAL_NUMBER,EQUAL_LETTER in pairs(NUMBER_TO_LETTER_TABLE) do
		DECRYPTED_NUMBER, AMOUNT_OF_REPLACEMENTS = string.gsub(DECRYPTED_NUMBER, EQUAL_LETTER, ACTUAL_NUMBER)
	end
	return DECRYPTED_NUMBER
end

local function UNPACK_VECTOR3(VECTOR3)
	VECTOR3 = tostring(VECTOR3)
	local ARGUMENTS = string.split(VECTOR3, ",")
	for INDEX, ARGUMENT in pairs(ARGUMENTS) do
		ARGUMENTS[INDEX] = tonumber(ARGUMENT)
	end
	VECTOR3 = Vector3.new(unpack(ARGUMENTS))
	return VECTOR3
end

local LAST_NIL_OBJECT = nil
local fakePlayers = {}

local function InstancePlayer(name, character)
    fakePlayers[name] = {
        Name = name,
        Character = character,
        Parent = game:GetService("Players")
    }
end

local Players = game:GetService("Players")
local gameMeta = getrawmetatable(game)
local old = gameMeta.__index

setreadonly(gameMeta, false)

gameMeta.__index = newcclosure(function(value, desired)
    if checkcaller() then
        if value == Players and fakePlayers[desired] then
            return fakePlayers[desired]
        end
    end

    return old(value, desired)
end)

setreadonly(gameMeta, true)

local connections = {}

local SEND_MESSAGE

om = function(socc)
    getgenv().DebrisPart = socc
    SEND_MESSAGE = function(MESSAGE)
	    if typeof(MESSAGE) == "table" then
	    	socc:Send(game:GetService("HttpService"):JSONEncode(MESSAGE))
	    else
	    	socc:Send(MESSAGE)
	    end
    end
    
    
    for i = 1, #connections do
        local connection = connections[i]
        connection:Disconnect()
    end

table.insert(connections, socc.OnMessage:Connect(function(MESSAGE)
	local TABLE = game:GetService("HttpService"):JSONDecode(MESSAGE)
	if TABLE[1] == "z" then
		local PLAYER_NAME = TABLE[3]
		
		if PLAYER_NAME ~= PLAYER.Name then
		    if not game.Players:FindFirstChild(PLAYER_NAME) then
		        local char = game:GetObjects("rbxassetid://5195737219")[1]
                char.Parent = game.Workspace 
                char.Name = PLAYER_NAME
               InstancePlayer(PLAYER_NAME, workspace[PLAYER_NAME])
		    end
	        wait()
			for PART_NAME, CFRAME_DATA in pairs(TABLE[2][1]) do
				local CHARACTER = chara or workspace:FindFirstChild(PLAYER_NAME)
				--local CHARACTER = workspace:FindFirstChild(PLAYER_NAME)
				local PART = CHARACTER:FindFirstChild(PART_NAME)
				if not CHARACTER:FindFirstChild("LIMBS_GONE") then
					CHARACTER:BreakJoints()
					for _,Part in pairs(CHARACTER:GetChildren()) do
						if table.find(PARTS, Part.Name) then
							Part.Anchored = true
						elseif Part:IsA("Accessory") then
							Part:FindFirstChild("Handle").Anchored = true
						end
					end
					local LIMBS_GONE = Instance.new("NumberValue")
					LIMBS_GONE.Name = "LIMBS_GONE"
					LIMBS_GONE.Value = 1
					LIMBS_GONE.Parent = CHARACTER
				end
				game:GetService("TweenService"):Create(PART, TweenInfo.new(0.1), {Position = UNPACK_VECTOR3(DECRYPT_NUMBER(CFRAME_DATA[1])), Orientation = UNPACK_VECTOR3(DECRYPT_NUMBER(CFRAME_DATA[2]))}):Play()
			end
			for PART_NAME, CFRAME_DATA in pairs(TABLE[2][2]) do
				local CHARACTER = PLAYERS:FindFirstChild(PLAYER_NAME).Character
				--local CHARACTER = workspace:FindFirstChild(PLAYER_NAME)
				local PART = CHARACTER:FindFirstChild(PART_NAME):FindFirstChild("Handle")
				if not CHARACTER:FindFirstChild("LIMBS_GONE") then
					CHARACTER:BreakJoints()
					for _,Part in pairs(CHARACTER:GetChildren()) do
						if table.find(PARTS, Part.Name) then
							Part.Anchored = true
						elseif Part:IsA("Accessory") then
							Part:FindFirstChild("Handle").Anchored = true
						end
					end
					local LIMBS_GONE = Instance.new("NumberValue")
					LIMBS_GONE.Name = "LIMBS_GONE"
					LIMBS_GONE.Value = 1
					LIMBS_GONE.Parent = CHARACTER
				end
				game:GetService("TweenService"):Create(PART, TweenInfo.new(0.1), {Position = UNPACK_VECTOR3(DECRYPT_NUMBER(CFRAME_DATA[1])), Orientation = UNPACK_VECTOR3(DECRYPT_NUMBER(CFRAME_DATA[2]))}):Play()
			end
		end
	end
end))

local CHARACTER = PLAYER.Character

table.insert(connections, game:GetService("RunService").Stepped:Connect(function()
	local PACKED_DATA = {
		[1] = "z",
		[2] = {
			[1] = {},
			[2] = {}
		},
		[3] = PLAYER.Name,
	}
	
	for _,PART in pairs(CHARACTER:GetChildren()) do
		if table.find(PARTS, PART.Name) then
			PACKED_DATA[2][1][PART.Name] = {
				[1] = ENCRYPT_NUMBER(PART.Position),
				[2] = ENCRYPT_NUMBER(PART.Orientation)
			}
		elseif PART:IsA("Accessory") and table.find(ACCESSORIES, PART.Name) then
			PACKED_DATA[2][2][PART.Name] = {
				[1] = ENCRYPT_NUMBER(PART:FindFirstChild("Handle").Position),
				[2] = ENCRYPT_NUMBER(PART:FindFirstChild("Handle").Orientation)
			}
		end
	end
	
	SEND_MESSAGE(PACKED_DATA)
	game:GetService("RunService").Stepped:Wait()
end))

table.insert(connections, PLAYER.CharacterAdded:Connect(function(CHARACTER)
	spawn(function()
		repeat
			local PACKED_DATA = {
				[1] = "z",
				[2] = {
					[1] = {},
					[2] = {}
				},
				[3] = PLAYER.Name,
			}
			
			for _,PART in pairs(CHARACTER:GetChildren()) do
				if table.find(PARTS, PART.Name) then
					PACKED_DATA[2][1][PART.Name] = {
						[1] = ENCRYPT_NUMBER(PART.Position),
						[2] = ENCRYPT_NUMBER(PART.Orientation)
					}
				elseif PART:IsA("Accessory") and table.find(ACCESSORIES, PART.Name) then
					PACKED_DATA[2][2][PART.Name] = {
						[1] = ENCRYPT_NUMBER(PART:FindFirstChild("Handle").Position),
						[2] = ENCRYPT_NUMBER(PART:FindFirstChild("Handle").Orientation)
					}
				end
			end
			
			SEND_MESSAGE(PACKED_DATA)
			game:GetService("RunService").Stepped:Wait()
		until CHARACTER.Parent == nil
	end)
end))

table.insert(connections, socc.OnClose:Connect(function()
    bruh = false
    print("Websocket was closed.")
    notify("Websocket restarting..")
    while bruh == false do
    local succ,err = pcall(function()
        ws = syn.websocket.connect(url)
        notify("Websocket failed to restart, trying again.")
    end)
    if succ then
        om(ws)
        bruh = true
        notify("Websocket restarted successfully")
    end
    end
end))

end


om(ws)

notify("Clientserver has successfully loaded.", warn("Clientserver loaded."))
wait(2)
notify("delays WILL happen.")
