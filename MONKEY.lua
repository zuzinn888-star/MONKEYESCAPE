-- Krevetka Hub | +1 Speed Monkey Escape (Final Fixed +1 Win AutoFarm)

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

if CoreGui:FindFirstChild("KrevetkaHubGUI") then
    CoreGui.KrevetkaHubGUI:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KrevetkaHubGUI"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local ToggleButton = Instance.new("ImageButton")
ToggleButton.Name = "ToggleMenuBtn"
ToggleButton.Parent = ScreenGui
ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.Position = UDim2.new(0, 20, 0.5, -30)
ToggleButton.Size = UDim2.new(0, 60, 0, 60)
ToggleButton.Image = "rbxassetid://126106122827633"
ToggleButton.ScaleType = Enum.ScaleType.Crop
ToggleButton.Active = true
ToggleButton.Draggable = true

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 12)
ToggleCorner.Parent = ToggleButton

local ToggleStroke = Instance.new("UIStroke")
ToggleStroke.Color = Color3.fromRGB(0, 170, 255)
ToggleStroke.Thickness = 2
ToggleStroke.Parent = ToggleButton

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -240, 0.5, -170)
MainFrame.Size = UDim2.new(0, 480, 0, 340)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = true

ToggleButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 14)
UICorner.Parent = MainFrame

local Background = Instance.new("ImageLabel")
Background.Name = "Background"
Background.Parent = MainFrame
Background.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Background.BackgroundTransparency = 0
Background.Size = UDim2.new(1, 0, 1, 0)
Background.Image = "rbxassetid://126106122827633" 
Background.ScaleType = Enum.ScaleType.Crop
Background.ImageTransparency = 0.25

local BGCorner = Instance.new("UICorner")
BGCorner.CornerRadius = UDim.new(0, 14)
BGCorner.Parent = Background

local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(10, 10, 18)
TopBar.BackgroundTransparency = 0.35
TopBar.Size = UDim2.new(1, 0, 0, 45)

local TopBarCorner = Instance.new("UICorner")
TopBarCorner.CornerRadius = UDim.new(0, 14)
TopBarCorner.Parent = TopBar

local Title = Instance.new("TextLabel")
Title.Parent = TopBar
Title.BackgroundTransparency = 1.00
Title.Position = UDim2.new(0, 15, 0, 0)
Title.Size = UDim2.new(0, 350, 1, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = "Krevetka Hub | Monkey Escape"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 14
Title.TextXAlignment = Enum.TextXAlignment.Left

local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Parent = TopBar
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseButton.BackgroundTransparency = 0.2
CloseButton.Position = UDim2.new(1, -38, 0.5, -14)
CloseButton.Size = UDim2.new(0, 28, 0, 28)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 14

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseButton

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

local MainContainer = Instance.new("ScrollingFrame")
MainContainer.Parent = MainFrame
MainContainer.Active = true
MainContainer.BackgroundTransparency = 1.00
MainContainer.Position = UDim2.new(0, 15, 0, 55)
MainContainer.Size = UDim2.new(1, -30, 1, -65)
MainContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
MainContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y
MainContainer.ScrollBarThickness = 4

local MainListLayout = Instance.new("UIListLayout")
MainListLayout.Parent = MainContainer
MainListLayout.SortOrder = Enum.SortOrder.LayoutOrder
MainListLayout.Padding = UDim.new(0, 10)

local function createMainButton(name, callback)
    local Button = Instance.new("TextButton")
    Button.Parent = MainContainer
    Button.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
    Button.BackgroundTransparency = 0.25
    Button.Size = UDim2.new(1, 0, 0, 42)
    Button.AutoButtonColor = false
    Button.Font = Enum.Font.GothamSemibold
    Button.Text = name
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.TextSize = 14

    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 8)
    BtnCorner.Parent = Button

    Button.MouseButton1Click:Connect(callback)
    
    Button.MouseEnter:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(55, 55, 85)}):Play()
    end)
    Button.MouseLeave:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(30, 30, 45)}):Play()
    end)
end

local selectedWinTarget = "+1 Win"
local flightSpeed = 80 
local autoFarmActive = false
local flyEnabled = false
local flySpeed = 50

local DropdownContainer = Instance.new("Frame")
DropdownContainer.Parent = MainContainer
DropdownContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
DropdownContainer.BackgroundTransparency = 0.25
DropdownContainer.Size = UDim2.new(1, 0, 0, 42)

local DropdownCorner = Instance.new("UICorner")
DropdownCorner.CornerRadius = UDim.new(0, 8)
DropdownCorner.Parent = DropdownContainer

local DropdownLabel = Instance.new("TextLabel")
DropdownLabel.Parent = DropdownContainer
DropdownLabel.BackgroundTransparency = 1
DropdownLabel.Position = UDim2.new(0, 10, 0, 0)
DropdownLabel.Size = UDim2.new(0.5, 0, 1, 0)
DropdownLabel.Font = Enum.Font.GothamSemibold
DropdownLabel.Text = "Выбор побед:"
DropdownLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
DropdownLabel.TextSize = 13
DropdownLabel.TextXAlignment = Enum.TextXAlignment.Left

local targetsList = {"+1 Win", "+5 Wins", "+20 Wins", "+100 Wins"}
local targetIndex = 1

local DropdownButton = Instance.new("TextButton")
DropdownButton.Parent = DropdownContainer
DropdownButton.BackgroundColor3 = Color3.fromRGB(50, 50, 75)
DropdownButton.Position = UDim2.new(0.5, 0, 0.15, 0)
DropdownButton.Size = UDim2.new(0.48, 0, 0.7, 0)
DropdownButton.Font = Enum.Font.GothamBold
DropdownButton.Text = targetsList[targetIndex]
DropdownButton.TextColor3 = Color3.fromRGB(255, 255, 0)
DropdownButton.TextSize = 12

local DropBtnCorner = Instance.new("UICorner")
DropBtnCorner.CornerRadius = UDim.new(0, 6)
DropBtnCorner.Parent = DropdownButton

DropdownButton.MouseButton1Click:Connect(function()
    targetIndex = targetIndex + 1
    if targetIndex > #targetsList then targetIndex = 1 end
    selectedWinTarget = targetsList[targetIndex]
    DropdownButton.Text = selectedWinTarget
end)

local SliderContainer = Instance.new("Frame")
SliderContainer.Parent = MainContainer
SliderContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
SliderContainer.BackgroundTransparency = 0.25
SliderContainer.Size = UDim2.new(1, 0, 0, 55)

local SliderCorner = Instance.new("UICorner")
SliderCorner.CornerRadius = UDim.new(0, 8)
SliderCorner.Parent = SliderContainer

local SliderLabel = Instance.new("TextLabel")
SliderLabel.Parent = SliderContainer
SliderLabel.BackgroundTransparency = 1
SliderLabel.Position = UDim2.new(0, 10, 0, 5)
SliderLabel.Size = UDim2.new(1, -20, 0, 20)
SliderLabel.Font = Enum.Font.GothamSemibold
SliderLabel.Text = "Скорость полёта к кубику: " .. flightSpeed
SliderLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
SliderLabel.TextSize = 13
SliderLabel.TextXAlignment = Enum.TextXAlignment.Left

local SliderBg = Instance.new("Frame")
SliderBg.Parent = SliderContainer
SliderBg.BackgroundColor3 = Color3.fromRGB(50, 50, 75)
SliderBg.Position = UDim2.new(0, 10, 0, 32)
SliderBg.Size = UDim2.new(1, -20, 0, 8)

local SliderBgCorner = Instance.new("UICorner")
SliderBgCorner.CornerRadius = UDim.new(0, 4)
SliderBgCorner.Parent = SliderBg

local SliderFill = Instance.new("Frame")
SliderFill.Parent = SliderBg
SliderFill.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
SliderFill.Size = UDim2.new((flightSpeed - 1) / 199, 0, 1, 0)

local SliderFillCorner = Instance.new("UICorner")
SliderFillCorner.CornerRadius = UDim.new(0, 4)
SliderFillCorner.Parent = SliderFill

local draggingSlider = false
SliderBg.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then draggingSlider = true end
end)
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then draggingSlider = false end
end)
UserInputService.InputChanged:Connect(function(input)
    if draggingSlider and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local mousePos = UserInputService:GetMouseLocation().X
        local framePos = SliderBg.AbsolutePosition.X
        local frameSize = SliderBg.AbsoluteSize.X
        local scale = math.clamp((mousePos - framePos) / frameSize, 0, 1)
        flightSpeed = math.floor(1 + scale * 199)
        SliderFill.Size = UDim2.new(scale, 0, 1, 0)
        SliderLabel.Text = "Скорость полёта к кубику: " .. flightSpeed
    end
end)

local ToggleButtonContainer = Instance.new("Frame")
ToggleButtonContainer.Parent = MainContainer
ToggleButtonContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
ToggleButtonContainer.BackgroundTransparency = 0.25
ToggleButtonContainer.Size = UDim2.new(1, 0, 0, 50)

local ToggleBtnCorner = Instance.new("UICorner")
ToggleBtnCorner.CornerRadius = UDim.new(0, 8)
ToggleBtnCorner.Parent = ToggleButtonContainer

local ToggleBtnLabel = Instance.new("TextLabel")
ToggleBtnLabel.Parent = ToggleButtonContainer
ToggleBtnLabel.BackgroundTransparency = 1
ToggleBtnLabel.Position = UDim2.new(0, 10, 0, 0)
ToggleBtnLabel.Size = UDim2.new(0.7, 0, 1, 0)
ToggleBtnLabel.Font = Enum.Font.GothamSemibold
ToggleBtnLabel.Text = "Автофарм побед"
ToggleBtnLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleBtnLabel.TextSize = 13
ToggleBtnLabel.TextXAlignment = Enum.TextXAlignment.Left

local SwitchBg = Instance.new("Frame")
SwitchBg.Parent = ToggleButtonContainer
SwitchBg.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
SwitchBg.Position = UDim2.new(1, -65, 0.5, -12)
SwitchBg.Size = UDim2.new(0, 50, 0, 24)

local SwitchBgCorner = Instance.new("UICorner")
SwitchBgCorner.CornerRadius = UDim.new(1, 0)
SwitchBgCorner.Parent = SwitchBg

local SwitchCircle = Instance.new("Frame")
SwitchCircle.Parent = SwitchBg
SwitchCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SwitchCircle.Position = UDim2.new(0, 2, 0.5, -10)
SwitchCircle.Size = UDim2.new(0, 20, 0, 20)

local SwitchCircleCorner = Instance.new("UICorner")
SwitchCircleCorner.CornerRadius = UDim.new(1, 0)
SwitchCircleCorner.Parent = SwitchCircle

local ClickDetector = Instance.new("TextButton")
ClickDetector.Parent = ToggleButtonContainer
ClickDetector.BackgroundTransparency = 1
ClickDetector.Size = UDim2.new(1, 0, 1, 0)
ClickDetector.Text = ""

-- ИДЕАЛЬНО ИСПРАВЛЕННЫЙ ПОИСК ЖЕЛТОГО КУБИКА (С поддержкой точного поиска "+1 Win")
local function findExactYellowCube(targetName)
    local targetNum = targetName:match("%d+")
    if not targetNum then return nil end
    
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("BasePart") then
            -- Игнорируем красный цвет, ищем строго желтые кубики
            if v.Color.R > 0.6 and v.Color.G > 0.6 and v.Color.B < 0.4 then
                for _, child in pairs(v:GetDescendants()) do
                    if child:IsA("TextLabel") then
                        local txt = child.Text:gsub("%s+", ""):lower()
                        -- Поддержка различных форматов написания (+1win, +1win!, +1wins)
                        if txt == "+" .. targetNum .. "win" or txt == "+" .. targetNum .. "wins" or txt == "+" .. targetNum .. "win!" or txt == "+" .. targetNum .. "wins!" or txt:find("+" .. targetNum .. "win") then
                            return v
                        end
                    end
                end
            end
        end
    end
    
    -- Запасной поиск по любому текстовому ярлыку на желтой платформе
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("BasePart") then
            for _, child in pairs(v:GetDescendants()) do
                if child:IsA("TextLabel") then
                    local txt = child.Text:gsub("%s+", ""):lower()
                    if txt:find("+" .. targetNum .. "win") then
                        return v
                    end
                end
            end
        end
    end
    
    return nil
end

ClickDetector.MouseButton1Click:Connect(function()
    autoFarmActive = not autoFarmActive
    if autoFarmActive then
        TweenService:Create(SwitchBg, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(76, 217, 100)}):Play()
        TweenService:Create(SwitchCircle, TweenInfo.new(0.2), {Position = UDim2.new(1, -22, 0.5, -10)}):Play()
        
        task.spawn(function()
            while autoFarmActive do
                pcall(function()
                    local char = LocalPlayer.Character
                    if char and char:FindFirstChild("HumanoidRootPart") then
                        local hrp = char.HumanoidRootPart
                        local spawnPos = hrp.CFrame

                        local targetPart = findExactYellowCube(selectedWinTarget)

                        if targetPart then
                            local distance = (hrp.Position - targetPart.Position).Magnitude
                            local duration = math.clamp(distance / (flightSpeed * 3.5), 0.05, 2)

                            local tween = TweenService:Create(hrp, TweenInfo.new(duration, Enum.EasingStyle.Linear), {CFrame = targetPart.CFrame + Vector3.new(0, 3, 0)})
                            tween:Play()
                            tween.Completed:Wait()

                            task.wait(0.4)
                            hrp.CFrame = spawnPos
                            task.wait(0.4)
                        else
                            task.wait(0.5)
                        end
                    end
                end)
                task.wait(0.1)
            end
        end)
    else
        TweenService:Create(SwitchBg, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(150, 150, 150)}):Play()
        TweenService:Create(SwitchCircle, TweenInfo.new(0.2), {Position = UDim2.new(0, 2, 0.5, -10)}):Play()
    end
end)

local FlyToggleMainContainer = Instance.new("Frame")
FlyToggleMainContainer.Parent = MainContainer
FlyToggleMainContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
FlyToggleMainContainer.BackgroundTransparency = 0.25
FlyToggleMainContainer.Size = UDim2.new(1, 0, 0, 50)

local FlyMainCorner = Instance.new("UICorner")
FlyMainCorner.CornerRadius = UDim.new(0, 8)
FlyMainCorner.Parent = FlyToggleMainContainer

local FlyMainLabel = Instance.new("TextLabel")
FlyMainLabel.Parent = FlyToggleMainContainer
FlyMainLabel.BackgroundTransparency = 1
FlyMainLabel.Position = UDim2.new(0, 10, 0, 0)
FlyMainLabel.Size = UDim2.new(0.7, 0, 1, 0)
FlyMainLabel.Font = Enum.Font.GothamSemibold
FlyMainLabel.Text = "Включить Fly (Полёт)"
FlyMainLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
FlyMainLabel.TextSize = 13
FlyMainLabel.TextXAlignment = Enum.TextXAlignment.Left

local FlyMainSwitchBg = Instance.new("Frame")
FlyMainSwitchBg.Parent = FlyToggleMainContainer
FlyMainSwitchBg.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
FlyMainSwitchBg.Position = UDim2.new(1, -65, 0.5, -12)
FlyMainSwitchBg.Size = UDim2.new(0, 50, 0, 24)

local FlyMainSwitchBgCorner = Instance.new("UICorner")
FlyMainSwitchBgCorner.CornerRadius = UDim.new(1, 0)
FlyMainSwitchBgCorner.Parent = FlyMainSwitchBg

local FlyMainSwitchCircle = Instance.new("Frame")
FlyMainSwitchCircle.Parent = FlyMainSwitchBg
FlyMainSwitchCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FlyMainSwitchCircle.Position = UDim2.new(0, 2, 0.5, -10)
FlyMainSwitchCircle.Size = UDim2.new(0, 20, 0, 20)

local FlyMainSwitchCircleCorner = Instance.new("UICorner")
FlyMainSwitchCircleCorner.CornerRadius = UDim.new(1, 0)
FlyMainSwitchCircleCorner.Parent = FlyMainSwitchCircle

local FlyMainClick = Instance.new("TextButton")
FlyMainClick.Parent = FlyMainSwitchBg
FlyMainClick.BackgroundTransparency = 1
FlyMainClick.Size = UDim2.new(1, 0, 1, 0)
FlyMainClick.Text = ""

FlyMainClick.MouseButton1Click:Connect(function()
    flyEnabled = not flyEnabled
    if flyEnabled then
        TweenService:Create(FlyMainSwitchBg, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(76, 217, 100)}):Play()
        TweenService:Create(FlyMainSwitchCircle, TweenInfo.new(0.2), {Position = UDim2.new(1, -22, 0.5, -10)}):Play()
    else
        TweenService:Create(FlyMainSwitchBg, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(150, 150, 150)}):Play()
        TweenService:Create(FlyMainSwitchCircle, TweenInfo.new(0.2), {Position = UDim2.new(0, 2, 0.5, -10)}):Play()
    end
end)

createMainButton("🔓 Открыть Админ-дорожки / Барьеры", function()
    pcall(function()
        local openedCount = 0
        for _, v in pairs(Workspace:GetDescendants()) do
            if v:IsA("BasePart") then
                local name = v.Name:lower()
                if name:find("barrier") or name:find("wall") or name:find("kanat") or name:find("admin") or name:find("vip") or name:find("door") then
                    if v.Transparency > 0.5 or v.CanCollide == true or name:find("admin") or name:find("vip") then
                        v.CanCollide = false
                        v.Transparency = 0.95
                        openedCount = openedCount + 1
                    end
                end
            end
        end
        print("Админ-дорожки разблокированы! Снято преград: " .. openedCount)
    end)
end)

createMainButton("⚡ Авто-набор скорости (Тренажеры)", function()
    task.spawn(function()
        while true do
            pcall(function()
                for _, v in pairs(game:GetService("ReplicatedStorage"):GetDescendants()) do
                    if v:IsA("RemoteEvent") and (v.Name:lower():find("speed") or v.Name:lower():find("click") or v.Name:lower():find("train")) then
                        v:FireServer()
                    end
                end
            end)
            task.wait(0.1)
        end
    end)
end)

RunService.RenderStepped:Connect(function()
    pcall(function()
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            local hrp = char.HumanoidRootPart
            local cam = Workspace.CurrentCamera
            
            if flyEnabled then
                hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                local moveDir = Vector3.new(0, 0, 0)
                
                if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + cam.CFrame.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - cam.CFrame.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - cam.CFrame.RightVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + cam.CFrame.RightVector end
                
                hrp.CFrame = hrp.CFrame + (moveDir * (flySpeed * 0.05))
            end
        end
    end)
end)

print("Krevetka Hub успешно запущен, бро!")
