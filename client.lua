
Citizen.CreateThread(function()
	while true do
		Wait(500)
		playerPed = GetPlayerPed(-1)
		InVehicle = GetVehiclePedIsIn(playerPed, false)
		vehiclehash = GetEntityModel(GetVehiclePedIsIn(PlayerPedId()))
		vehicleModel = GetDisplayNameFromVehicleModel(vehiclehash)

		if Config.KMPHorMPH = false then
			speed = GetEntitySpeed(InVehicle) * 3.6
		elseif Config.KMPHorMPH = true then
			speed = GetEntitySpeed(InVehicle) * 2.236936
		end
		if InVehicle then
			if speed <= Config.vehicleSpeedAllowed then
				SetPlayerCanDoDriveBy(PlayerId(), true)
			else
				SetPlayerCanDoDriveBy(PlayerId(), false)
				if Config.Notifications = true then
					if IsControlJustReleased(68, 0) then
						Citizen.Wait(500)
    					exports['mythic_notify']:DoShortHudText('inform', Config.Message, { ['background-color'] = Config.BackgroundColor, ['color'] = Config.TextColor })
					end
				end
			end
		end
	end
end)

