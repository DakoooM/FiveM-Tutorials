local testmenu = false
RMenu.Add('tutomenu', 'main', RageUI.CreateMenu("Tuto", "Variables", 10, 80))
RMenu:Get('tutomenu', 'main').Closed = function()
    testmenu = false
end

local dakomtuto = {
    {nom = "Coucou", label = "1", desc = "description numero 1", event = "dakom:acheter" },
    {nom = "Test 2", label = "2", desc = "description numero 2", event = "dakom:donner" }
}

local function openTest()
	if not testmenu then
		testmenu = true
		RageUI.Visible(RMenu:Get('tutomenu', 'main'), true)
	Citizen.CreateThread(function()
		while testmenu do
			Citizen.Wait(1)
                RageUI.IsVisible(RMenu:Get('tutomenu', 'main'), true, true, true, function()
                    
                for _, dakom in pairs (dakomtuto) do
                    RageUI.ButtonWithStyle(dakom.nom, dakom.desc, {RightLabel = dakom.label}, true, function(h, a, s)
                        if s then
                            TriggerServerEvent(dakom.event)
                            RageUI.CloseAll()
                            testmenu = false
                        end
                    end)
                end

                end, function() 
                end)
			end
		end)
	end
end

RegisterCommand("tuto", function()
    openTest()
end)