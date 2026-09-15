-- ============================================================================
-- FAHMI HUB v2
-- SIDEBAR KATEGORI + FILTER SYSTEM + INFO ALL SCRIPT
-- ============================================================================

-- [ SERVICES ]
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer

-- [ CLEANUP ]
local function DestroyOldUI(name)
    local old = CoreGui:FindFirstChild(name)

    if not old and LocalPlayer then
        local PlayerGui = LocalPlayer:FindFirstChild("PlayerGui")
        if PlayerGui then
            old = PlayerGui:FindFirstChild(name)
        end
    end

    if old then
        pcall(function()
            old:Destroy()
        end)
    end
end

DestroyOldUI("fahmiHubGuiV2")

-- [ CONFIG ]
local Theme = {
    Background = Color3.fromRGB(11, 14, 21),
    CardBg = Color3.fromRGB(18, 24, 43),
    CardBgHover = Color3.fromRGB(26, 36, 64),
    AccentBlue = Color3.fromRGB(37, 120, 255),

    BadgeBg = Color3.fromRGB(18, 24, 43),
    BadgeBorder = Color3.fromRGB(34, 50, 86),

    TextPrimary = Color3.fromRGB(255, 255, 255),
    TextSecondary = Color3.fromRGB(140, 155, 180),
    TextMuted = Color3.fromRGB(107, 114, 128),

    BorderColor = Color3.fromRGB(28, 36, 52),

    KeyTagBg = Color3.fromRGB(220, 53, 69),
    NoKeyTagBg = Color3.fromRGB(40, 167, 69),

    WaGreen = Color3.fromRGB(37, 211, 102),
    WaDarkGreen = Color3.fromRGB(18, 38, 28)
}

local WA_CHANNEL_LINK =
    "https://chat.whatsapp.com/I9w7S1W2wKs13rb9Btv7au?s=cl&p=a&mlu=4&ilr=4"


-- ============================================================================
-- [ SCRIPT DATABASE ]
-- Semua URL di bawah dipertahankan dari kode yang kamu kirim.
-- ============================================================================

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
    { name = "SENA HUB V2", status = "No Key", recommended = true, url = "https://raw.githubusercontent.com/senarblx/sena/refs/heads/main/loaderv2sena" },
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
    { name = "VINCI HUB", status = "No Key", recommended = false, url = "https://raw.githubusercontent.com/tutorkah104-rgb/Steal-an-Egg/refs/heads/main/Vincitore.luau" },
    { name = "HORIZON HUB ANTI HIT", status = "No Key", recommended = false, url = 'script_key = "Trial"; loadstring(game:HttpGet("https://api.getpolsec.com/scripts/hosted/6582551b42d21c6b7eb55f1d76d8d50ce53cb35592093d6615b5e83437594dc0.lua"))()' },
    { name = "CHILLI HUB", status = "No Key", recommended = true, url = "https://raw.githubusercontent.com/tienkhanh1/spicy/main/Chilli.lua" },
    { name = "TSUO HUB", status = "No Key", recommended = false, url = "https://raw.githubusercontent.com/Tsuo7/TsuoHub/main/stealanegg" },
    { name = "LKZ HUB", status = "No Key", recommended = false, url = "https://raw.githubusercontent.com/LucasggkX/LKZ-Hub/refs/heads/main/Loader.lua" },
    { name = "REZZY HUB", status = "Key", recommended = false, url = "https://raw.githubusercontent.com/Roman666Cabj/Nether/refs/heads/main/RezzyStealAnEgg.lua" },
    { name = "RAVANGE HUB", status = "Key", recommended = false, url = "https://raw.githubusercontent.com/Revenge-Hub-Roblox/Scripts/refs/heads/main/Loader.lua" }
}

-- [ DEDUPLICATION ]
local CleanedScripts = {}
local DuplicateTracker = {}

for _, scriptInfo in ipairs(ScriptDataStealAnEgg) do
    local identifier =
        tostring(scriptInfo.name)
        .. "|"
        .. tostring(scriptInfo.status)
        .. "|"
        .. tostring(scriptInfo.url)

    if not DuplicateTracker[identifier] then
        DuplicateTracker[identifier] = true
        table.insert(CleanedScripts, scriptInfo)
    end
end

-- [ CATEGORIES ]
local Categories = {
    {
        key = "StealAnEgg",
        name = "STEAL AN EGG",
        type = "script_list",
        scripts = CleanedScripts
    },

    {
        key = "InfoAllScript",
        name = "INFO / ALL SCRIPT",
        type = "info",
        scripts = CleanedScripts
    },

    {
        key = "NewScript",
        name = "NEW SCRIPT",
        type = "new_script",
        scripts = {}
    }
}

local activeCategoryIndex = 1
local activeFilter = "ALL"

-- ============================================================================
-- [ UI HELPERS ]
-- ============================================================================

local function CreateCorner(object, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius)
    corner.Parent = object
    return corner
end

local function CreateStroke(object, color, thickness)
    local stroke = Instance.new("UIStroke")
    stroke.Color = color
    stroke.Thickness = thickness or 1
    stroke.Parent = object
    return stroke
end

local function CreateText(parent, text, size, color, font)
    local label = Instance.new("TextLabel")
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = color or Theme.TextPrimary
    label.TextSize = size or 12
    label.Font = font or Enum.Font.Gotham
    label.Parent = parent
    return label
end

-- ============================================================================
-- [ ROOT GUI ]
-- ============================================================================

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "fahmiHubGuiV2"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

pcall(function()
    ScreenGui.Parent = CoreGui
end)

if not ScreenGui.Parent and LocalPlayer then
    ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
end

-- ============================================================================
-- [ MAIN FRAME ]
-- ============================================================================

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.fromOffset(720, 460)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Position = UDim2.fromScale(0.5, 0.5)
MainFrame.BackgroundColor3 = Theme.Background
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Visible = true
MainFrame.Parent = ScreenGui

CreateCorner(MainFrame, 12)
CreateStroke(MainFrame, Theme.BorderColor, 1)

-- ============================================================================
-- [ HEADER ]
-- ============================================================================

local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 54)
Header.BackgroundTransparency = 1
Header.Parent = MainFrame

local Title = CreateText(
    Header,
    "FAHMI HUB",
    17,
    Theme.TextPrimary,
    Enum.Font.GothamBold
)

Title.Position = UDim2.fromOffset(18, 8)
Title.Size = UDim2.fromOffset(150, 22)
Title.TextXAlignment = Enum.TextXAlignment.Left

local Subtitle = CreateText(
    Header,
    "script steal an egg",
    9,
    Theme.TextSecondary,
    Enum.Font.Gotham
)

Subtitle.Position = UDim2.fromOffset(19, 30)
Subtitle.Size = UDim2.fromOffset(150, 16)
Subtitle.TextXAlignment = Enum.TextXAlignment.Left

-- [ WHATSAPP BUTTON ]

local WaBtn = Instance.new("TextButton")
WaBtn.Name = "WaChannelBtn"
WaBtn.Size = UDim2.fromOffset(190, 30)
WaBtn.Position = UDim2.new(1, -235, 0, 12)
WaBtn.BackgroundColor3 = Theme.WaGreen
WaBtn.Text = "💬 LINK SALURAN WA"
WaBtn.TextColor3 = Theme.TextPrimary
WaBtn.TextSize = 10
WaBtn.Font = Enum.Font.GothamBold
WaBtn.AutoButtonColor = false
WaBtn.Parent = Header

CreateCorner(WaBtn, 6)

WaBtn.MouseEnter:Connect(function()
    TweenService:Create(
        WaBtn,
        TweenInfo.new(0.15),
        {BackgroundColor3 = Theme.WaDarkGreen}
    ):Play()
end)

WaBtn.MouseLeave:Connect(function()
    TweenService:Create(
        WaBtn,
        TweenInfo.new(0.15),
        {BackgroundColor3 = Theme.WaGreen}
    ):Play()
end)

WaBtn.MouseButton1Click:Connect(function()
    local copied = false

    if typeof(setclipboard) == "function" then
        copied = pcall(function()
            setclipboard(WA_CHANNEL_LINK)
        end)
    elseif typeof(toclipboard) == "function" then
        copied = pcall(function()
            toclipboard(WA_CHANNEL_LINK)
        end)
    end

    local oldText = WaBtn.Text
    WaBtn.Text = copied and "✓ COPIED!" or "COPY FAILED"

    task.delay(1.5, function()
        if WaBtn and WaBtn.Parent then
            WaBtn.Text = oldText
        end
    end)
end)

-- [ CLOSE BUTTON ]

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.fromOffset(28, 28)
CloseBtn.Position = UDim2.new(1, -34, 0, 13)
CloseBtn.BackgroundColor3 = Color3.fromRGB(40, 44, 55)
CloseBtn.Text = "×"
CloseBtn.TextColor3 = Theme.TextPrimary
CloseBtn.TextSize = 18
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Parent = Header

CreateCorner(CloseBtn, 6)

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- ============================================================================
-- [ SIDEBAR ]
-- ============================================================================

local Sidebar = Instance.new("Frame")
Sidebar.Name = "Sidebar"
Sidebar.Size = UDim2.fromOffset(175, 386)
Sidebar.Position = UDim2.fromOffset(12, 62)
Sidebar.BackgroundColor3 = Theme.CardBg
Sidebar.BorderS
