if getActivatedMods():contains("Polaroids") then
    Polaroids = Polaroids or {}
    if getActivatedMods():contains("Authentic Z - Current") or getActivatedMods():contains("AuthenticZLite") or getActivatedMods():contains("AuthenticZBackpacks+") then

        function Polaroids.PolaroidItemOptionsAZ(player, context, items)
            local playerObj = getSpecificPlayer(player)
            local camera = nil
            local polaroidCamera = item
            local polaroid = nil
            local c = 0
            items = ISInventoryPane.getActualItems(items)
            for i,item in ipairs(items) do
                if item:getType() == "CameraAZ" or item:getType() == "CameraDisposableAZ" or item:getType() == "CameraExpensiveAZ" then
                    camera = item
                elseif item:getType() == "PolaroidAZ" then
                    polaroidCamera = item
                    camera = item
                end
                if c > 0 then
                    polaroid = nil
                end
                c = c + 1
            end

            if camera then
                context:addOption(getText("ContextMenu_Polaroids_TakePhoto"), playerObj, Polaroids.TakePhoto, camera)
            end
            if polaroidCamera then
                context:addOption(getText("ContextMenu_Polaroids_PrintPolaroid"), player, Polaroids.PrintPolaroid, polaroidCamera)
            end
        end
        Events.OnFillInventoryObjectContextMenu.Add(Polaroids.PolaroidItemOptionsAZ)
    end
end