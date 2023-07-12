local version = client.GetVersion()
 if version ~= "V1.01" then
   Notifications.push_error("Lua Script", "Program is Outdated Please Update to use that Script")
else
   Notifications.push_success("Lua Script", "Rezi Script Loaded And Working")
local statebool = false

local function request()
    local link = "https://search.rezi.one/indexes/rezi/search"
    local getgamename = game.getgamename()
    local gamename = "\"" .. getgamename .. "\""
    local params = [[{
        "q": ]] .. tostring(gamename) .. [[,
        "limit": 20
    }]]

    local headers = {
        ["Authorization"] = "Bearer e2a1974678b37386fef69bb3638a1fb36263b78a8be244c04795ada0fa250d3d",
        ["Content-Type"] = "application/json",
        ["accept"] = "application/json"
    }

    local response = http.post(link, params, headers)
    local gameResults = JsonWrapper.parse(response)["hits"]

    local results = {}

    for _, result in ipairs(gameResults) do
        local searchResult = {
            name = result.title,

            links = {
                { name = "Download", link = result.link, addtodownloadlist = false }
            },
            ScriptName = "Rezi2"
        }

        if result.link:find("archive.org") then
            local resolvedLink = http.ArchivedotOrgResolver(result.link)
            if resolvedLink then
                searchResult.links = {
                        { name = "Download", link = resolvedLink, addtodownloadlist = true }
                }
            end
        end

        table.insert(results, searchResult)
    end

    communication.receiveSearchResults(results)
end
client.add_callback("on_gameselected", request)--on a game is selected in menu callback
end
