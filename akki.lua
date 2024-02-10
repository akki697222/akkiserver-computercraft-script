local args = { ... }
local debug = false
local b = 0
local version = "1.0.3"

function dev()
    if debug == true then
        print("no error!!")
    end
end

function updatehelp()
    print("help:")
end

function term_Y_or_N()
    term.setCursorPos(1, 2)
    print("Y or N")
    local input = read()
    if string.match(input, "y") then
        return 1
    elseif string.match(input, "n") then
        return 0
    else
        print("Please enter y or n")
        return term_Y_or_N()
    end
end

function update(programName)
    local url = "https://raw.githubusercontent.com/akki697222/akkiserver-computercraft-script/main/updatable/" .. programName .. ".lua"
    print("Getting " .. url .. "...")
    local response = http.get(url)
    if response then
        local content = response.readAll()
        response.close()
        print("Opening file...")
        local file = fs.open(programName .. ".lua", "w")
        print("Writing to file...")
        file.write(content)
        file.close()
        print("Update Completed!!")
    else
        print("Failed to download the update.")
    end
end

if args[1] == nil then
    print("Usable Commands:")
    print("akki help")
    print("akki update [program]")
end

if args[1] == "help" then
    print("akki's ComputerCraft: Tweaked lua script-tools")
    print("Script version: ", version)
    print("Lua version: ", _VERSION)
    print("")
    print("Usable Commands:")
    print("akki help")
    print("akki update [program]")
end

if args[1] == "update" then
    if args[2] == nil then
        print("Please provide the program name")
    else
        local pn = args[2]
        print("Do you want to delete old files?")
        local b = term_Y_or_N()
        if b == 1 then
            if fs.exists(pn .. ".lua") then
                fs.delete(pn .. ".lua")
            end
            update(pn)
        elseif b == 0 then
            if fs.exists(pn .. ".lua") then
                shell.run(string.format("cp %s.lua %s.lua.old", pn, pn))
            end
            update(pn)
        end
    end
end
