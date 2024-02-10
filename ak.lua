local args = { ... }

function updatehelp()
    print("help:")
end

function term_YorN(str)
    local message = str.tostring
    term.clear()
    term.setCursorPos(1,0)
    print(message)
    print("Y or N")
    local input = read()
    if string.find(input, "y") or string.find(input, "Y") then
        return true 
    elseif string.find(input, "n") or string.find(input, "N") then
        return false
    else
        print("Please enter y or n")
    end
end

function update(programName)
    shell.run("wget https://raw.githubusercontent.com/akki697222/akkiserver-computercraft-script/main/updatable/",programName,".lua")
    print("Update Completed!!")
end

if args[1] == "update" then
    term.clear()
    if args[2] == nil then
        print("please type program name")
    else
        local pn = args[2]
        print("Do you want to delete old files?")
        local bool = term_YorN()
        if bool == true then
            shell.run(string.format("rm %d.lua", pn))
            update(pn)
        elseif bool == false then
            shell.run(string.format("cp %d.lua %d.lua.old", pn))
            update(pn)
        end
    end
end
