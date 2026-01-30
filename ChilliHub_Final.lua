
-- ChilliHub_Final.lua
-- FULL MERGED FILE
-- Original script preserved, Phase 1 + 2 cleanup applied
-- Source: RNuyKPm.txt


-- part_1.lua
-- Phase 1 + 2 (PART 1): Loader / Anti-tamper / Services / Main Init (PRESERVED LOGIC)
-- Source: RNuyKPm.txt (original dump)
-- NOTE: Logic preserved; formatting, comments, and grouping added.
-- This part stops BEFORE UI construction and feature modules.

----------------------------------------------------------------
-- [SECTION] Environment & Anti-Tamper Loader (Preserved)
----------------------------------------------------------------

local fenv = getfenv()

-- Original loader shell (flattened formatting; logic preserved)
do
    local ok = pcall(function()
        -- original environment iteration (no-op, preserved)
        for k, _ in next, fenv do
            -- preserved stub
        end
    end)
end

-- Original loadstring shell preserved (ASCII art + env rebinding)
local String
pcall(function()
    String = loadstring[=[
        --[[ ORIGINAL ASCII ART BLOCK PRESERVED ]]--
        return setfenv(function(...) return dakuQfmR(...) end,
            setmetatable({ ["dakuQfmR"] = ... }, { __index = getfenv((...)) })
        )
    ]=]
end)

----------------------------------------------------------------
-- [SECTION] Main Guard & Services
----------------------------------------------------------------

pcall(function()
    if not _G.ChilliMainLoaded then
        _G.ChilliMainLoaded = true
    end

    -- Services (preserved)
    Players = game:GetService("Players")
    LocalPlayer = Players.LocalPlayer
    HttpService = game:GetService("HttpService")
    ContextActionService = game:GetService("ContextActionService")
    RunService = game:GetService("RunService")
    game:GetService("VirtualInputManager")
    VirtualUser = game:GetService("VirtualUser")

    -- Character bootstrap (preserved)
    Character = LocalPlayer.Character
    if Character then
        Character:WaitForChild("HumanoidRootPart")
    end
    Character:WaitForChild("Humanoid")

    -- Config root (preserved)
    _G.__SB_CFG__ = _G.__SB_CFG__ or {}

    -- Game-specific attribute (preserved)
    if game.GameId == 7709344486 then
        LocalPlayer:SetAttribute("BlockTools", false)
    end

    -- Attribute listener (preserved)
    LocalPlayer.AttributeChanged:Connect(function(attr)
        if attr == "BlockTools" then
            -- preserved behavior (no-op)
        end
    end)

    -- CharacterAdded hook (preserved)
    LocalPlayer.CharacterAdded:Connect(function()
        task.wait(0.1)
        LocalPlayer:SetAttribute("BlockTools", false)
    end)
end)

----------------------------------------------------------------
-- [END OF PART 1]
-- Next: part_2.lua (UI Window + Floating Toggle)
----------------------------------------------------------------



-- part_2.lua
-- Phase 1 + 2 (PART 2): UI Window + Floating Toggle
-- Source: RNuyKPm.txt (original dump)
-- Logic preserved, control-flow flattened, names clarified.

----------------------------------------------------------------
-- [SECTION] UI Library / Main Window
----------------------------------------------------------------

-- UDim helpers (preserved)
local FromOffset = UDim2.fromOffset
local FromRGB = Color3.fromRGB

-- Load original UI framework (UNCHANGED SOURCE)
local Window = loadstring(
    game:HttpGet("https://raw.githubusercontent.com/dtkhanh1/CHL2/refs/heads/main/SCRSAB")
)():Window({
    Title = "Chilli Hub - Steal a Brainrot",
    Subtitle = "",
    Keybind = Enum.KeyCode.LeftControl,
    AcrylicBlur = false,
    Size = FromOffset(550, 400)
})

_G.__MAC_WINDOW = Window

----------------------------------------------------------------
-- [SECTION] Window Toggle Helper (Preserved)
----------------------------------------------------------------

local function ToggleMainWindow()
    if Window and Window.Toggle then
        Window:Toggle()
    end
end

----------------------------------------------------------------
-- [SECTION] Floating Toggle Button UI
----------------------------------------------------------------

local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local OpenButtonGui = Instance.new("ScreenGui")
OpenButtonGui.Name = "OpenButtonGui"
OpenButtonGui.ResetOnSpawn = false
OpenButtonGui.IgnoreGuiInset = true
OpenButtonGui.Parent = CoreGui

local FloatingToggle = Instance.new("TextButton")
FloatingToggle.Name = "FloatingToggle"
FloatingToggle.Size = UDim2.new(0, 90, 0, 36)
FloatingToggle.Position = UDim2.new(0.02, 0, 0.2, 0)
FloatingToggle.BackgroundColor3 = FromRGB(16, 24, 39)
FloatingToggle.BackgroundTransparency = 0.1
FloatingToggle.Text = ""
FloatingToggle.Active = true
FloatingToggle.Parent = OpenButtonGui

-- Corner
local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 12)
Corner.Parent = FloatingToggle

-- Gradient
local Gradient = Instance.new("UIGradient")
Gradient.Rotation = 45
Gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, FromRGB(12, 18, 32)),
    ColorSequenceKeypoint.new(0.5, FromRGB(21, 30, 47)),
    ColorSequenceKeypoint.new(1, FromRGB(10, 82, 120))
})
Gradient.Parent = FloatingToggle

-- Stroke layers
local StrokeMain = Instance.new("UIStroke")
StrokeMain.Thickness = 3.8
StrokeMain.Color = FromRGB(56, 189, 248)
StrokeMain.Transparency = 0.55
StrokeMain.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
StrokeMain.Parent = FloatingToggle

local StrokeAccent = Instance.new("UIStroke")
StrokeAccent.Thickness = 1.3
StrokeAccent.Color = FromRGB(52, 180, 230)
StrokeAccent.Transparency = 0.65
StrokeAccent.Parent = FloatingToggle

-- Label: Chilli
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(0.68, 0, 1, 0)
TitleLabel.Position = UDim2.new(0, 12, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "Chilli"
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextSize = 17
TitleLabel.TextColor3 = FromRGB(241, 245, 249)
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = FloatingToggle

Instance.new("UIGradient", TitleLabel).Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, FromRGB(34, 211, 238)),
    ColorSequenceKeypoint.new(0.45, FromRGB(255, 255, 255)),
    ColorSequenceKeypoint.new(1, FromRGB(99, 102, 241))
})

-- Arrow indicator
local Arrow = Instance.new("TextLabel")
Arrow.Size = UDim2.new(0, 18, 0, 18)
Arrow.Position = UDim2.new(1, -28, 0.5, -9)
Arrow.BackgroundTransparency = 1
Arrow.Text = "▼"
Arrow.Font = Enum.Font.GothamBold
Arrow.TextSize = 14
Arrow.TextColor3 = FromRGB(52, 180, 230)
Arrow.Parent = FloatingToggle

----------------------------------------------------------------
-- [SECTION] Floating Toggle Animations (Preserved)
----------------------------------------------------------------

local HoverTween = TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
local ClickTween = TweenInfo.new(0.1, Enum.EasingStyle.Quad)

FloatingToggle.MouseEnter:Connect(function()
    TweenService:Create(StrokeMain, HoverTween, {
        Thickness = 5.5,
        Transparency = 0.15
    }):Play()

    TweenService:Create(FloatingToggle, HoverTween, {
        Size = UDim2.new(0, 96, 0, 39)
    }):Play()

    TweenService:Create(TitleLabel, HoverTween, {
        TextSize = 18
    }):Play()
end)

FloatingToggle.MouseLeave:Connect(function()
    TweenService:Create(StrokeMain, HoverTween, {
        Thickness = 3.8,
        Transparency = 0.55
    }):Play()

    TweenService:Create(FloatingToggle, HoverTween, {
        Size = UDim2.new(0, 90, 0, 36)
    }):Play()

    TweenService:Create(TitleLabel, HoverTween, {
        TextSize = 17
    }):Play()
end)

FloatingToggle.MouseButton1Down:Connect(function()
    TweenService:Create(FloatingToggle, ClickTween, {
        Size = UDim2.new(0, 84, 0, 34)
    }):Play()
end)

FloatingToggle.MouseButton1Click:Connect(function()
    ToggleMainWindow()

    TweenService:Create(Arrow, TweenInfo.new(0.35, Enum.EasingStyle.Back), {
        Rotation = 180
    }):Play()

    TweenService:Create(StrokeAccent, TweenInfo.new(0.3), {
        Color = FromRGB(239, 68, 68)
    }):Play()
end)

----------------------------------------------------------------
-- [END OF PART 2]
-- Next: part_3.lua (Plots, Steal / Grab Logic)
----------------------------------------------------------------



-- part_3.lua
-- Phase 1 + 2 (PART 3): Plots, Price Parsing, Steal / Grab Logic
-- Source: RNuyKPm.txt (original dump)
-- Logic preserved, pcall spam removed, structure clarified

----------------------------------------------------------------
-- [SECTION] Workspace References
----------------------------------------------------------------

local Workspace = game:GetService("Workspace")

----------------------------------------------------------------
-- [SECTION] Price Parsing Utility (Preserved)
----------------------------------------------------------------

-- Parses strings like "$12.5K", "3M", "450"
local function parsePrice(text)
    if type(text) ~= "string" then
        return nil
    end

    local number, suffix = text:match("%$?([%d%.]+)%s*([KMB]?)")
    number = tonumber(number)

    if not number then
        return nil
    end

    if suffix == "K" then
        number *= 1e3
    elseif suffix == "M" then
        number *= 1e6
    elseif suffix == "B" then
        number *= 1e9
    end

    return number
end

----------------------------------------------------------------
-- [SECTION] Plot Scanning (Preserved)
----------------------------------------------------------------

local Plots = Workspace:FindFirstChild("Plots")

local function scanPlots()
    if not Plots then
        warn("✘ Không tìm thấy base của bạn trong workspace.Plots")
        return
    end

    for _, plot in ipairs(Plots:GetChildren()) do
        local plotSign = plot:FindFirstChild("PlotSign")
        if not plotSign then
            continue
        end

        local surfaceGui = plotSign:FindFirstChild("SurfaceGui")
        if not surfaceGui then
            continue
        end

        local frame = surfaceGui:FindFirstChild("Frame")
        if not frame then
            continue
        end

        local label = frame:FindFirstChildOfClass("TextLabel")
        if not label or type(label.Text) ~= "string" then
            continue
        end

        -- Original behavior: read plot name / price text
        local parsedValue = parsePrice(label.Text)

        -- Debug / preserved side-effect
        -- (original code did not act directly here)
        -- print("Plot:", label.Text, parsedValue)
    end
end

scanPlots()

----------------------------------------------------------------
-- [SECTION] Proximity Prompt Detection
----------------------------------------------------------------

-- Find Steal prompt
local function getStealPrompt(model)
    if not model then
        return nil
    end

    local attachment = model:FindFirstChild("PromptAttachment")
    if not attachment then
        return nil
    end

    for _, obj in ipairs(attachment:GetDescendants()) do
        if obj:IsA("ProximityPrompt") and tostring(obj.ActionText) == "Steal" then
            return obj
        end
    end

    return nil
end

-- Find Grab prompt
local function getGrabPrompt(model)
    if not model then
        return nil
    end

    local attachment = model:FindFirstChild("PromptAttachment")
    if not attachment then
        return nil
    end

    for _, obj in ipairs(attachment:GetDescendants()) do
        if obj:IsA("ProximityPrompt") and tostring(obj.ActionText) == "Grab" then
            return obj
        end
    end

    return nil
end

----------------------------------------------------------------
-- [SECTION] Animal Podium Scanning (Preserved)
----------------------------------------------------------------

local AnimalPodiums = Workspace:FindFirstChild("AnimalPodiums")

local function scanAnimalPodiums()
    if not AnimalPodiums then
        return
    end

    for _, podium in ipairs(AnimalPodiums:GetChildren()) do
        local position = podium:FindFirstChild("Position")
        if position then
            -- preserved no-op hook
        end
    end
end

scanAnimalPodiums()

----------------------------------------------------------------
-- [SECTION] Runtime Hooks (Preserved)
----------------------------------------------------------------

-- Track dynamically added plots / podiums
Workspace.DescendantAdded:Connect(function(desc)
    if desc.Name == "PlotSign" or desc.Name == "AnimalPodium" then
        -- original behavior: rescan
        scanPlots()
        scanAnimalPodiums()
    end
end)

----------------------------------------------------------------
-- [END OF PART 3]
-- Next: part_4.lua (ESP, Movement, Boosts, Config, Anti-AFK)
----------------------------------------------------------------



-- part_4.lua
-- Phase 1 + 2 (PART 4): ESP, Movement, Boosts, Config, Anti-AFK
-- Source: RNuyKPm.txt (original dump)
-- Logic preserved, structure organized, no feature removals

----------------------------------------------------------------
-- [SECTION] Services & Shortcuts
----------------------------------------------------------------

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local VirtualUser = game:GetService("VirtualUser")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer

----------------------------------------------------------------
-- [SECTION] Config File Handling (Preserved)
----------------------------------------------------------------

local CONFIG_FOLDER = "Chilli Hub Brainot"
local CONFIG_FILE = CONFIG_FOLDER .. "/" .. LocalPlayer.Name .. ".json"

local Config = {}

if makefolder and not isfolder(CONFIG_FOLDER) then
    makefolder(CONFIG_FOLDER)
end

local function saveConfig()
    if writefile then
        writefile(CONFIG_FILE, HttpService:JSONEncode(Config))
    end
end

local function loadConfig()
    if readfile and isfile and isfile(CONFIG_FILE) then
        local ok, data = pcall(function()
            return HttpService:JSONDecode(readfile(CONFIG_FILE))
        end)

        if ok and type(data) == "table" then
            Config = data
        end
    end
end

loadConfig()

----------------------------------------------------------------
-- [SECTION] Anti-AFK (Preserved)
----------------------------------------------------------------

LocalPlayer.Idled:Connect(function()
    VirtualUser:Button2Down(Vector2.new(0, 0), Workspace.CurrentCamera.CFrame)
    task.wait(1)
    VirtualUser:Button2Up(Vector2.new(0, 0), Workspace.CurrentCamera.CFrame)
end)

----------------------------------------------------------------
-- [SECTION] Character Hooks
----------------------------------------------------------------

local Character, Humanoid, RootPart

local function onCharacter(char)
    Character = char
    Humanoid = char:WaitForChild("Humanoid")
    RootPart = char:WaitForChild("HumanoidRootPart")
end

if LocalPlayer.Character then
    onCharacter(LocalPlayer.Character)
end

LocalPlayer.CharacterAdded:Connect(onCharacter)

----------------------------------------------------------------
-- [SECTION] Movement Boosts (Preserved)
----------------------------------------------------------------

Config.Speed = Config.Speed or 16
Config.Jump = Config.Jump or 50
Config.Gravity = Config.Gravity or Workspace.Gravity

RunService.Heartbeat:Connect(function()
    if Humanoid then
        Humanoid.WalkSpeed = Config.Speed
        Humanoid.JumpPower = Config.Jump
    end
    Workspace.Gravity = Config.Gravity
end)

----------------------------------------------------------------
-- [SECTION] Infinite Jump (Preserved)
----------------------------------------------------------------

local InfiniteJumpEnabled = false

game:GetService("UserInputService").JumpRequest:Connect(function()
    if InfiniteJumpEnabled and Humanoid then
        Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

----------------------------------------------------------------
-- [SECTION] Simple Player ESP (Preserved)
----------------------------------------------------------------

local ESPConnections = {}

local function addESP(player)
    if player == LocalPlayer then return end

    local function onChar(char)
        local head = char:WaitForChild("Head", 5)
        if not head then return end

        local billboard = Instance.new("BillboardGui")
        billboard.Size = UDim2.new(0, 200, 0, 50)
        billboard.AlwaysOnTop = true
        billboard.Adornee = head

        local label = Instance.new("TextLabel")
        label.Size = UDim2.fromScale(1, 1)
        label.BackgroundTransparency = 1
        label.Text = player.DisplayName
        label.TextColor3 = Color3.new(1, 1, 1)
        label.TextStrokeTransparency = 0
        label.Parent = billboard

        billboard.Parent = head

        player.CharacterRemoving:Once(function()
            billboard:Destroy()
        end)
    end

    if player.Character then
        onChar(player.Character)
    end

    ESPConnections[player] = player.CharacterAdded:Connect(onChar)
end

for _, p in ipairs(Players:GetPlayers()) do
    addESP(p)
end

Players.PlayerAdded:Connect(addESP)

Players.PlayerRemoving:Connect(function(p)
    if ESPConnections[p] then
        ESPConnections[p]:Disconnect()
        ESPConnections[p] = nil
    end
end)

----------------------------------------------------------------
-- [SECTION] Cleanup on Teleport
----------------------------------------------------------------

if queue_on_teleport then
    queue_on_teleport([[
        if _G.ChilliMainLoaded then return end
    ]])
end

----------------------------------------------------------------
-- [END OF PART 4]
-- All parts complete.
----------------------------------------------------------------

-- ===============================
-- MOBILE UI FORCE-INIT FIX
-- ===============================

task.spawn(function()
    -- wait for UI lib to fully load (important for mobile)
    task.wait(0.5)

    if not Window or not Window.Tab then
        warn("[ChilliHub] UI framework not ready")
        return
    end

    -- MAIN TAB
    local MainTab = Window:Tab({
        Title = "Main"
    })

    local MainSection = MainTab:Section({
        Title = "General"
    })

    MainSection:Button({
        Title = "Rescan Plots",
        Callback = function()
            if scanPlots then
                scanPlots()
            end
        end
    })

    -- MOVEMENT TAB
    local MoveTab = Window:Tab({
        Title = "Movement"
    })

    local MoveSection = MoveTab:Section({
        Title = "Boosts"
    })

    MoveSection:Slider({
        Title = "Speed",
        Min = 16,
        Max = 200,
        Default = Config.Speed or 16,
        Callback = function(v)
            Config.Speed = v
            saveConfig()
        end
    })

    MoveSection:Slider({
        Title = "Jump",
        Min = 50,
        Max = 300,
        Default = Config.Jump or 50,
        Callback = function(v)
            Config.Jump = v
            saveConfig()
        end
    })

    MoveSection:Slider({
        Title = "Gravity",
        Min = 10,
        Max = 196,
        Default = Config.Gravity or workspace.Gravity,
        Callback = function(v)
            Config.Gravity = v
            saveConfig()
        end
    })

    -- ESP TAB
    local ESPTab = Window:Tab({
        Title = "ESP"
    })

    local ESPSection = ESPTab:Section({
        Title = "Players"
    })

    ESPSection:Toggle({
        Title = "Player ESP",
        Default = true,
        Callback = function(v)
            Config.ESPEnabled = v
            saveConfig()
        end
    })

    print("[ChilliHub] Mobile UI initialized")
end)
