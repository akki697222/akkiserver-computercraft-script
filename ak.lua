local args = { ... }

function updatehelp()
    print("help:")
end

function term_YorN(string)
    term.clear()
    term.setCursorPos(1,0)
    print(string)
    print("Y or N")
    local input = read()
    if input == "y" or input == "Y" then
        return true 
    elseif input == "n" or input == "N" then
        return false
    else
        print("Please enter y or n")
    end
end

function update(programName)
    shell.run(string.format("wget https://raw.githubusercontent.com/akki697222/akkiserver-computercraft-script/main/updatable/%d.lua", programName))
    print("Update Completed!!")
end

if args[1] == "update" then
    if args[2] == nil then
        print("please type program name")
    else
        local pn = args[2]
        local bool = term_YorN("Do you want to delete old files?")
        if bool == true then
            shell.run(string.format("rm %d.lua", pn))
            update(pn)
        elseif bool == false then
            shell.run(string.format("cp %d.lua %d.lua.old", pn))
            update(pn)
        end
    end
end
