local userName = "name"
local userId = "id"
local channel = 0
local userData = {"username","userchannel","id"}

function setUserName()
    term.setCursorPos(1, 1)
    print("please type your name: ")
    local input = read()
    input = userName
    term.clear()
    sleep(0.5)
    term.setCursorPos(1, 1)
    print("please type your id: ")
    local input = read()
    input = userId
    term.clear()
end

function setUserChannel()
    term.setCursorPos(1, 1)
    print("type to set your channel")
    local input = read()
    input = channel
end

function getProparties()
    userData = {userName, channel, userId}
end

function setUp()

end