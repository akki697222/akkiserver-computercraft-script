local dfpwm = require("cc.audio.dfpwm")
local speaker = peripheral.find("speaker")
local decoder = dfpwm.make_decoder()

function decord(music)
    shell.run("delete song.dfpwm")
    shell.run("wget", music, "song.dfpwm")
    for chunk in io.lines("song.dfpwm", 16 * 1024) do
        local buffer = decoder(chunk)
        
        while not speaker.playAudio(buffer, 3) do
            os.pullEvent("speaker_audio_empty")
        end
    end
end

term.setCursorPos(1,1)
print("URL:")
url = read()
decord(url)
