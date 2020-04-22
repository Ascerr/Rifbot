RIFBOT_VERSION = "1.63"

--[[
	RifbotLuaLib

	Global
	Rifbot
	Module
	Self
	Creature
	Map
	Container
	Proxy
	Misc

]]

--> Note: 
-->		1. To print boolean with string you have to use additional printf("print boolean: " .. tostring(true))

--> Alarms files from Rifbot\Alarms
RIFBOT_SOUNDS = {
	"Default.mp3", 
	"Creature Detected.mp3", 
	"Disconnected.mp3", 
	"Low Health.mp3", 
	"Low Mana.mp3", 
	"Macro Test.wav", 
	"No Capity.mp3", 
	"No Mana Regen.mp3", 
	"Out Of Blanks.mp3", 
	"Player Attack.mp3", 
	"Player On Screen.mp3", 
	"Private Message.mp3", 
	-- add your here,
	"VIP Online.mp3"
}

--> Directions
NORTH = 0
EAST = 1
SOUTH = 2
WEST = 3
SOUTHWEST = 4
SOUTHEAST = 5
NORTHWEST = 6
NORTHEAST = 7

--> Containers index
CONTAINER_BASEINDEX = 64
EQUIPMENT_BASEINDEX = 1

--> Attack types
ATTACK_TYPE_STAND = 0
ATTACK_TYPE_FOLLOW = 1

--> Attack mods
ATTACK_MODE_FULLATTACK = 1
ATTACK_MODE_BALANCED = 2
ATTACK_MODE_FULLDEFENSE = 3

--> Pvp mods
PVP_AGRESSIVE = 0
PVP_FRIENDLY = 1

--> Speak types
SPEAK_SAY = 1
SPEAK_WHISPER = 2
SPEAK_YELL = 3

--> Equipment slots
SLOT_HEAD = 0
SLOT_AMULET = 1
SLOT_BACKPACK = 2
SLOT_ARMOR = 3
SLOT_SHIELD = 4
SLOT_WEAPON = 5
SLOT_LEGS = 6
SLOT_FEET = 7
SLOT_RING = 8
SLOT_AMMO = 9

--> Self flags
FLAG_ISPOISIONED = 1
FLAG_ISBURNING = 2
FLAG_ISELECTRYFIED = 4
FLAG_ISDRUNK = 8
FLAG_ISMANASHIELDED = 16
FLAG_ISPARALYZED = 32
FLAG_ISHASTED = 64
FLAG_ISINFIGHT = 128

--> Channels *need to add more
CHANNEL_ADVERTISING = 6

--> Creatures ids limit
CREATURE_PLAYER_LIMIT = 1073741824
CREATURE_NPC_LIMIT = 2000000000

--> Party status
PARTY_LEADER_INVITING = 1
PARTY_MEMBER_INVITED = 2
PARTY_MEMBER = 3
PARTY_LEADER = 4

--> Skull types
SKULL_NONE = 0
SKULL_YELLOW = 1
SKULL_GREEN = 2
SKULL_WHITE = 3
SKULL_RED = 4

--> Fluids *Old tibia store fluids as one id and count is flag to "mana", "fluid" etc.
MANA_FLUID = {id = 2874, count = 7}

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--+
--+     						8888888b.  d8b  .d888 888               888         .d8888b.  888                            
--+     						888   Y88b Y8P d88P"  888               888        d88P  Y88b 888                            
--+     						888    888     888    888               888        888    888 888                            
--+     						888   d88P 888 888888 88888b.   .d88b.  888888     888        888  8888b.  .d8888b  .d8888b  
--+     						8888888P"  888 888    888 "88b d88""88b 888        888        888     "88b 88K      88K      
--+     						888 T88b   888 888    888  888 888  888 888        888    888 888 .d888888 "Y8888b. "Y8888b. 
--+     						888  T88b  888 888    888 d88P Y88..88P Y88b.      Y88b  d88P 888 888  888      X88      X88 
--+     						888   T88b 888 888    88888P"   "Y88P"   "Y888      "Y8888P"  888 "Y888888  88888P'  88888P' 
--+
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Rifbot = {}


----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Rifbot.isEnabled()
--> Description: 	Get current bot status.
--> Class: 			Rifbot
--> Params: 		None
--> Return: 		boolean true or false.
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Rifbot.isEnabled()
	return getBotState()
end	

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Rifbot.setEnabled(state)
--> Description: 	Enable or disable bot.
--> Class: 			Rifbot
--> Params: 		
-->					@state - boolean true or false
--> Return: 		boolean true or false.
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Rifbot.setEnabled(state)
	return setBotEnabled(state)
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Rifbot.isMacroMode()
--> Description: 	Get macro mode status, check if afk functions such as Fishing, Runemaker, AntiIdle, FoodEater and Mod: Skill Trainer are paused.
--> Class: 			Rifbot
--> Params: 		None
--> Return: 		boolean true or false.
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Rifbot.isMacroMode()
	return getMacroMode()
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Rifbot.setMacroMode(state)
--> Description: 	Enable or disable afk functions such as Fishing, Runemaker, AntiIdle, FoodEater and Mod: Skill Trainer.
--> Class: 			Rifbot
--> Params: 		
-->					@state - boolean true or false
--> Return: 		boolean true or false.
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Rifbot.setMacroMode(state)
	return setMacroState(state)
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Rifbot.getMacroMode()
--> Description: 	Get macro code, flashing letters on screen.
--> Class: 			Rifbot
--> Params: 		None
--> Return: 		string code or "".
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Rifbot.getMacroCode()
	return getMacroCode()
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Rifbot.ConsoleWrite(text)
--> Description: 	Set text to bot console
--> Class: 			Rifbot
--> Params: 		
-->					@text - string to write
--> Return: 		boolean true or false.
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Rifbot.ConsoleWrite(text)
	if type(text) == "boolean" then
		text = tostring(text)
	end	
	return consoleWrite(text)
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Rifbot.PlaySound(sound)
--> Description: 	Plays sound and flash game window.
--> Class: 			Rifbot
--> Params: 		
-->					@sound - string -> name of file from RIFBOT_SOUNDS or number -> RIFBOT_SOUNDS[sound] index.
--> Return: 		boolean true or false.
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Rifbot.PlaySound(sound)
	local t = type(sound)
	if t == "nil" then
		sound = RIFBOT_SOUNDS[0]
	elseif t == "number" then
		if sound > (table.count(RIFBOT_SOUNDS) - 1) then
			sound = RIFBOT_SOUNDS[0]
		else
			sound = RIFBOT_SOUNDS[sound]
		end
	elseif t == "string" then
		if not table.find(RIFBOT_SOUNDS, sound) then 
			sound = RIFBOT_SOUNDS[0] 
		end					
	end
	return playSound(sound)
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Rifbot.getClientInfo()
--> Description: 	Read information about injected client.
--> Class: 			Rifbot
--> Params: 		None
--> Return: 		table {pid = ?, hwnd = ?, base = ?, time = ?}.
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Rifbot.getClientInfo()
	return getClientInfo()
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Rifbot.MemoryRead(addr, retn)
--> Description: 	Read game client memory address.
--> Class: 			Rifbot
--> Params:
-->					@addr - number address in memory to read. Remeber to add base address returned by Rifbot.getClientInfo().base
-->					@retn - (default = "dword") returns type. Try with "char[36]" - read string, "byte" - read 1 byte, 
-->						"ushort" - read 2 byte, "double" or "byte[4]" - direct read bytes.  
--> Return: 		string containing memory value.
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Rifbot.MemoryRead(addr, retn)
	if retn == nil then 
		retn = "dword" 
	end
	return memoryRead(addr, retn)	 
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Rifbot.MemoryWrite(addr, value, retn)
--> Description: 	Write data to game clinet memory address.
--> Class: 			Rifbot
--> Params:
-->					@addr - number address in memory to read. Remeber to add base address returned by Rifbot.getClientInfo().base
-->					@value - data to write.
-->					@retn - (default = "dword") returns type. Try with "char[36]" - read string, "byte" - read 1 byte, 
-->						"ushort" - read 2 byte, "double" or "byte[4]" - direct read bytes.  
--> Return: 		boolean true or false.
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Rifbot.MemoryWrite(addr, value, retn)
	if retn == nil then 
		retn = "dword" 
	end
	return memoryWrite(addr, value, retn)	 
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Rifbot.PressKey(key, delay)
--> Description: 	Press key to game client in background.
--> Class: 			Rifbot
--> Params:
-->					@key - number key e.g. 112 = F1 look here: http://www.kbdedit.com/manual/low_level_vk_list.html
-->					@delay - number miliseconds execution delay (delault random(200, 400).
--> Return: 		boolean true or false.
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Rifbot.PressKey(key, delay)
	if delay == nil then 
		delay = math.random(200, 400) 
	end
	return pressKey(key, delay)	 
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Rifbot.MouseClick(x, y, side)
--> Description: 	Click mouse to game client in background. 
--> Class: 			Rifbot
--> Params:
-->					@x - number position x on game client.
-->					@y - number position y on game client.
-->					@side - number 0 = left mouse, 1 = right mouse.
--> Return: 		boolean true or false.
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Rifbot.MouseClick(x, y, side)
	if side == nil then 
		side = 0
	end
	return mouseClick(x, y, side)	 
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Rifbot.ExecuteScript(script, onOff)
--> Description: 	Execute lua script to scripter console.
--> Class: 			Rifbot
--> Params:
-->					@script - string name of script *without ".lua" e.g "Player Logout"
-->					@onOff - boolean true or false.
--> Return: 		boolean true or false.
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Rifbot.ExecuteScript(script, onOff)
	if onOff == nil then
		onOff = false
	end	
	return executeScript(script, onOff)	 
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Rifbot.KillScript(script)
--> Description: 	Kill lua script from scripter console.
--> Class: 			Rifbot
--> Params:
-->					@script - string name of script *without ".lua" e.g "Player Logout"
--> Return: 		boolean true or false.
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Rifbot.KillScript(script)
	return killScript(script)	 
end


----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Rifbot.ScriptIsRunning(script)
--> Description: 	Read state of lua script.
--> Class: 			Rifbot
--> Params:
-->					@script - string name of script *without ".lua" e.g "Player Logout"
--> Return: 		boolean true or false.
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Rifbot.ScriptIsRunning(script)
	return scriptIsRunning(script)	 
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--+
--+      				888b     d888               888          888               .d8888b.  888                            
--+      				8888b   d8888               888          888              d88P  Y88b 888                            
--+      				88888b.d88888               888          888              888    888 888                            
--+      				888Y88888P888  .d88b.   .d88888 888  888 888  .d88b.      888        888  8888b.  .d8888b  .d8888b  
--+      				888 Y888P 888 d88""88b d88" 888 888  888 888 d8P  Y8b     888        888     "88b 88K      88K      
--+     			    888  Y8P  888 888  888 888  888 888  888 888 88888888     888    888 888 .d888888 "Y8888b. "Y8888b. 
--+      				888   "   888 Y88..88P Y88b 888 Y88b 888 888 Y8b.         Y88b  d88P 888 888  888      X88      X88 
--+      				888       888  "Y88P"   "Y88888  "Y88888 888  "Y8888       "Y8888P"  888 "Y888888  88888P'  88888P' 
--+
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Module = {}
libModules = {}
Module.__index = Module
modulesRegistered = false
Module.__routine = nil
Module.__routineTime = 0

--- This function should not be used by the regular user and is therefore not explained
function libOnTimer()
	if Module.__routine == nil or coroutine.status(Module.__routine) == "dead" then
		Module.__routine = coroutine.create(function ()
			if (#libModules > 0) then
				for i, m in ipairs(libModules) do
					if (m._tempDelay < (os.clock()*1000) and m._tempDelay > 0 and not m._active) then
						m.delayTime = 0
						m._active = true
					end
					if (m._active) then
						m:Execute()
					end
				end
			end
		end)
		coroutine.resume(Module.__routine)
	else	
		if os.clock() > Module.__routineTime then
			Module.__routineTime = 0
			coroutine.resume(Module.__routine)
		end
	end				
end

--- This function should not be used by the regular user and is therefore not explained
function libDestroyTimer(name)
	for i, m in ipairs(libModules) do
		if (m:Name() == name) then
			m:Stop()
			table.remove(libModules, i)
			break
		end
	end
end

--- This function should not be used by the regular user and is therefore not explained
function sleep(deltaTime)
	if Module.__routine == nil then
		return false -- no coroutine created.
	end	
	if deltaTime < 200 then
		deltaTime = 200
	end	
	Module.__routineTime = os.clock() + (deltaTime / 1000)
	coroutine.yield()
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Module.New(name, moduleFunction, startOnCreate)
--> Description: 	Registers the specified function to loop as a module.
--> Class: 			Module
--> Params:
-->					@name the name to identify the module as
-->					moduleFunction the function to be executed
-->					startOnCreate optional; whether to execute on create or not default is true
--> Return: 		metatable for module.
--> Credits:		Xenobot
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Module.New(name, moduleFunction, startOnCreate)
	local m = {}
	startOnCreate = (startOnCreate ~= false) and true or false
	if (moduleFunction) then -- adding new
		if (not modulesRegistered) then
			registerNativeEventListener('libOnTimer')
			modulesRegistered = true
		end
		libDestroyTimer(name) -- replace any with same name
		setmetatable(m, Module)
		m._name = name
		m._function = moduleFunction
		m._active = startOnCreate
		m._tempDelay = 0
		table.insert(libModules, m)
	else -- retrieving
		for i, mod in ipairs(libModules) do
			if (mod:Name() == name) then
				m = mod
				break
			end
		end
	end
	return m
end

setmetatable(Module, {__call = function(_, ...) return Module.New(...) end})

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Module:Execute()
--> Description: 	Executes a specific module. Manually triggers the module function
--> Class: 			Module
--> Params:			None
--> Return: 		ambiguous anything the function being called might return
--> Credits:		Xenobot
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Module:Execute()
	self = type(self) == 'table' and self or Module.New(self)
	
	if (type(self._function) == 'string') then
		self._function = _G[self._function]
	end
	return self:_function()
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Module:Name()
--> Description: 	Check the name that the module was registered under
--> Class: 			Module
--> Params:			None
--> Return: 		string the module name
--> Credits:		Xenobot
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Module:Name()
	return self._name
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Module:IsActive()
--> Description: 	Check the module running status
--> Class: 			Module
--> Params:			None
--> Return: 		boolean module status
--> Credits:		Xenobot
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Module:IsActive()
	self = type(self) == 'table' and self or Module.New(self)
	return self._active
end
 
----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Module:Start()
--> Description: 	Starts the module. Sets the module to active to start executing the function
--> Class: 			Module
--> Params:			None
--> Return: 		void returns nothing
--> Credits:		Xenobot
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Module:Start()
	self = type(self) == 'table' and self or Module.New(self)
	self._active = true
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Module:Delay(a, b)
--> Description: 	Delays the module. Pauses the module for a specific amount of time
--> Class: 			Module
--> Params:			
-->					@a amount of time in milliseconds to delay the module
-->					@b (optional) set random delay between a and b math.random(a, b)
--> Return: 		void returns nothing
--> Credits:		Xenobot
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Module:Delay(a, b)
	local delay = a
	if b ~= nil then
		delay = math.random(a, b)
	end	
	self = type(self) == 'table' and self or Module.New(self)
	self._tempDelay = (os.clock() * 1000) + delay
	self._active = false
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Module:Stop()
--> Description: 	Stops the module permanently
--> Class: 			Module
--> Params:			None
--> Return: 		void returns nothing
--> Credits:		Xenobot
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Module:Stop()
	self = type(self) == 'table' and self or Module.New(self)
	self._active = false
	self._tempDelay = 0
end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--+
--+     						 .d8888b.            888  .d888      .d8888b.  888                            
--+     						 d88P  Y88b          888 d88P"      d88P  Y88b 888                            
--+     						 Y88b.               888 888        888    888 888                            
--+     						  "Y888b.    .d88b.  888 888888     888        888  8888b.  .d8888b  .d8888b  
--+     						     "Y88b. d8P  Y8b 888 888        888        888     "88b 88K      88K      
--+     						       "888 88888888 888 888        888    888 888 .d888888 "Y8888b. "Y8888b. 
--+     						 Y88b  d88P Y8b.     888 888        Y88b  d88P 888 888  888      X88      X88 
--+     						  "Y8888P"   "Y8888  888 888         "Y8888P"  888 "Y888888  88888P'  88888P' 
--+
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Self = {}

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.Health()
--> Description: 	Read self character health points.
--> Class: 			Self
--> Params:			None
--> Return: 		number
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.Health()
	return selfHealth()	 
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.HealthMax()
--> Description: 	Read self character max health points.
--> Class: 			Self
--> Params:			None
--> Return: 		number
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.HealthMax()
	return selfHealthMax()	 
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.HealthPercent()
--> Description: 	Read self character health percent.
--> Class: 			Self
--> Params:			None
--> Return: 		number
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.HealthPercent()
	local n = selfHealth()
	if n <= 0 then 
		return 0 
	end
	return math.floor(n / selfHealthMax() * 100)	 
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.Mana()
--> Description: 	Read self character mana points.
--> Class: 			Self
--> Params:			None
--> Return: 		number
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.Mana()
	return selfMana()	 
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.ManaMax()
--> Description: 	Read self character max mana points.
--> Class: 			Self
--> Params:			None
--> Return: 		number
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.ManaMax()
	return selfManaMax()	 
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.ManaPercent()
--> Description: 	Read self character mana percent.
--> Class: 			Self
--> Params:			None
--> Return: 		number
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.ManaPercent()
	local n = selfMana()
	if n <= 0 then 
		return 0 
	end
	return math.floor(n / selfManaMax() * 100)	 
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.ManaMax()
--> Description: 	Read self character max mana points.
--> Class: 			Self
--> Params:			None
--> Return: 		number
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.Capity()
	return selfCapity()	 
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.MagicLevel()
--> Description: 	Read self character magic level.
--> Class: 			Self
--> Params:			None
--> Return: 		number
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.MagicLevel()
	return selfMagicLevel()	 
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.Position()
--> Description: 	Read self character position.
--> Class: 			Self
--> Params:			None
--> Return: 		table {x = ?, y = ?, z = ?}
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.Position()
	return selfPosition()	 
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.Name()
--> Description: 	Read self character name.
--> Class: 			Self
--> Params:			None
--> Return: 		string
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.Name()
	return selfName()	 
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.ID()
--> Description: 	Read self character id.
--> Class: 			Self
--> Params:			None
--> Return: 		number
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.ID()
	return selfID()	 
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.Direction()
--> Description: 	Read self character direction.
--> Class: 			Self
--> Params:			None
--> Return: 		number
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.Direction()
	return selfDirection()	 
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.TargetID()
--> Description: 	Read self character target id.
--> Class: 			Self
--> Params:			None
--> Return: 		number
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.TargetID()
	return selfTargetID()	 
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.isPoisioned()
--> Description: 	Read self character flag.
--> Class: 			Self
--> Params:			None
--> Return: 		boolean true or false
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.isPoisioned()
	return selfIsFlag(FLAG_ISPOISIONED)	 
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.isBurning()
--> Description: 	Read self character flag.
--> Class: 			Self
--> Params:			None
--> Return: 		boolean true or false
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.isBurning()
	return selfIsFlag(FLAG_ISBURNING)	 
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.isElectryfing()
--> Description: 	Read self character flag.
--> Class: 			Self
--> Params:			None
--> Return: 		boolean true or false
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.isElectryfing()
	return selfIsFlag(FLAG_ISELECTRYFIED)	 
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.isDrunk()
--> Description: 	Read self character flag.
--> Class: 			Self
--> Params:			None
--> Return: 		boolean true or false
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.isDrunk()
	return selfIsFlag(FLAG_ISDRUNK)	 
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.isManaShielded()
--> Description: 	Read self character flag.
--> Class: 			Self
--> Params:			None
--> Return: 		boolean true or false
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.isManaShielded()
	return selfIsFlag(FLAG_ISMANASHIELDED)	 
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.isParalyzed()
--> Description: 	Read self character flag.
--> Class: 			Self
--> Params:			None
--> Return: 		boolean true or false
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.isParalyzed()
	return selfIsFlag(FLAG_ISPARALYZED)	 
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.isHasted()
--> Description: 	Read self character flag.
--> Class: 			Self
--> Params:			None
--> Return: 		boolean true or false
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.isHasted()
	return selfIsFlag(FLAG_ISHASTED)	 
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.isInFight()
--> Description: 	Read self character flag.
--> Class: 			Self
--> Params:			None
--> Return: 		boolean true or false
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.isInFight()
	return selfIsFlag(FLAG_ISINFIGHT)	 
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.Head()
--> Description: 	Read self character equipment slot.
--> Class: 			Self
--> Params:			None
--> Return: 		table = {id = ?, count = ?}
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.Head()
	return selfGetEquipmentSlot(SLOT_HEAD)	 
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.Amulet()
--> Description: 	Read self character equipment slot.
--> Class: 			Self
--> Params:			None
--> Return: 		table = {id = ?, count = ?}
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.Amulet()
	return selfGetEquipmentSlot(SLOT_AMULET)	 
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.Backpack()
--> Description: 	Read self character equipment slot.
--> Class: 			Self
--> Params:			None
--> Return: 		table = {id = ?, count = ?}
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.Backpack()
	return selfGetEquipmentSlot(SLOT_BACKPACK)	 
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.Armor()
--> Description: 	Read self character equipment slot.
--> Class: 			Self
--> Params:			None
--> Return: 		table = {id = ?, count = ?}
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.Armor()
	return selfGetEquipmentSlot(SLOT_ARMOR)	 
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.Shield()
--> Description: 	Read self character equipment slot.
--> Class: 			Self
--> Params:			None
--> Return: 		table = {id = ?, count = ?}
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.Shield()
	return selfGetEquipmentSlot(SLOT_SHIELD)	 
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.Weapon()
--> Description: 	Read self character equipment slot.
--> Class: 			Self
--> Params:			None
--> Return: 		table = {id = ?, count = ?}
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.Weapon()
	return selfGetEquipmentSlot(SLOT_WEAPON)	 
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.Legs()
--> Description: 	Read self character equipment slot.
--> Class: 			Self
--> Params:			None
--> Return: 		table = {id = ?, count = ?}
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.Legs()
	return selfGetEquipmentSlot(SLOT_LEGS)	 
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.Feet()
--> Description: 	Read self character equipment slot.
--> Class: 			Self
--> Params:			None
--> Return: 		table = {id = ?, count = ?}
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.Feet()
	return selfGetEquipmentSlot(SLOT_FEET)	 
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.Ring()
--> Description: 	Read self character equipment slot.
--> Class: 			Self
--> Params:			None
--> Return: 		table = {id = ?, count = ?}
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.Ring()
	return selfGetEquipmentSlot(SLOT_RING)	 
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.Ammo()
--> Description: 	Read self character equipment slot.
--> Class: 			Self
--> Params:			None
--> Return: 		table = {id = ?, count = ?}
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.Ammo()
	return selfGetEquipmentSlot(SLOT_AMMO)	 
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.isConnected()
--> Description: 	Read self connection to game.
--> Class: 			Self
--> Params:			None
--> Return: 		boolean true or false
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.isConnected()
	return selfIsConnected()	 
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.DistanceFromPosition(x, y, z)
--> Description: 	Get distance between your character and position location x, y, z.
--> Class: 			Self
--> Params:			
-->					@x coordinate in the map on the x-axis
-->					@y coordinate in the map on the y-axis
-->					@z coordinate in the map on the z-axis
--> Return: 		number
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.DistanceFromPosition(x, y, z)
	local selfloc = Self.Position()
	local absx = math.abs(selfloc.x - x)
	local absy = math.abs(selfloc.y - y)
	if absy > absx then
		return absy
	else
		return absx
	end		
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.CanCastSpell(spell)
--> Description: 	Read self magic level and mana required for cast spell.
--> Class: 			Self
--> Params:			
-->					@spell - string spell to check.
--> Return: 		boolean true or false
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.CanCastSpell(spell)
	return selfCanCastSpell(spell)	 
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.getPositionFromDirection(direction, len)
--> Description: 	Get position {x, y, z} from direction.
--> Class: 			Self
--> Params:			
-->					@direction - number 0-7 or NORTH, EAST etc.
-->					@len - number distance betweeen self and reach position.
--> Return: 		table {x = ?, y = ?, z = ?}
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.getPositionFromDirection(direction, len)
	local self = Self.Position()
	if self.x == 0 then
		return {x = 0, y = 0, z = 0}
	end
	if len == 0 or len == nil then
		len = 1
	end	
	if direction == 0 then
		return {x = self.x, y = self.y - len, z = self.z}
	elseif direction == 1 then
		return {x = self.x + len, y = self.y, z = self.z}
	elseif direction == 2 then
		return {x = self.x, y = self.y + len, z = self.z}
	elseif direction == 3 then
		return {x = self.x - len, y = self.y, z = self.z}	
	elseif direction == 4 then
		return {x = self.x + len, y = self.y - len, z = self.z}	
	elseif direction == 5 then
		return {x = self.x + len, y = self.y + len, z = self.z}	
	elseif direction == 6 then
		return {x = self.x - len, y = self.y + len, z = self.z}	
	elseif direction == 7 then
		return {x = self.x - len, y = self.y - len, z = self.z}			
	else
		return {x = self.x, y = self.y, z = self.z}
	end		
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.getDirectionFromPosition(x, y, z, len)
--> Description: 	Get direction from pos x, y, z.
--> Class: 			Self
--> Params:				
-->					@x coordinate in the map on the x-axis
-->					@y coordinate in the map on the y-axis
-->					@z coordinate in the map on the z-axis
-->					@len - number distance betweeen self and reach position.
--> Return: 		number
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.getDirectionFromPosition(x, y, z, len) 
	local self = Self.Position()
	if len == 0 or len == nil then
		len = 1
	end	
	if self.x == x and self.y - len == y then
		return 0
	elseif self.x + len == x and self.y == y then
		return 1
	elseif self.x == x and self.y + len == y then
		return 2
	elseif self.x - len == x and self.y == y then
		return 3
	elseif self.x + len == x and self.y - len == y then
		return 4
	elseif self.x + len == x and self.y + len == y then
		return 5
	elseif self.x - len == x and self.y + len == y then
		return 6
	elseif self.x - len == x and self.y - len == y then
		return 7
	else
		return 0
	end	
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.isStandAttack()
--> Description: 	Read self attack type.
--> Class: 			Self
--> Params:			None
--> Return: 		boolean true or false
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.isStandAttack()
	return selfAttackType()	== ATTACK_TYPE_STAND
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.isFollowAttack()
--> Description: 	Read self attack type.
--> Class: 			Self
--> Params:			None
--> Return: 		boolean true or false
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.isFollowAttack()
	return selfAttackType()	== ATTACK_TYPE_FOLLOW
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.isFullAttackMode()
--> Description: 	Read self attack mode.
--> Class: 			Self
--> Params:			None
--> Return: 		boolean true or false
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.isFullAttackMode()
	return selfAttackMode()	== ATTACK_MODE_FULLATTACK
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.isBalancedMode()
--> Description: 	Read self attack mode.
--> Class: 			Self
--> Params:			None
--> Return: 		boolean true or false
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.isBalancedMode()
	return selfAttackMode()	== ATTACK_MODE_BALANCED
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.isFullDefenseMode()
--> Description: 	Read self attack mode.
--> Class: 			Self
--> Params:			None
--> Return: 		boolean true or false
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.isFullDefenseMode()
	return selfAttackMode()	== ATTACK_MODE_FULLDEFENSE
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.CanAttackPlayers()
--> Description: 	Read self pvp mode.
--> Class: 			Self
--> Params:			None
--> Return: 		boolean true or false
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.CanAttackPlayers()
	local pvp = selfPvpMode()
	if pvp == PVP_AGRESSIVE then 
		return true
	elseif pvp == PVP_FRIENDLY then
		return false
	else
		return "Rifbot: failed to read selfPvpMode()."
	end					 
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.isInvisible()
--> Description: 	Read self invisibility.
--> Class: 			Self
--> Params:			None
--> Return: 		boolean true or false
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.isInvisible()
	return selfIsInvisible()
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.isWalking()
--> Description: 	Read self walking state.
--> Class: 			Self
--> Params:			None
--> Return: 		boolean true or false
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.isWalking()
	return selfIsWalking()
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.Speak(text, type)
--> Description: 	Send message to default channel.
--> Class: 			Self
--> Params:			
-->					@text - string message to say.
-->					@type - number 1-3 or SPEAK_SAY, SPEAK_WHISPER, SPEAK_YELL
--> Return: 		boolean true or false
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.Speak(text, mode)
	if mode < SPEAK_SAY or mode > SPEAK_YELL then
		mode = SPEAK_SAY
	end	
	return selfSpeak(text, mode)
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.Say(text)
--> Description: 	Say message on default channel.
--> Class: 			Self
--> Params:			
-->					@text - string message to say.
--> Return: 		boolean true or false
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.Say(text)
	return Self.Speak(text, SPEAK_SAY)
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.Whisper(text)
--> Description: 	Whisper message on default channel.
--> Class: 			Self
--> Params:			
-->					@text - string message to say.
--> Return: 		boolean true or false
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.Whisper(text)
	return Self.Speak(text, SPEAK_WHISPER)
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.Yell(text)
--> Description: 	Yell message on default channel.
--> Class: 			Self
--> Params:			
-->					@text - string message to say.
--> Return: 		boolean true or false
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.Yell(text)
	return Self.Speak(text, SPEAK_YELL)
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.SayOnChannel(text, channel)
--> Description: 	Send message to channel.
--> Class: 			Self
--> Params:			
-->					@text - string message to say.
-->					@channel - number id of channel e.g. CHANNEL_ADVERTISING
--> Return: 		boolean true or false
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.SayOnChannel(text, channel)
	if channel == nil then
		channel = CHANNEL_ADVERTISING
	end	
	return selfSpeakOnChannel(text, channel)
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.CastSpell(spell, mana, delay)
--> Description: 	Cast spell checking mana, magic level (build-in) and delay.
--> Class: 			Self
--> Params:			
-->					@spell - string spell name to cast.
-->					@mana - number minimal mana need to cast spell.
-->					@delay - number execution delay (default math.random(200, 350))
--> Return: 		boolean true or false
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.CastSpell(spell, mana, delay)
	if mana == nil then
		mana = 0
	end
	if delay == nil then
		delay = math.random(200, 350)
	end			
	return selfCastSpell(spell, mana, delay)
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.PrivateMessage(player, message, delay)
--> Description: 	Send private message to player.
--> Class: 			Self
--> Params:			
-->					@player - string name of receiver.
-->					@message - string text to send.
-->					@delay - number execution delay (default math.random(200, 350))
--> Return: 		boolean true or false
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.PrivateMessage(player, message, delay)
	if delay == nil then
		delay = math.random(200, 350)
	end			
	return selfPrivateMessage(player, message, delay)
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.UseItemWithMe(itemid, delay)
--> Description: 	Use itemid with self character id.
--> Class: 			Self
--> Params:			
-->					@itemid - number using item.
-->					@delay - number execution delay (default math.random(900, 1400))
--> Return: 		boolean true or false
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.UseItemWithMe(itemid, delay)
	if delay == nil then
		delay = math.random(900, 1400)
	end			
	return selfUseItemWithMe(itemid, delay)
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.UseItemWithGround(itemid, x, y, z, delay)
--> Description: 	Use itemid with ground x, y, z.
--> Class: 			Self
--> Params:			
-->					@itemid - number using item.
-->					@x coordinate in the map on the x-axis
-->					@y coordinate in the map on the y-axis
-->					@z coordinate in the map on the z-axis
-->					@delay - number execution delay (default math.random(1400, 2100))
--> Return: 		boolean true or false
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.UseItemWithGround(itemid, x, y, z, delay)
	if delay == nil then
		delay = math.random(1400, 2100)
	end			
	return selfUseItemWithGround(itemid, x, y, z, delay)
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.UseItem(itemid, newIndex, delay)
--> Description: 	Use itemid with self character id.
--> Class: 			Self
--> Params:			
-->					@itemid - number using item.
-->					@newIndex - boolean true or false open as new index or not
-->					@delay - number execution delay (default math.random(300, 900))
--> Return: 		boolean true or false
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.UseItem(itemid, newIndex, delay)
	if newIndex == nil then
		newIndex = false
	end	
	if delay == nil then
		delay = math.random(300, 900)
	end			
	return selfUseItem(itemid, newIndex, delay)
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.UseItemWithCreature(creature, itemid, delay)
--> Description: 	Use itemid with creature.
--> Class: 			Self
--> Params:			
-->					@creature - table returned by Creature.getCreatures(special)
-->					@itemid - number using item.
-->					@delay - number execution delay (default math.random(1500, 2200))
--> Return: 		boolean true or false
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.UseItemWithCreature(creature, itemid, delay)
	if type(creature) ~= "table" then
		return false
	end	
	if delay == nil then
		delay = math.random(1500, 2200)
	end			
	return selfUseItemWithCreature(creature, itemid, delay)
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.EquipItem(slot, itemid, count, delay)
--> Description: 	Equip item id with quntity do equipment slot.
--> Class: 			Self
--> Params:			
-->					@slot - number 0-9 or SLOT_HELMET etc.
-->					@itemid - number using item.
-->					@count - number amount of items to equip.
-->					@delay - number execution delay (default math.random(700, 1300))
--> Return: 		boolean true or false
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.EquipItem(slot, itemid, count, delay)
	if count == nil then
		count = 1
	end	
	if delay == nil then
		delay = math.random(700, 1300)
	end			
	return selfEquipItem(slot, itemid, count, delay)
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.EquipItemFromGround(slot, x, y, z, itemid, count, delay)
--> Description: 	Pickup item from ground to equipment slot.
--> Class: 			Self
--> Params:			
-->					@slot - number 0-9 or SLOT_HELMET etc.
-->					@x coordinate in the map on the x-axis
-->					@y coordinate in the map on the y-axis
-->					@z coordinate in the map on the z-axis
-->					@itemid - number item id.
-->					@count - number amount.
-->					@delay - number execution delay (default math.random(900, 1800))
--> Return: 		boolean true or false
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.EquipItemFromGround(slot, x, y, z, itemid, count, delay)	
	if slot < SLOT_HEAD or slot > SLOT_AMMO then
		slot = SLOT_WEAPON
	end	
	if count == nil then
		count = 1
	elseif count > 100 then
		count = 100
	end
	if delay == nil then
		delay = math.random(900, 1800)
	end		
	return selfPickupItem(x, y, z, itemid, count, slot + EQUIPMENT_BASEINDEX, 0, delay)
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.DequipItem(slot, contNr, contSlot, delay)
--> Description: 	Equip item id with quntity do equipment slot.
--> Class: 			Self
--> Params:			
-->					@slot - number 0-9 or SLOT_HELMET etc.
-->					@contNr - number destination container index 0-15. (default -1: find any empty)
-->					@contSlot - number destination slot in container index 0-32. (default -1: find any empty)
-->					@delay - number execution delay (default math.random(750, 1400))
--> Return: 		boolean true or false
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.DequipItem(slot, contNr, contSlot, delay)
	if contNr == nil then
		contNr = -1
	end	
	if contSlot == nil then
		contSlot = -1
	end	
	if delay == nil then
		delay = math.random(750, 1400)
	end			
	return selfDequipItem(slot, contNr, contSlot, delay)
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.Turn(direction)
--> Description: 	Turn character to direction.
--> Class: 			Self
--> Params:			
-->					@direction - number 0-3 or NORTH, EAST etc.
--> Return: 		boolean true or false
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.Turn(direction)
	if direction < NORTH or direction > WEST then
		direction = 0
	end		
	return selfTurn(direction)
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.Logout()
--> Description: 	Logout self character.
--> Class: 			Self
--> Params:			None
--> Return: 		boolean true or false
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.Logout()
	return selfLogout()
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.Step(direction)
--> Description: 	Step to direction.
--> Class: 			Self
--> Params:			
-->					@direction - number 0-7 or NORTH, EAST etc.
--> Return: 		boolean true or false
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.Step(direction)
	if direction < NORTH or direction > NORTHEAST then
		direction = 0
	end	
	return selfStep(direction)
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.DropItem(x, y, z, id, count, delay)
--> Description: 	Throw itemid on map x, y, z with special quantity @count. Reading containers and equipment.
--> Class: 			Self
--> Params:			
-->					@x coordinate in the map on the x-axis
-->					@y coordinate in the map on the y-axis
-->					@z coordinate in the map on the z-axis
-->					@itemid - number item to drop.
-->					@count - number amount to drop.
-->					@delay - number execution delay (default math.random(700, 1600))
--> Return: 		boolean true or false
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.DropItem(x, y, z, itemid, count, delay)
	if count == nil then
		count = 1
	elseif count > 100 then
		count = 100
	end
	if delay == nil then
		delay = math.random(700, 1600)
	end		
	return selfDropItem(x, y, z, itemid, count, delay)
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.PickupItem(x, y, z, itemid, count, contNr, contSlot, delay)
--> Description: 	Pickup item from ground to container only for equipment use Self.EquipItemFromGround(x, y, z, slot, itemid, count, delay)
--> Class: 			Self
--> Params:			
-->					@x coordinate in the map on the x-axis
-->					@y coordinate in the map on the y-axis
-->					@z coordinate in the map on the z-axis
-->					@itemid - number item id.
-->					@count - number amount.
-->					@contNr - number destination container index 0-15.
-->					@contSlot - number destination slot in container index 0-32.
-->					@delay - number execution delay (default math.random(1100, 1900))
--> Return: 		boolean true or false
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.PickupItem(x, y, z, itemid, count, contNr, contSlot, delay)
	if contNr == nil then
		contNr = 0
	end
	if contSlot == nil then
		contSlot = 19
	end		
	if count == nil then
		count = 1
	elseif count > 100 then
		count = 100
	end
	if delay == nil then
		delay = math.random(1100, 1900)
	end		
	return selfPickupItem(x, y, z, itemid, count, contNr + CONTAINER_BASEINDEX, contSlot, delay)
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.Stop()
--> Description: 	Stop actions smimilar to press ESC.key.
--> Class: 			Self
--> Params:			None
--> Return: 		boolean true or false
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.Stop()
	return selfStop()
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.setAttackType(mod)
--> Description: 	Set attack type on your character.
--> Class: 			Self
--> Params:			
-->					@mod number 0-1 Or ATTACK_TYPE_STAND, ATTACK_TYPE_FOLLOW
--> Return: 		boolean true or false
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.setAttackType(mod)
	if mod < ATTACK_TYPE_STAND or mod > ATTACK_TYPE_FOLLOW then
		mod = 0
	end	
	return selfSetAttackType(mod)
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.UseItemFromEquipment(slot, delay)
--> Description: 	Use equipment item example open main backpack.
--> Class: 			Self
--> Params:			
-->					@slot - number slot from equipment 0-9 or SLOT_HEAD etc.
-->					@newIndex - boolean true or false open as new index or not
-->					@delay - number execution delay (default math.random(300, 900))
--> Return: 		boolean true or false.
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.UseItemFromEquipment(slot, delay)
	if newIndex == nil then
		newIndex = false
	end	
	if delay == nil then
		delay = math.random(300, 900)
	end
	local eq = selfGetEquipmentSlot(slot).id
	if eq <= 0 then
		return false -- no item in eq
	end	
	return containerUseItem(slot, 0, eq, true, delay, 1)	
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.OpenMainBackpack()
--> Description: 	Open container from backpack slot.
--> Class: 			Self
--> Params:			None
--> Return: 		boolean true or false
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.OpenMainBackpack()
	return Self.UseItemFromEquipment(SLOT_BACKPACK)
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Self.ItemCount(itemid, container)
--> Description: 	Get specific item count in all container or special container.
--> Class: 			Self
--> Params:			
-->					@itemid number id of item
-->					@container number index of container (optional)
--> Return: 		number item quantity.
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Self.ItemCount(itemid, container)
	local items = Container.getItems(container)
	local amount = 0
	if container ~= nil then -- search in single cont
		for i, item in pairs(items) do
			if itemid == item.id then
				if item.id == MANA_FLUID.id then
					if item.count == MANA_FLUID.count then
						amount = amount + 1
					end	
				else
					amount = amount + item.count
				end
			end
		end
	else
		for i, cont in pairs(items) do -- search for all conts.
			local contItems = cont.items
			for j, item in pairs(contItems) do
				if itemid == item.id then
					if item.id == MANA_FLUID.id then
						if item.count == MANA_FLUID.count then
							amount = amount + 1
						end	
					else
						amount = amount + item.count
					end
				end		
			end
		end
	end
	return amount							
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--+
--+							 .d8888b.                            888                                   .d8888b.  888                            
--+							d88P  Y88b                           888                                  d88P  Y88b 888                            
--+							888    888                           888                                  888    888 888                            
--+							888        888d888  .d88b.   8888b.  888888 888  888 888d888  .d88b.      888        888  8888b.  .d8888b  .d8888b  
--+							888        888P"   d8P  Y8b     "88b 888    888  888 888P"   d8P  Y8b     888        888     "88b 88K      88K      
--+							888    888 888     88888888 .d888888 888    888  888 888     88888888     888    888 888 .d888888 "Y8888b. "Y8888b. 
--+							Y88b  d88P 888     Y8b.     888  888 Y88b.  Y88b 888 888     Y8b.         Y88b  d88P 888 888  888      X88      X88 
--+ 						 "Y8888P"  888      "Y8888  "Y888888  "Y888  "Y88888 888      "Y8888       "Y8888P"  888 "Y888888  88888P'  88888P' 
--+
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Creature = {}


----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Creature.getCreatures(special)
--> Description: 	Get informations about group or single creature in battle list for range: x = {-8, 9}, y = {-6, 7}, z = multifloor.
--> Class: 			Creature
--> Params:			
-->					@special number id of creature or string name of creature. Leave it empty to read all creatures.
--> Return: 		On failure returns empty table
-->					On success returns:
-->						When @special is creature id or creature name:
-->							table = {id = ?, name = ?, x = ?, y = ?, z = ?, hpperc = ?, alive = ?, direction = ?, addr = ?, attack = ?, party = ?}
-->						When @special is emapty:	
-->							table = {
-->								table1 = {see above},
-->								table2 = {see above},
-->								tabkeN = {see above}		
-->							}
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Creature.getCreatures(special)
	if special == nil then
		special = 0
	end	
	return getCreatures(special)
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Creature.isPlayer(creature)
--> Description: 	Check if creature is player.
--> Class: 			Creature
--> Params:			
-->					@creature table returned by Creature.getCreatures(special).
--> Return: 		boolean true or false
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Creature.isPlayer(creature)
	if type(creature) ~= "table" then
		return false
	end
	if creature.id > 0 and creature.id < CREATURE_PLAYER_LIMIT then
		return true
	end
	return false		
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Creature.isMonster(creature)
--> Description: 	Check if creature is monster.
--> Class: 			Creature
--> Params:			
-->					@creature table returned by Creature.getCreatures(special).
--> Return: 		boolean true or false
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Creature.isMonster(creature)
	if type(creature) ~= "table" then
		return false
	end
	if creature.id >= CREATURE_PLAYER_LIMIT then
		return true
	end
	return false		
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Creature.isNpc(creature)
--> Description: 	Check if creature is NPC.
--> Class: 			Creature
--> Params:			
-->					@creature table returned by Creature.getCreatures(special).
--> Return: 		boolean true or false
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Creature.isNpc(creature)
	if type(creature) ~= "table" then
		return false
	end
	if creature.id < 0 or creature.id >= CREATURE_NPC_LIMIT then
		return true
	end
	return false		
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Creature.isPartyLeaderInviting(creature)
--> Description: 	Check if creature is some party leader and invites you to party group.
--> Class: 			Creature
--> Params:			
-->					@creature table returned by Creature.getCreatures(special).
--> Return: 		boolean true or false
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Creature.isPartyLeaderInviting(creature)
	if type(creature) ~= "table" then
		return false
	end
	return creature.party == PARTY_LEADER_INVITING		
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Creature.isPartyMemberInvited(creature)
--> Description: 	Check if creature is invited by you to party.
--> Class: 			Creature
--> Params:			
-->					@creature table returned by Creature.getCreatures(special).
--> Return: 		boolean true or false
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Creature.isPartyMemberInvited(creature)
	if type(creature) ~= "table" then
		return false
	end
	return creature.party == PARTY_MEMBER_INVITED		
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Creature.isPartyMember(creature)
--> Description: 	Check if creature is party member.
--> Class: 			Creature
--> Params:			
-->					@creature table returned by Creature.getCreatures(special).
--> Return: 		boolean true or false
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Creature.isPartyMember(creature)
	if type(creature) ~= "table" then
		return false
	end
	return creature.party == PARTY_MEMBER	
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Creature.isPartyLeader(creature)
--> Description: 	Check if creature is party leader.
--> Class: 			Creature
--> Params:			
-->					@creature table returned by Creature.getCreatures(special).
--> Return: 		boolean true or false
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Creature.isPartyLeader(creature)
	if type(creature) ~= "table" then
		return false
	end
	return creature.party == PARTY_LEADER	
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Creature.isSkull(creature)
--> Description: 	Check if creature is skulled.
--> Class: 			Creature
--> Params:			
-->					@creature table returned by Creature.getCreatures(special).
--> Return: 		int SKULL_NONE = 0, SKULL_YELLOW = 1, SKULL_GREEN = 2, SKULL_WHITE = 3, SKULL_RED = 4
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Creature.isSkull(creature)
	if type(creature) ~= "table" then
		return false
	end
	return creature.skull
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Creature.iFunction(group, range, multifloor)
--> Description: 	Get informations about special group of creatures.
--> Class: 			Creature
--> Params:			
-->					@group string "players", "monsters", "npcs", "creatures" or "party"
-->					@range number distance from your character
-->					@multifloor boolean true or false search for above and blow floors or not
--> Return: 		On failure returns empty table 
-->					On success reaturns:
-->						table = {
-->							table = {id = ?, name = ?, x = ?, y = ?, z = ?, hpperc = ?, alive = ?, direction = ?, addr = ?, attack = ?, party = ?},
-->							table2 = {see above},
-->							tabkeN = {see above}		
-->						}
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Creature.iFunction(group, range, multifloor)
	if multifloor == nil then
		multifloor = false
	end
	local self = Self.Position()
	local selfID = Self.ID()
	local distance = {x = 7, y = 5} 
	if range >= 5 then
		distance.x = range
		distance.y = 5
	else
		distance.x = range
		distance.y = range
	end
	local creatures = Creature.getCreatures()
	local itable = {}
	for i = 1, #creatures do
		local creature = creatures[i]
		local varMultifloor = (multifloor == false and self.z == creature.z) or (multifloor == true)
		local varGroup = (group == "creatures") or (group == "players" and Creature.isPlayer(creature)) or (group == "monsters" and Creature.isMonster(creature)) or (group == "npcs" and Creature.isNpc(creature)) or (group == "party" and (Creature.isPartyLeader(creature) or Creature.isPartyMember(creature)))
		if creature.id ~= selfID then
			if varMultifloor and varGroup then
				if (math.abs(creature.x - self.x) <= distance.x and math.abs(creature.y - self.y) <= distance.y) then
					table.insert(itable, creature)
				end	
			end
		end	
	end
	return itable		
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Creature.iPlayers(range, multifloor)
--> Description: 	Read group of players on range with optional param multifloor.
--> Class: 			Creature
--> Params:			
-->					@range number distance from your character
-->					@multifloor boolean true or false search for above and blow floors or not
--> Return: 		See return in Creature.iFunction(group, range, multifloor)
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Creature.iPlayers(range, multifloor)
	return Creature.iFunction("players", range, multifloor)	
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Creature.iMonsters(range, multifloor)
--> Description: 	Read group of monsters on range with optional param multifloor.
--> Class: 			Creature
--> Params:			
-->					@range number distance from your character
-->					@multifloor boolean true or false search for above and blow floors or not
--> Return: 		See return in Creature.iFunction(group, range, multifloor)
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Creature.iMonsters(range, multifloor)
	return Creature.iFunction("monsters", range, multifloor)	
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Creature.iNpcs(range, multifloor)
--> Description: 	Read group of npcs on range with optional param multifloor.
--> Class: 			Creature
--> Params:			
-->					@range number distance from your character
-->					@multifloor boolean true or false search for above and blow floors or not
--> Return: 		See return in Creature.iFunction(group, range, multifloor)
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Creature.iNpcs(range, multifloor)
	return Creature.iFunction("npcs", range, multifloor)	
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Creature.iPartyMembers(range, multifloor)
--> Description: 	Read group of party on range with optional param multifloor.
--> Class: 			Creature
--> Params:			
-->					@range number distance from your character
-->					@multifloor boolean true or false search for above and blow floors or not
--> Return: 		See return in Creature.iFunction(group, range, multifloor)
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Creature.iPartyMembers(range, multifloor)
	return Creature.iFunction("party", range, multifloor)	
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Creature.iCreatures(range, multifloor)
--> Description: 	Read group of all creatures include (player, npc, monster) on range with optional param multifloor.
--> Class: 			Creature
--> Params:			
-->					@range number distance from your character
-->					@multifloor boolean true or false search for above and blow floors or not
--> Return: 		See return in Creature.iFunction(group, range, multifloor)
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Creature.iCreatures(range, multifloor)
	return Creature.iFunction("creatures", range, multifloor)	
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Creature.DistanceFromSelf(creature)
--> Description: 	Check range between your character and creature.
--> Class: 			Creature
--> Params:			
-->					@creature table returned by Creature.getCreatures(special).
--> Return: 		On failure return number 10
-->					On success return number distance
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Creature.DistanceFromSelf(creature)
	if type(creature) ~= "table" then
		return 10
	end
	local self = Self.Position()
	local absx = math.abs(creature.x - self.x)
	local absy = math.abs(creature.y - self.y)
	local ret = absx
	if absy > absx then
		ret = absy
	end
	return ret	
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Creature.isOnScreen(creature)
--> Description: 	Check if creature is on screen.
--> Class: 			Creature
--> Params:			
-->					@creature table returned by Creature.getCreatures(special).
--> Return: 		On failure return number 10
-->					On success return number distance
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Creature.isOnScreen(creature)
	if type(creature) ~= "table" then
		return false
	end
	local self = Self.Position()
	if self.z ~= creature.z then
		return false
	end
	if math.abs(creature.x - self.x) <= 7 and math.abs(creature.y - self.y) <= 5 then
		return true
	end
	return false		
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Creature.Attack(creatureID)
--> Description: 	Attack creature.
--> Class: 			Creature
--> Params:			
-->					@creatureID number returned by Creature.getCreatures(special).id
--> Return: 		boolean true or false
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Creature.Attack(creatureID)
	if creatureID == nil then
		creatureID = 0
	end	
	return creatureAttack(creatureID)	
end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--+
--+								888b     d888                        .d8888b.  888                            
--+								8888b   d8888                       d88P  Y88b 888                            
--+								88888b.d88888                       888    888 888                            
--+								888Y88888P888  8888b.  88888b.      888        888  8888b.  .d8888b  .d8888b  
--+								888 Y888P 888     "88b 888 "88b     888        888     "88b 88K      88K      
--+								888  Y8P  888 .d888888 888  888     888    888 888 .d888888 "Y8888b. "Y8888b. 
--+								888   "   888 888  888 888 d88P     Y88b  d88P 888 888  888      X88      X88 
--+								888       888 "Y888888 88888P"       "Y8888P"  888 "Y888888  88888P'  88888P' 
--+                       							   888                                                    
--+                       							   888                                                    
--+                       							   888                                           
--+
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Map = {}

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Map.getArea(range)
--> Description: 	Get map with specific range. Warring! This function is take a lot of CPU.
--> Class: 			Map
--> Params:			
-->					@range number map distance area
--> Return: 		table = {
-->						table = {x = ?, y = ?, z = ?, amount = ?, items = {{id = ?, count = ?}, {id = ?, count = ?}}}
-->						tableN = {x = ?, y = ?, z = ?, amount = ?, items = {{id = ?, count = ?}, {id = ?, count = ?}}}
-->					}						
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Map.getArea(range)
	if range == nil then
		range = 7
	end	
	return getMap(range)	
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Map.SquareContainsItem(square, itemid)
--> Description: 	Check map square for single item or table of items.
--> Class: 			Map
--> Params:			
-->					@square table returned by Map.getArea(range)[x].items
-->					@itemid number id or table {id1, id2}
--> Return: 		boolean true or false		
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Map.SquareContainsItem(square, itemid)
	if type(square) ~= "table" then
		return false
	end
	local array = itemid
	if type(itemid) ~= "table" then
		array = {itemid}
	end	
	for i = 1, #square do
		local item = square[i]
		if type(item) == "table" then
			if table.find(array, item.id) then
				return true
			end
		end
	end
	return false				
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Map.UseItem(x, y, z, itemid)
--> Description: 	Use item on map x, y, z, e.g. open house window.
--> Class: 			Map
--> Params:			
-->					@x coordinate in the map on the x-axis
-->					@y coordinate in the map on the y-axis
-->					@z coordinate in the map on the z-axis
-->					@itemid - number item id.
-->					@delay - number execution delay (default math.random(350, 1200))
--> Return: 		boolean true or false		
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Map.UseItem(x, y, z, itemid, delay)
	if delay == nil then
		delay = math.random(350, 1200)
	end	
	return mapUseItem(x, y, z, itemid, delay)
end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--+
--+					 .d8888b.                    888             d8b                                .d8888b.  888                            
--+					d88P  Y88b                   888             Y8P                               d88P  Y88b 888                            
--+					888    888                   888                                               888    888 888                            
--+					888         .d88b.  88888b.  888888  8888b.  888 88888b.   .d88b.  888d888     888        888  8888b.  .d8888b  .d8888b  
--+					888        d88""88b 888 "88b 888        "88b 888 888 "88b d8P  Y8b 888P"       888        888     "88b 88K      88K      
--+					888    888 888  888 888  888 888    .d888888 888 888  888 88888888 888         888    888 888 .d888888 "Y8888b. "Y8888b. 
--+					Y88b  d88P Y88..88P 888  888 Y88b.  888  888 888 888  888 Y8b.     888         Y88b  d88P 888 888  888      X88      X88 
--+ 				 "Y8888P"   "Y88P"  888  888  "Y888 "Y888888 888 888  888  "Y8888  888          "Y8888P"  888 "Y888888  88888P'  88888P'
--+
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Container = {}

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Container.getInfo(index)
--> Description: 	Read specific container inforamtions.
--> Class: 			Container
--> Params:			
-->					@index number 0-15
--> Return: 		On failure: empty table.
-->					On success: table = {id = ?, name = ?, size = ?, amount = ?}		
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Container.getInfo(index)
	if index == nil or index > 15 then
		index = 0
	end	
	return getContainerInfo(index)
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Container.isOpen(index)
--> Description: 	Read for container is open or not.
--> Class: 			Container
--> Params:			
-->					@index number 0-15
--> Return: 		boolean true or false.	
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Container.isOpen(index)
	if index == nil or index > 15 then
		index = 0
	end
	local cont = getContainerInfo(index)
	if table.count(cont) < 4 then 
		return false
	end
	return true	
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Container.getItems(special)
--> Description: 	Read containers for items.
--> Class: 			Container
--> Params:			
-->					@special number 0-15 index of container to read. Leave empty to read all containers items.
--> Return: 		On failure: empty table.
-->					On success: 
-->						@special is given:
-->							table = {{id = ?, count = ?}, {id = ?, count = ?}}
-->						@special is nil:
-->							table = {
-->								{index = ?, items = {{id = ?, count = ?}, {id = ?, count = ?}}},
-->								{index = ?, items = {{id = ?, count = ?}, {id = ?, count = ?}}}
-->							}		
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Container.getItems(special)
	if special == nil then
		special = -1
	end	
	return getContainerItems(special)
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Container.FindItem(itemid)
--> Description: 	Search all containers for itemid.
--> Class: 			Container
--> Params:			
-->					@itemid number
-->					@special number 0-15 container index (optional search for special container index)
--> Return: 		On failure: boolean false
-->					On success: table = {index = ?, slot = ?, id = ?, count = ?}		
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Container.FindItem(itemid, special)
	if type(itemid) ~= "table" then -- convert item to table
		itemid = {itemid}
	end	
	local items = Container.getItems(special)
	if special == nil then
		for i = 1, #items do
			local cont = items[i]
			local contItems = cont.items
			for j = 1, #contItems do
				local item = contItems[j]
				if table.find(itemid, item.id) then
					if item.id == MANA_FLUID.id then
						if item.count == MANA_FLUID.count then
							return {index = cont.index, slot = (j - 1), id = item.id, count = item.count}
						end
					else
						return {index = cont.index, slot = (j - 1), id = item.id, count = item.count}
					end
				end				
			end	
		end
	else
		for i = 1, #items do
			local item = items[i]
			if table.find(itemid, item.id) then
				if item.id == MANA_FLUID.id then
					if item.count == MANA_FLUID.count then
						return {index = special, slot = (i - 1), id = item.id, count = item.count}
					end
				else
					return {index = special, slot = (i - 1), id = item.id, count = item.count}
				end
			end				
		end	
	end			
	return false
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Container.UseItemWithGround(container, slot, itemid, x, y, z, delay)
--> Description: 	Use container slot with ground x, y, z.
--> Class: 			Container
--> Params:			
-->					@container - number index container from 0-15.
-->					@slot - number slot container from 0-32.
-->					@itemid - number item id.
-->					@x coordinate in the map on the x-axis
-->					@y coordinate in the map on the y-axis
-->					@z coordinate in the map on the z-axis
-->					@delay - number execution delay (default math.random(1000, 1800))
--> Return: 		boolean true or false.
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Container.UseItemWithGround(container, slot, itemid, x, y, z, delay)
	if delay == nil then
		delay = math.random(1000, 1800)
	end
	return containerUseItemWithGround(container, slot, itemid, x, y, z, 0, delay)	
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Container.UseItemWithCreature(container, slot, itemid, creature, delay)
--> Description: 	Use container slot with creature.
--> Class: 			Container
--> Params:			
-->					@container - number index container from 0-15.
-->					@slot - number slot container from 0-32.
-->					@itemid - number item id.
-->					@creature table returned by Creature.getCreatures(special).
-->					@delay - number execution delay (default math.random(1000, 1800))
--> Return: 		boolean true or false.
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Container.UseItemWithCreature(container, slot, itemid, creature, delay)
	if delay == nil then
		delay = math.random(1000, 1800)
	end
	if type(creature) ~= "table" then -- when creature not found return false.
		return false
	end
	return containerUseItemWithGround(container, slot, itemid, creature.x, creature.y, creature.z, creature, delay)	
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Container.UseItem(container, slot, itemid, newIndex, delay)
--> Description: 	Use container slot e.g eat food.
--> Class: 			Container
--> Params:			
-->					@container - number index container from 0-15.
-->					@slot - number slot container from 0-32.
-->					@itemid - number item id.
-->					@newIndex - boolean true or false open as new index or not
-->					@delay - number execution delay (default math.random(300, 900))
--> Return: 		boolean true or false.
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Container.UseItem(container, slot, itemid, newIndex, delay)
	if newIndex == nil then
		newIndex = false
	end	
	if delay == nil then
		delay = math.random(300, 900)
	end
	return containerUseItem(container, slot, itemid, newIndex, delay, 0)	
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Container.MoveItemToContainer(containerFrom, slotFrom, containerTo, slotTo, itemid, count, delay)
--> Description: 	Move item from container to next container.
--> Class: 			Container
--> Params:			
-->					@containerFrom - number index container from 0-15.
-->					@slotFrom - number slot container from 0-32.
-->					@containerTo - number index container to 0-15
-->					@slotTo - number slot container to 0-32
-->					@itemid - number item id.
-->					@count - number item quantity (default = 1).
-->					@delay - number execution delay (default math.random(300, 900))
--> Return: 		boolean true or false.
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Container.MoveItemToContainer(containerFrom, slotFrom, containerTo, slotTo, itemid, count, delay)
	if count == nil then
		count = 1
	elseif count > 100 then
		count = 100	
	end	
	if delay == nil then
		delay = math.random(300, 900)
	end
	return containerMoveItemToContainer(containerFrom, slotFrom, containerTo, slotTo, itemid, count, delay, 0)	
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Container.MoveItemToEquipment(containerFrom, slotFrom, slotTo, itemid, count, delay)
--> Description: 	Move item from container to equipment slot.
--> Class: 			Container
--> Params:			
-->					@containerFrom - number index container from 0-15.
-->					@slotFrom - number slot container from 0-32.
-->					@slotTo - number equipment slot 0-9 or SLOT_HEAD etc.
-->					@itemid - number item id.
-->					@count - number item quantity (default = 1).
-->					@delay - number execution delay (default math.random(300, 900))
--> Return: 		boolean true or false.
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Container.MoveItemToEquipment(containerFrom, slotFrom, slotTo, itemid, count, delay)
	if count == nil then
		count = 1
	elseif count > 100 then
		count = 100	
	end	
	if delay == nil then
		delay = math.random(300, 900)
	end
	return containerMoveItemToContainer(containerFrom, slotFrom, slotTo, 0, itemid, count, delay, 1)	
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Container.MoveItemFromEquipmentToContainer(slotFrom, containerTo, slotTo, itemid, count, delay)
--> Description: 	Move item from equipment slot to container.
--> Class: 			Container
--> Params:			
-->					@slotFrom - number equipment slot 0-9 or SLOT_HEAD etc.
-->					@containerTo - number index container to 0-15.
-->					@slotTo - number slot container to 0-32.
-->					@itemid - number item id.
-->					@count - number item quantity (default = 1).
-->					@delay - number execution delay (default math.random(300, 900))
--> Return: 		boolean true or false.
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Container.MoveItemFromEquipmentToContainer(slotFrom, containerTo, slotTo, itemid, count, delay)
	if count == nil then
		count = 1
	elseif count > 100 then
		count = 100	
	end	
	if delay == nil then
		delay = math.random(300, 900)
	end
	return containerMoveItemToContainer(slotFrom, 0, containerTo, slotTo, itemid, count, delay, 2)	
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Container.MoveItemToGround(containerFrom, slotFrom, x, y, z, itemid, count, delay)
--> Description: 	Move item from container to ground x, y, z.
--> Class: 			Container
--> Params:			
-->					@containerFrom - number index container from 0-15.
-->					@slotFrom - number slot container from 0-32.
-->					@x coordinate in the map on the x-axis
-->					@y coordinate in the map on the y-axis
-->					@z coordinate in the map on the z-axis
-->					@itemid - number item id.
-->					@count - number item quantity (default = 1).
-->					@delay - number execution delay (default math.random(300, 900))
--> Return: 		boolean true or false.
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Container.MoveItemToGround(containerFrom, slotFrom, x, y, z, itemid, count, delay)
	if count == nil then
		count = 1
	elseif count > 100 then
		count = 100	
	end	
	if delay == nil then
		delay = math.random(300, 900)
	end
	return containerMoveItemToGround(containerFrom, slotFrom, x, y, z, itemid, count, delay, 0)	
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Container.MoveItemFromEquipmentToGround(slotFrom, x, y, z, itemid, count, delay)
--> Description: 	Move item from equipment slot to ground x, y, z.
--> Class: 			Container
--> Params:			
-->					@slotFrom - number equipment slot 0-9 or SLOT_HEAD etc.
-->					@x coordinate in the map on the x-axis
-->					@y coordinate in the map on the y-axis
-->					@z coordinate in the map on the z-axis
-->					@itemid - number item id.
-->					@count - number item quantity (default = 1).
-->					@delay - number execution delay (default math.random(300, 900))
--> Return: 		boolean true or false.
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Container.MoveItemFromEquipmentToGround(slotFrom, x, y, z, itemid, count, delay)
	if count == nil then
		count = 1
	elseif count > 100 then
		count = 100	
	end	
	if delay == nil then
		delay = math.random(300, 900)
	end
	return containerMoveItemToGround(slotFrom, 0, x, y, z, itemid, count, delay, 1)	
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Container.Open(containerFrom, itemid, newIndex, delay)
--> Description: 	Open new container inside current or as a new index.
--> Class: 			Container
--> Params:			
-->					@containerFrom - number container from index 0-15
-->					@itemid - number item id of new container.
-->					@newIndex - boolean true or false open as new index or not
-->					@delay - number execution delay (default math.random(300, 900))
--> Return: 		boolean true or false.
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Container.Open(containerFrom, itemid, newIndex, delay)
	if newIndex == nil then
		newIndex = false
	end	
	if delay == nil then
		delay = math.random(300, 900)
	end
	local newCont = Container.FindItem(itemid, containerFrom)
	if not newCont then
		return false -- return false cuz item not found
	end	
	return Container.UseItem(newCont.index, newCont.slot, itemid, newIndex, delay)
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Container.Close(container, delay)
--> Description: 	Close container index.
--> Class: 			Container
--> Params:			
-->					@container - number container from index 0-15
-->					@delay - number execution delay (default math.random(300, 900))
--> Return: 		boolean true or false.
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Container.Close(container, delay)
	if delay == nil then
		delay = math.random(300, 900)
	end
	return containerClose(container, delay)
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Container.Back(container, delay)
--> Description: 	Go back container index.
--> Class: 			Container
--> Params:			
-->					@container - number container from index 0-15
-->					@delay - number execution delay (default math.random(300, 900))
--> Return: 		boolean true or false.
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Container.Back(container, delay)
	if delay == nil then
		delay = math.random(300, 900)
	end
	return containerBack(container, delay)
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--+
--+						8888888b.                                          .d8888b.  888                            
--+						888   Y88b                                        d88P  Y88b 888                            
--+						888    888                                        888    888 888                            
--+						888   d88P 888d888  .d88b.  888  888 888  888     888        888  8888b.  .d8888b  .d8888b  
--+						8888888P"  888P"   d88""88b `Y8bd8P' 888  888     888        888     "88b 88K      88K      
--+						888        888     888  888   X88K   888  888     888    888 888 .d888888 "Y8888b. "Y8888b. 
--+						888        888     Y88..88P .d8""8b. Y88b 888     Y88b  d88P 888 888  888      X88      X88 
--+						888        888      "Y88P"  888  888  "Y88888      "Y8888P"  888 "Y888888  88888P'  88888P' 
--+					                                         	  888                                               
--+					                                     	 Y8b d88P                                               
--+					                                     	  "Y88P"                         
--+
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Proxy = {}

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Proxy.ErrorGetLastMessage()
--> Description: 	Read last error message proxy (white).
--> Class: 			Proxy
--> Params:			None
--> Return: 		string message	
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Proxy.ErrorGetLastMessage()	
	return getLastErrorProxyMessage()
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Proxy.ErrorClearMessage()
--> Description: 	Clear last error message proxy (white).
--> Class: 			Proxy
--> Params:			None
--> Return: 		boolean true or false	
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Proxy.ErrorClearMessage()	
	return proxyErrorClearMessage()
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Proxy.PrivateGetLastMessage()
--> Description: 	Read last private message proxy.
--> Class: 			Proxy
--> Params:			None
--> Return: 		table = {speaker = ?, message = ?}	
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Proxy.PrivateGetLastMessage()	
	return getLastPrivateProxyMessage()
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		Proxy.PrivateClearMessage()
--> Description: 	Clear last private message proxy.
--> Class: 			Proxy
--> Params:			None
--> Return: 		boolean true or false	
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Proxy.PrivateClearMessage()	
	return proxyPrivateClearMessage()
end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--+
--+						888b     d888 d8b                        .d8888b.  888                            
--+						8888b   d8888 Y8P                       d88P  Y88b 888                            
--+						88888b.d88888                           888    888 888                            
--+						888Y88888P888 888 .d8888b   .d8888b     888        888  8888b.  .d8888b  .d8888b  
--+						888 Y888P 888 888 88K      d88P"        888        888     "88b 88K      88K      
--+						888  Y8P  888 888 "Y8888b. 888          888    888 888 .d888888 "Y8888b. "Y8888b. 
--+						888   "   888 888      X88 Y88b.        Y88b  d88P 888 888  888      X88      X88 
--+						888       888 888  88888P'  "Y8888P      "Y8888P"  888 "Y888888  88888P'  88888P'
--+
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

VIP = {}

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		VIP.isOnline(name)
--> Description: 	Check if player/s from VIP list is/are online.
--> Class: 			Misc
--> Params:			
-->					@name string "player" or table = {"player1", "player2"}
--> Return: 		boolean true or false		
----------------------------------------------------------------------------------------------------------------------------------------------------------
function VIP.isOnline(name)
	if type(name) ~= "table" then
		name = {name}
	end
	return vipIsOnline(name)			
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		table.find(table, element)
--> Description: 	Find element in table.
--> Class: 			Misc
--> Params:			
-->					@table table for searching
-->					@element number or string item for searching
--> Return: 		boolean true or false		
----------------------------------------------------------------------------------------------------------------------------------------------------------
function table.find(table, element)
	for v, k in pairs(table) do
		if k == element then 
			return true
		end
	end
	return false		
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		table.count(table)
--> Description: 	Count elements in table.
--> Class: 			Misc
--> Params:			
-->					@table table for count
--> Return: 		number		
----------------------------------------------------------------------------------------------------------------------------------------------------------
function table.count(table)
	local count = 0
	for v, k in pairs(table) do
		count = count + 1
	end
	return count		
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		table.lower(table)
--> Description: 	Lower all strings in table.
--> Class: 			Misc
--> Params:			
-->					@table table of strings
--> Return: 		table		
----------------------------------------------------------------------------------------------------------------------------------------------------------
function table.lower(array)
	local new = {}
	for v, k in pairs(array) do
		if type(k) == "table" then
			table.insert(new, table.lower(k))
		else	
			table.insert(new, string.lower(k))
		end	
	end
	return new		
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		string.instr(str, message)
--> Description: 	Check if string contains message.
--> Class: 			Misc
--> Params:			
-->					@str string default message 
-->					@message string to find
--> Return: 		boolean true or false		
----------------------------------------------------------------------------------------------------------------------------------------------------------
function string.instr(str, message)
	return stringInStr(str, message)
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		printf(...)
--> Description: 	Send to Rifbot console multiple params e.g. printf(Self.Name(), Self.ID(), Self.HealthPercent())
--> Class: 			Misc
--> Params:			
-->					@... string or number multiple arg to print separate by comma 
--> Return: 		boolean true or false		
----------------------------------------------------------------------------------------------------------------------------------------------------------
function printf(...)
	local text = ""
	local count = table.count(arg)
	for i,v in ipairs(arg) do
        text = text .. tostring(v)
        if (count - 1) ~= i then
        	text = text .. ", "
        end	 
    end
	return Rifbot.ConsoleWrite(text)
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		wait(a, b)
--> Description: 	Pause only Module execution for @a or random(@a, @b) time miliseconds. Minimal time is 200ms.
--> Class: 			Misc
--> Params:			
-->					@a number milisceonds to wait min 200ms 
-->					@b number (optional) miliseconds to get random(@a, @b)
--> Return: 		void nothing.		
----------------------------------------------------------------------------------------------------------------------------------------------------------
function wait(a, b)
	if b == nil then
		sleep(a)
	else
		sleep(math.random(a, b))
	end		
end

----------------------------------------------------------------------------------------------------------------------------------------------------------
--> Function:		classicTibiaRelogin()
--> Description: 	Reconnect to game on TibiaClient where we need to put acc na passwd before press enter. This function will not work if you dont login
-->					any character before start Rifbot.
-->
--> Class: 			Misc
--> Params:			None
--> Return: 		boolean true or false.		
----------------------------------------------------------------------------------------------------------------------------------------------------------
function classicTibiaRelogin()
	return classicTibiaReconnect()
end
