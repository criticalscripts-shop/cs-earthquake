if (config.updatesCheck) then
    local version = GetResourceMetadata(GetCurrentResourceName(), 'version', 0)

    PerformHttpRequest('https://updates.criticalscripts.shop/cs-earthquake', function(e, b, h)
        if (e == 200) then
            local data = json.decode(b)

            if (data) then
                if (data.version ~= version) then
                    print('[criticalscripts.shop] Resource "cs-earthquake" is outdated, please download the latest version through our GitHub (https://github.com/criticalscripts-shop/cs-earthquake).')
                else
                    print('[criticalscripts.shop] Resource "cs-earthquake" is up to date.')
                end

                if (data.message) then
                    print('[criticalscripts.shop] ' .. data.message)
                end
            else
                print('[criticalscripts.shop] Resource "cs-earthquake" failed to perform update check.')
            end
        else
            print('[criticalscripts.shop] Resource "cs-earthquake" failed to perform update check.')
        end
    end, 'GET', '', {})
end

RegisterCommand('earthquake', function()
    TriggerClientEvent('cs-earthquake:perform', -1)
end, true)
