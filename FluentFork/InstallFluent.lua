-- Fluent Installation
local n = "Lazy's Fluent Installer"
function log(...) print("["..n.."] -", ...) end

log("Initializing")
local primarygit = "https://raw.githubusercontent.com/LazyNoobGithub/UFE/refs/heads/main/FluentFork/"
local installfiles = {
    "main",
    "InterfaceManager",
    "SaveManager"
}
local extension = ".lua"

local installfolder_name = "FluentFork"

function http(url)
    return game:HttpGet(url)
end

function createScriptFile(folder, scriptName, data)
    if not(isfolder(folder)) then
        makefolder(folder)
        log("Created Folder: ".. folder)
    end

    if not(isfile(folder.."/"..scriptName)) then
        local downloadName = folder.."/"..scriptName
        log("Creating file: "..scriptName)
        writefile(downloadName, data)
    end
end

for i,v in pairs(installfiles) do
    local dataURL = primarygit..v..extension
    local scriptName = v..extension

    local scriptData = http(dataURL)
    createScriptFile(installfolder_name, scriptName, scriptData)
end

log("Downloaded all files!")
