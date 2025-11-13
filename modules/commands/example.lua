local graveCMD = loadstring(game:HttpGet("https://raw.githubusercontent.com/vvs-z7x/grave/refs/heads/main/modules/commandHandler.lua"))()

graveCMD:AddCommand("!example", function()
	print("Example")
end, {"!alias1", "!alias2"}) 
