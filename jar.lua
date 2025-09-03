local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

--// Loader UI (Key System)
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 320, 0, 200)
Frame.Position = UDim2.new(0.35, 0, 0.35, 0)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.Active = true
Frame.Draggable = true
Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 12)

local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Text = "🔑 KeyByBijarrrr"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 18

local keyInput = Instance.new("TextBox", Frame)
keyInput.PlaceholderText = "Enter Key..."
keyInput.Size = UDim2.new(0.9, 0, 0, 35)
keyInput.Position = UDim2.new(0.05, 0, 0.3, 0)
keyInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
keyInput.TextColor3 = Color3.fromRGB(255, 255, 255)

local getBtn = Instance.new("TextButton", Frame)
getBtn.Text = "Get Key"
getBtn.Size = UDim2.new(0.43, 0, 0, 35)
getBtn.Position = UDim2.new(0.05, 0, 0.55, 0)
getBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
getBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", getBtn)

local checkBtn = Instance.new("TextButton", Frame)
checkBtn.Text = "Check Key"
checkBtn.Size = UDim2.new(0.43, 0, 0, 35)
checkBtn.Position = UDim2.new(0.52, 0, 0.55, 0)
checkBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
checkBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", checkBtn)

local statusLbl = Instance.new("TextLabel", Frame)
statusLbl.Size = UDim2.new(1, 0, 0, 25)
statusLbl.Position = UDim2.new(0, 0, 0.85, 0)
statusLbl.BackgroundTransparency = 1
statusLbl.Text = "Menunggu input..."
statusLbl.TextColor3 = Color3.fromRGB(255, 255, 255)

--// Tombol Get Key
getBtn.MouseButton1Click:Connect(function()
    local link = "https://workink.net/23OS/9odzqxj1" -- ganti dengan linkmu
    if setclipboard then
        setclipboard(link)
        statusLbl.Text = "📋 Link GetKey dicopy!"
    else
        statusLbl.Text = "🌐 Buka link manual:\n" .. link
    end
end)

--// Tombol Check Key
checkBtn.MouseButton1Click:Connect(function()
    local token = keyInput.Text
    if token == "" then
        statusLbl.Text = "⚠ Masukkan key dulu!"
        return
    end

    local url = "https://work.ink/_api/v2/token/isValid/" .. token .. "?deleteToken=1"

    local success, response = pcall(function()
        return game:HttpGet(url)
    end)

    if not success then
        statusLbl.Text = "⚠ Tidak bisa connect API!"
        return
    end

    local data
    local ok = pcall(function()
        data = HttpService:JSONDecode(response)
    end)

    if not ok or not data then
        statusLbl.Text = "⚠ Response API salah!"
        return
    end

    if data.valid then
        statusLbl.Text = "✅ Key valid! Membuka script..."
        task.wait(1)
        ScreenGui:Destroy()

        --// ===== Auto Fish UI =====
        local FishGUI = Instance.new("ScreenGui", game.CoreGui)
        local FrameAF = Instance.new("Frame", FishGUI)
        FrameAF.Size = UDim2.new(0, 250, 0, 140)
        FrameAF.Position = UDim2.new(0.35, 0, 0.3, 0)
        FrameAF.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        FrameAF.Active = true
        FrameAF.Draggable = true
        Instance.new("UICorner", FrameAF).CornerRadius = UDim.new(0,12)

        local TitleAF = Instance.new("TextLabel", FrameAF)
        TitleAF.Size = UDim2.new(1,0,0,25)
        TitleAF.Text = "ScriptByBijarrrr"
        TitleAF.TextColor3 = Color3.fromRGB(255,255,255)
        TitleAF.BackgroundTransparency = 1
        TitleAF.Font = Enum.Font.GothamBold
        TitleAF.TextSize = 16

        local MinimizeBtnAF = Instance.new("TextButton", FrameAF)
        MinimizeBtnAF.Size = UDim2.new(0.2,0,0,25)
        MinimizeBtnAF.Position = UDim2.new(0.75,0,0,0)
        MinimizeBtnAF.Text = "-"
        MinimizeBtnAF.TextColor3 = Color3.fromRGB(255,255,255)
        MinimizeBtnAF.BackgroundColor3 = Color3.fromRGB(60,60,60)
        Instance.new("UICorner", MinimizeBtnAF).CornerRadius = UDim.new(0,8)

        local FishButton = Instance.new("TextButton", FrameAF)
        FishButton.Size = UDim2.new(0.8,0,0,30)
        FishButton.Position = UDim2.new(0.1,0,0.35,0)
        FishButton.Text = "▶ START Auto Fish"
        FishButton.BackgroundColor3 = Color3.fromRGB(0,170,0)
        FishButton.TextColor3 = Color3.fromRGB(255,255,255)
        Instance.new("UICorner", FishButton)

        local FishDelayBox = Instance.new("TextBox", FrameAF)
        FishDelayBox.Size = UDim2.new(0.8,0,0,25)
        FishDelayBox.Position = UDim2.new(0.1,0,0.65,0)
        FishDelayBox.Text = "2"
        FishDelayBox.BackgroundColor3 = Color3.fromRGB(50,50,50)
        FishDelayBox.TextColor3 = Color3.fromRGB(255,255,255)
        Instance.new("UICorner", FishDelayBox).CornerRadius = UDim.new(0,6)

        local fishing = false
        local minimized = false
        local rod = "Basic Rod" -- ganti jika beda

        local function autoFish()
            while fishing do
                local delay = tonumber(FishDelayBox.Text) or 2
                local argsCatch = { "Complete" }
                pcall(function()
                    player.Character:WaitForChild(rod):WaitForChild("MiniGame"):FireServer(unpack(argsCatch))
                end)
                print("🎣 Auto Catch!")
                task.wait(delay)
            end
        end

        FishButton.MouseButton1Click:Connect(function()
            fishing = not fishing
            if fishing then
                FishButton.Text = "⏹ STOP Auto Fish"
                FishButton.BackgroundColor3 = Color3.fromRGB(170,0,0)
                task.spawn(autoFish)
            else
                FishButton.Text = "▶ START Auto Fish"
                FishButton.BackgroundColor3 = Color3.fromRGB(0,170,0)
            end
        end)

        MinimizeBtnAF.MouseButton1Click:Connect(function()
            minimized = not minimized
            if minimized then
                FrameAF.Size = UDim2.new(0,250,0,25)
                FishButton.Visible = false
                FishDelayBox.Visible = false
                MinimizeBtnAF.Text = "+"
            else
                FrameAF.Size = UDim2.new(0,250,0,140)
                FishButton.Visible = true
                FishDelayBox.Visible = true
                MinimizeBtnAF.Text = "-"
            end
        end)

    else
        statusLbl.Text = "❌ Key salah / expired"
    end
end)
