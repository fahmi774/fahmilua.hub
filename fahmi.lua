-- ============================================================================
-- FAHMI HUB v2 - SIDEBAR KATEGORI + FILTER SYSTEM + ELEGANT INFO ALL SCRIPT
-- ============================================================================

-- [ PRE-INITIALIZATION CLEANUP ]
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function DestroyOldUI(name)
    local old = CoreGui:FindFirstChild(name) or (LocalPlayer and LocalPlayer:FindFirstChild("PlayerGui") and LocalPlayer.PlayerGui:FindFirstChild(name))
    if old then
        pcall(function() old:Destroy() end)
    end
end

DestroyOldUI("FAHMIHubGuiV2")

-- [ 1. SERVICES ]
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- [ 2. CONFIGURASI & THEME ]
local Theme = {
    Background = Color3.fromRGB(11, 14, 21),
    CardBg = Color3.fromRGB(18, 24, 43),
    CardBgHover = Color3.fromRGB(26, 36, 64),
    AccentBlue = Color3.fromRGB(37, 120, 255),
    BadgeBg = Color3.fromRGB(18, 24, 43),
    BadgeBorder = Color3.fromRGB(34, 50, 86),
    RunPillBg = Color3.fromRGB(34, 50, 86),
    TextPrimary = Color3.fromRGB(255, 255, 255),
    TextSecondary = Color3.fromRGB(140, 155, 180),
    TextMuted = Color3.fromRGB(107, 114, 128),
    BorderColor = Color3.fromRGB(28, 36, 52),
    GoldBadge = Color3.fromRGB(255, 185, 0),
    KeyTagBg = Color3.fromRGB(220, 53, 69),
    NoKeyTagBg = Color3.fromRGB(40, 167, 69),
    WaGreen = Color3.fromRGB(37, 211, 102),
    WaDarkGreen = Color3.fromRGB(18, 38, 28)
}

local WA_CHANNEL_LINK = "https://whatsapp.com/channel/"

-- [ MAIN GITHUB LOADER TERPISAH ]
local MAIN_GITHUB_LOADER = "https://raw.githubusercontent.com/n01771542-cmd/faluahub/main/main.lua"

-- [ 3. DATA KATEGORI & DAFTAR SCRIPT ]
local ScriptDataStealAnEgg = {
    { name = "YANTO HUB KEY : YANTOHUB", status = "Key", recommended = true, url = "https://raw.githubusercontent.com/YantoRoblox/Script-Free-YantoHUB/refs/heads/main/YantoHUB" },
    { name = "FYY HUB", status = "Key", recommended = true, url = "https://FyyCommunity.my.id" },
    { name = "SPEED HUB", status = "Key", recommended = false, url = "https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua" },
    { name = "BIGFROOT HUB", status = "Key", recommended = false, url = "https://raw.githubusercontent.com/hanniii1/Loader/refs/heads/main/BFLoader.lua" },
    { name = "CHIYO HUB", status = "Key", recommended = false, url = "https://raw.githubusercontent.com/kaisenlmao/loader/refs/heads/main/chiyo.lua" },
    { name = "CLOVER HUB", status = "Key", recommended = true, url = "https://cloverhub.app/clover.lua" },
    { name = "ZERO POINT HUB", status = "No Key", recommended = false, url = "https://raw.githubusercontent.com/JaxRol/ZeroPoint/refs/heads/main/KeySystem" },
    { name = "UB HUB", status = "No Key", recommended = false, url = "https://raw.githubusercontent.com/TeamUBHub/UBLoader/refs/heads/main/Loader.lua" },
    { name = "VALINC HUB", status = "No Key", recommended = false, url = "https://api.valincsyndicate.com/v1/releases/5502cba03703f4a3628d522d396b80d8.lua" },
    { name = "OUROBOROS HUB", status = "No Key", recommended = false, url = "https://raw.githubusercontent.com/joustingmatch/Ouroboros/main/loader.lua" },
    { name = "OMG HUB", status = "Key", recommended = false, url = "https://raw.githubusercontent.com/Omgshit/Scripts/main/MainLoader.lua" },
    { name = "NASI RENDANG LUA", status = "Key", recommended = true, url = "https://raw.githubusercontent.com/JualNasiRendang/loader/refs/heads/main/main.lua" },
    { name = "UNKNOWN HUB", status = "Key", recommended = false, url = "https://unknownhub.win/api/projects/54474b4c5d5a4f459909c4cb70e7b4f3/loader" },
    { name = "RIFT", status = "Key", recommended = false, url = "https://rifton.top/loader.lua" },
    { name = "AIR FLOW", status = "Key", recommended = false, url = "https://airflowscript.com/loader" },
    { name = "SOLIX HUB", status = "Key", recommended = false, url = "https://raw.githubusercontent.com/bao8jl/solixhub/main/loader" },
    { name = "HOSHI HUB", status = "No Key", recommended = false, url = "https://hoshihub.site/loader.lua" },
    { name = "ZERO IMPACT", status = "Key", recommended = false, url = "https://www.zeroimpact.online/raw/loader" },
    { name = "SNOWY HUB", status = "Key", recommended = false, url = "https://flowauth.net/v1/ui/a87f00d9adf63658655fcd02ab86a4ef.lua" },
    { name = "AJJANS HUB", status = "Key", recommended = true, url = "https://raw.githubusercontent.com/virtuososvisualedits-prog/Ww/refs/heads/main/final-obfuscated.lua" },
    { name = "NEMESIS HUB", status = "Key", recommended = false, url = "https://raw.githubusercontent.com/x2zu/loader/main/freeloader.lua" },
    { name = "NIGHT HUB", status = "No Key", recommended = false, url = "https://pastefy.app/J29hE5fR/raw" },
    { name = "LUMIN HUB", status = "No Key", recommended = false, url = "http://luminon.top/loader.lua" },
    { name = "CIAO HUB", status = "No Key", recommended = false, url = "https://pastefy.app/YoZocJ8O/raw" },
    { name = "ZHENN HUB SPAWNER", status = "Key", recommended = false, url = "https://raw.githubusercontent.com/ZhennHub/PetSpawner/refs/heads/main/lua" },
    { name = "DECODEX", status = "No Key", recommended = false, url = "https://raw.githubusercontent.com/ItzYumi/Decode/refs/heads/main/DE%3ACODE.lua" },
    { name = "CRZ HUB", status = "No Key", recommended = false, url = "https://flowauth.net/v1/loaders/3c4e87ed34813171b0f8d53a108a7d88.lua" },
    { name = "KEXXE HUB", status = "Key", recommended = false, url = "https://raw.githubusercontent.com/premiumbuddy/kex/refs/heads/main/kexxxx" },
    { name = "NOVA HUB", status = "Key", recommended = false, url = "https://raw.githubusercontent.com/NovaHubRBLX/NovaHub/refs/heads/main/novahub.lua" },
    { name = "VANTAGE", status = "Key", recommended = false, url = "https://raw.githubusercontent.com/MisterNovitski/Vantage/refs/heads/main/mm2.txt" },
    { name = "SPORTSCLUB HUB", status = "Key", recommended = false, url = "https://loader.sportsclub.fun/loader.luau" },
    { name = "SCRIPTVERSE HUB", status = "Key", recommended = false, url = "https://scriptversekey.xyz/s/steal-an-egg" },
    { name = "GS HUB", status = "Key", recommended = false, url = "https://gist.githubusercontent.com/spiritualgaming1123-beep/46ef55c5f8284e076aafc5ebd12233f4/raw/5b24749c3931c1838a76e64c9af508dcdd03700a/gistfile1.lua" },
    { name = "PROBEST", status = "Key", recommended = false, url = "https://api.jnkie.com/api/v1/luascripts/public/0199b576f5c2d5a34159f0f9f4e1de0a566b4d1da5b1cfa5d2f71ade9bdcaa24/download" },
    { name = "SYSHUB FUN", status = "Key", recommended = false, url = "https://syshub.fun/free" },
    { name = "FOXNAME", status = "No Key", recommended = true, url = "https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/Fn-stealanegg.lua" },
    { name = "DUPE EGG + DUPE PET", status = "No Key", recommended = false, url = "https://raw.githubusercontent.com/INF-Hub-PL/StealAEggScript/refs/heads/main/Pet_SpawnerV1" },
    { name = "RONNEI HUB", status = "No Key", recommended = true, url = "https://raw.githubusercontent.com/elonmod/skibidi/refs/heads/main/Ronneihub-keyless.lua" },
    { name = "AXONIC HUB", status = "Key", recommended = false, url = "https://raw.githubusercontent.com/Kenniel123/Steal-A-Egg/refs/heads/main/Steal%20A%20Egg" },
    { name = "NEOX HUB", status = "Key", recommended = false, url = "https://raw.githubusercontent.com/hassanxzayn-lua/NEOXHUBMAIN/refs/heads/main/loader" },
    { name = "LENNON V2", status = "No Key", recommended = true, url = "https://raw.githubusercontent.com/lennonxscripts/lennonhubv2/refs/heads/main/stealaneggv2" },
    { name = "SAIOPS HUB", status = "Key", recommended = false, url = "https://api.saiops.cc/scripts/Steal-An-Egg-Script.lua" },
    { name = "ZEROIN HUB", status = "Key", recommended = false, url = "https://zeroinhub.com/api/script" },
    { name = "ONHUB VIET", status = "Key", recommended = false, url = "https://raw.githubusercontent.com/ronnei/freemium/refs/heads/main/loader.lua" },
    { name = "MIRANDA HUB V2", status = "No Key", recommended = true, url = "https://raw.githubusercontent.com/miirandahub/loader/refs/heads/main/stealaeggs" },
    { name = "PROJECT-MADARA", status = "No Key", recommended = false, url = "https://raw.githubusercontent.com/IsThisMe01/Project-Madara/refs/heads/main/stealanegg" },
    { name = "NEVERLOSE", status = "Key", recommended = false, url = "https://raw.githubusercontent.com/inrate1337/NeverloseLoaderRoblox/refs/heads/main/main.luau" },
    { name = "SPIRITUAL GAMING HUB", status = "Key", recommended = false, url = "https://gist.githubusercontent.com/spiritualgaming1123-beep/f2c8c4009b2c4d4dda1b3d5fcb263ef3/raw/121ff8c9b59476a7a362b543edc61499e5832937/gistfile1.lua" },
    { name = "CRYSTALIZED HUB", status = "Key", recommended = false, url = "https://api.jnkie.com/api/v1/luascripts/public/a62237c6a75399adc9add4151ebeeb91c1f965fab665a650dcbc699a5622b37f/download" },
    { name = "OCTOPUS HUB", status = "Key", recommended = false, url = "https://www.octopushub.xyz/loader" },
    { name = "SYSNEROX", status = "Key", recommended = false, url = "https://raw.githubusercontent.com/DrakarDev/Hud/refs/heads/main/steal_an_egg.lua" },
    { name = "JINHUB", status = "Key", recommended = false, url = "https://jinhub.my.id/scripts/Universal.lua" },
    { name = "OVERFLOW", status = "Key", recommended = false, url = "https://overflow.cx/loader.lua" },
    { name = "BLYXO HUB", status = "No Key", recommended = true, url = "https://flowauth.net/v1/loaders/69d3463240384f3a73fbe32c178093a2.lua" },
    { name = "SENA V3", status = "No Key", recommended = true, url = "https://raw.githubusercontent.com/senarblx/sena/refs/heads/main/senav3go" },
    { name = "TOOLBOX", status = "No Key", recommended = false, url = "https://raw.githubusercontent.com/Abdullahking20/loader-lua/main/loader" },
    { name = "SOLVEXGUI HUB", status = "Key", recommended = false, url = "https://raw.githubusercontent.com/Solvexxxx/Scripts/refs/heads/main/SolvexGUI_SAE.lua" },
    { name = "SPEED BYPASS", status = "No Key", recommended = false, url = "https://pastefy.app/iedWaiQX/raw" },
    { name = "SAKURA HUB", status = "Key", recommended = false, url = "https://flowauth.net/v1/ui/d00ec69382de97372fc9559efc722298.lua" },
    { name = "LUNARIS HUB", status = "Key", recommended = false, url = "https://jnkie.com/loaders/lunaris" },
    { name = "FORGE HUB", status = "Key", recommended = false, url = "https://cdn.forgehub.store/loader" },
    { name = "BASEMENT HUB", status = "Key", recommended = false, url = "https://thebsmt.xyz/BSMT" },
    { name = "KALI HUB", status = "Key", recommended = false, url = "https://kalihub.xyz/loader.lua" },
    { name = "CORE HUB", status = "Key", recommended = false, url = "https://getcore.lol/loader.lua" },
    { name = "INDRA HUB", status = "Key", recommended = false, url = "https://api.jnkie.com/api/v1/luascripts/public/2b7d97ed2525cef705b26f22d6964b87dd4b64a1bf533ac61d9edf6df14e8471/download" },
    { name = "PET/EGG SPAWNER", status = "No Key", recommended = false, url = "https://api.luarmor.net/files/v4/loaders/d8f1c691a58edb11ef782849f80e9b61.lua" },
    { name = "APEL HUB", status = "Key", recommended = false, url = "https://apelhub.com/loader.lua" },
    { name = "PANDA HUB", status = "Key", recommended = false, url = "https://raw.githubusercontent.com/Muhammad6196/Project-Infinity-X/refs/heads/main/main.lua" },
    { name = "LUCID HUB", status = "Key", recommended = false, url = "https://gist.githubusercontent.com/IlyassSama/d4c20dcabe62c225b3e96a43cdb0eae9/raw/82020fd08fbff2ad69731e650d960f7d59a07fac/notifier.lua" },
    { name = "FISHY", status = "Key", recommended = false, url = "https://jnkie.com/loaders/fishyhub" },
    { name = "SCRIPTFARMER", status = "Key", recommended = false, url = "https://scriptfarmer.dpdns.org/loader/stealanegg-serverhoper" },
    { name = "VIVID LUA", status = "Key", recommended = false, url = "https://vivid.vividhub.workers.dev/loader.lua" },
    { name = "BERRI HUB", status = "Key", recommended = false, url = "https://raw.githubusercontent.com/moshixzn/ahhagdienavd/refs/heads/main/loader.lua.txt" },
    { name = "NOCTRUNHUB", status = "Key", recommended = false, url = "https://raw.githubusercontent.com/insanecontenty2k-blip/scriptss/main/universalscriptsofop" },
    { name = "CITRA HUB", status = "No Key", recommended = false, url = "https://raw.githubusercontent.com/gilgameshfate59/ohbfoosk8tid/main/CitraLoader.lua" },
    { name = "VINCI HUB", status = "No Key", recommended = true, url = "https://raw.githubusercontent.com/tutorkah104-rgb/Steal-an-Egg/refs/heads/main/Vincitore.luau" },
    { name = "HORIZON HUB ANTI HIT", status = "No Key", recommended = false, url = 'script_key = "Trial"; loadstring(game:HttpGet("https://api.getpolsec.com/scripts/hosted/6582551b42d21c6b7eb55f1d76d8d50ce53cb35592093d6615b5e83437594dc0.lua"))()' },
    { name = "CHILLI HUB", status = "No Key", recommended = true, url = "https://raw.githubusercontent.com/tienkhanh1/spicy/main/Chilli.lua" },
    { name = "TSUO HUB", status = "No Key", recommended = true, url = "https://raw.githubusercontent.com/Tsuo7/TsuoHub/main/stealanegg" },
    { name = "LKZ HUB", status = "No Key", recommended = true, url = "https://raw.githubusercontent.com/LucasggkX/LKZ-Hub/refs/heads/main/Loader.lua" },
    { name = "REZZY HUB", status = "Key", recommended = false, url = "https://raw.githubusercontent.com/Roman666Cabj/Nether/refs/heads/main/RezzyStealAnEgg.lua" },
    { name = "RAVANGE HUB", status = "Key", recommended = false, url = "https://raw.githubusercontent.com/Revenge-Hub-Roblox/Scripts/refs/heads/main/Loader.lua" },
    { name = "ZNEX HUB", status = "Key", recommended = false, url = "https://api.jnkie.com/api/v1/luascripts/public/181cfe2bd5df35ce78607b5ffb37c6666abd76eda11ff33b0f24a1b2d8ee935f/download" },
    { name = "ASVARA HUB", status = "Key", recommended = false, url = "https://raw.githubusercontent.com/asvraRoblox/stealegg/refs/heads/main/main" },
    { name = "VSN", status = "No Key", recommended = false, url = "https://raw.githubusercontent.com/NetNullv1/VSN/refs/heads/main/HUB" },
    { name = "SHADOW HUB", status = "Key", recommended = false, url = "https://pastebin.com/raw/QAvDbBKa" },
    { name = "VELOX HUB", status = "Key", recommended = false, url = "https://api.jnkie.com/api/v1/luascripts/public/f0b3ce85f588800ae7e46415fc4dd79ff2b0d09c9b6a8e19cea8a67b47f1bcbd/download" },
    { name = "KING VYPER (KEY: KV-FREE-TRIAL-WOKS)", status = "Key", recommended = false, url = "https://kingvypers.site/raw/TrialLoader" },
    { name = "HIP-HUP", status = "Key", recommended = true, url = "https://hiphub.cloud/api/script-roblox/loader" }
}

-- [ DATA NEW SCRIPTS (6 NEW SCRIPTS) ]
local NewScriptsData = {
    { name = "BK HUB", status = "No Key", recommended = true, url = "https://api.luarmor.net/files/v4/loaders/9ee4edde227ac85f50872bf9e4226508.lua" },
    { name = "AXURS", status = "No Key", recommended = false, url = "https://raw.githubusercontent.com/XE3Scripts/Axur-sGamesHub/refs/heads/main/StealAnEgg" },
    { name = "POTATO HUB", status = "Key", recommended = false, url = "https://raw.githubusercontent.com/potatohub67/potatoscripts/refs/heads/main/stealaegg.lua" },
    { name = "JANE HUB", status = "No Key", recommended = false, url = "https://flowauth.net/v1/loaders/3c4e87ed34813171b0f8d53a108a7d88.lua" },
    { name = "WIS HUB", status = "No Key", recommended = true, url = "https://api.wishub.cloud/files/loader.lua" },
    { name = "SOFTKILLZ", status = "No Key", recommended = false, url = "https://pastebin.com/raw/ZuEBwb5K" }
}

-- Otomatis masukkan NewScriptsData ke dalam ScriptDataStealAnEgg agar masuk ke tab Steal An Egg & Info
for _, newScript in ipairs(NewScriptsData) do
    table.insert(ScriptDataStealAnEgg, newScript)
end

-- Deduplikasi jika name + status + url persis sama
local CleanedScripts = {}
local DuplicateTracker = {}
for _, s in ipairs(ScriptDataStealAnEgg) do
    local identifier = s.name .. "|" .. s.status .. "|" .. s.url
    if not DuplicateTracker[identifier] then
        DuplicateTracker[identifier] = true
        table.insert(CleanedScripts, s)
    end
end

local Categories = {
    {
        key = "StealAnEgg",
        name = "steal an egg",
        type = "script_list",
        scripts = CleanedScripts,
    },
    {
        key = "InfoAllScript",
        name = "info/all script",
        type = "info",
        scripts = CleanedScripts,
    },
    {
        key = "NewScript",
        name = "new script",
        type = "new_script",
        scripts = NewScriptsData,
        hasNotification = true, -- Tanda bahwa kategori ini memiliki pembaruan/notifikasi
    },
}

local activeCategoryIndex = 1
local activeFilter = "ALL"

-- [ 4. ROOT UI ]
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FAHMIHubGuiV2"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

pcall(function() ScreenGui.Parent = CoreGui end)
if not ScreenGui.Parent then ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui") end

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.fromOffset(620, 380)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Position = UDim2.fromScale(0.5, 0.5)
MainFrame.BackgroundColor3 = Theme.Background
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = false
MainFrame.Active = true
MainFrame.Visible = false
MainFrame.Parent = ScreenGui

Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 12)

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Theme.BorderColor
MainStroke.Thickness = 1
MainStroke.Parent = MainFrame

local MainScale = Instance.new("UIScale")
MainScale.Scale = 0
MainScale.Parent = MainFrame

-- [ 5. LOGO VEKTOR "F" ]
local function CreateFLogo(size, rotation)
    local container = Instance.new("Frame")
    container.Size = size
    container.BackgroundTransparency = 1
    container.Rotation = rotation or -12

    local topBar = Instance.new("Frame")
    topBar.Size = UDim2.new(1, 0, 0, math.floor(size.Y.Offset * 0.28))
    topBar.BackgroundColor3 = Theme.AccentBlue
    topBar.BorderSizePixel = 0
    topBar.Parent = container
    Instance.new("UICorner", topBar).CornerRadius = UDim.new(0, 2)

    local midBar = Instance.new("Frame")
    midBar.Size = UDim2.new(0.68, 0, 0, math.floor(size.Y.Offset * 0.24))
    midBar.Position = UDim2.new(0.2, 0, 0.4, 0)
    midBar.BackgroundColor3 = Theme.AccentBlue
    midBar.BorderSizePixel = 0
    midBar.Parent = container
    Instance.new("UICorner", midBar).CornerRadius = UDim.new(0, 2)

    local stem = Instance.new("Frame")
    stem.Size = UDim2.new(0, math.floor(size.X.Offset * 0.28), 1, 0)
    stem.Position = UDim2.new(0.08, 0, 0, 0)
    stem.BackgroundColor3 = Theme.AccentBlue
    stem.BorderSizePixel = 0
    stem.Parent = container
    Instance.new("UICorner", stem).CornerRadius = UDim.new(0, 2)

    return container
end

-- [ 6. HEADER ]
local Header = Instance.new("Frame")
Header.Name = "Header"
Header.Size = UDim2.new(1, 0, 0, 46)
Header.BackgroundTransparency = 1
Header.Active = true
Header.Parent = MainFrame

local LogoF = CreateFLogo(UDim2.fromOffset(18, 18), -12)
LogoF.Position = UDim2.new(0, 14, 0, 10)
LogoF.Parent = Header

local Badge = Instance.new("TextLabel")
Badge.Name = "Badge"
Badge.Font = Enum.Font.GothamBold
Badge.TextSize = 9
Badge.TextColor3 = Color3.fromRGB(111, 168, 255)
Badge.BackgroundColor3 = Theme.BadgeBg
Badge.Size = UDim2.fromOffset(120, 18)
Badge.Position = UDim2.new(0, 40, 0, 26)
Badge.Text = "script steal an egg"
Badge.TextXAlignment = Enum.TextXAlignment.Center
Badge.Parent = Header

Instance.new("UICorner", Badge).Corne
