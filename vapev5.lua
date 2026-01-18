--[[
    ███╗   ██╗███████╗██╗  ██╗██╗   ██╗███████╗██╗   ██╗██╗
    ████╗  ██║██╔════╝╚██╗██╔╝██║   ██║██╔════╝██║   ██║██║
    ██╔██╗ ██║█████╗   ╚███╔╝ ██║   ██║███████╗██║   ██║██║
    ██║╚██╗██║██╔══╝   ██╔██╗ ██║   ██║╚════██║██║   ██║██║
    ██║ ╚████║███████╗██╔╝ ██╗╚██████╔╝███████║╚██████╔╝██║
    ╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝ ╚═════╝ ╚═╝
    
    VapeV5 v1.0.0 | Professional UI Library for Roblox
    GitHub: https://github.com/yourname/VapeV5
    
    Usage:
    local VapeV5 = loadstring(game:HttpGet("URL"))()
    local Window = VapeV5:CreateWindow({ Title = "My Menu" })
]]

local VapeV5 = {}
VapeV5.__index = VapeV5
VapeV5.Version = "1.0.0"
VapeV5.Windows = {}
VapeV5.Flags = {}

-- ═══════════════════════════════════════════════════════════════════
-- SERVICES
-- ═══════════════════════════════════════════════════════════════════
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local Lighting = game:GetService("Lighting")
local HttpService = game:GetService("HttpService")

local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()

-- ═══════════════════════════════════════════════════════════════════
-- THEMES
-- ═══════════════════════════════════════════════════════════════════
VapeV5.Themes = {
    Dark = {
        Background = Color3.fromRGB(15, 15, 15),
        Sidebar = Color3.fromRGB(18, 18, 18),
        TopBar = Color3.fromRGB(22, 22, 22),
        Card = Color3.fromRGB(25, 25, 25),
        CardHover = Color3.fromRGB(30, 30, 30),
        Border = Color3.fromRGB(40, 40, 40),
        Text = Color3.fromRGB(220, 220, 220),
        TextMuted = Color3.fromRGB(150, 150, 150),
        TextDark = Color3.fromRGB(100, 100, 100),
        Accent = Color3.fromRGB(0, 255, 140),
        AccentDark = Color3.fromRGB(0, 200, 110),
        Toggle = Color3.fromRGB(60, 60, 60),
        ToggleEnabled = Color3.fromRGB(0, 255, 140),
        Slider = Color3.fromRGB(45, 45, 45),
        SliderFill = Color3.fromRGB(0, 255, 140),
        Dropdown = Color3.fromRGB(30, 30, 30),
        Input = Color3.fromRGB(30, 30, 30),
        Shadow = Color3.fromRGB(0, 0, 0),
    },
    
    Purple = {
        Background = Color3.fromRGB(18, 15, 25),
        Sidebar = Color3.fromRGB(22, 18, 30),
        TopBar = Color3.fromRGB(25, 22, 35),
        Card = Color3.fromRGB(28, 25, 38),
        CardHover = Color3.fromRGB(35, 30, 45),
        Border = Color3.fromRGB(50, 40, 60),
        Text = Color3.fromRGB(220, 220, 230),
        TextMuted = Color3.fromRGB(150, 140, 160),
        TextDark = Color3.fromRGB(100, 90, 110),
        Accent = Color3.fromRGB(160, 100, 255),
        AccentDark = Color3.fromRGB(130, 80, 210),
        Toggle = Color3.fromRGB(50, 45, 60),
        ToggleEnabled = Color3.fromRGB(160, 100, 255),
        Slider = Color3.fromRGB(40, 35, 50),
        SliderFill = Color3.fromRGB(160, 100, 255),
        Dropdown = Color3.fromRGB(30, 25, 40),
        Input = Color3.fromRGB(30, 25, 40),
        Shadow = Color3.fromRGB(0, 0, 0),
    },
    
    Ocean = {
        Background = Color3.fromRGB(12, 18, 25),
        Sidebar = Color3.fromRGB(15, 22, 30),
        TopBar = Color3.fromRGB(18, 26, 35),
        Card = Color3.fromRGB(20, 30, 40),
        CardHover = Color3.fromRGB(25, 38, 50),
        Border = Color3.fromRGB(35, 55, 75),
        Text = Color3.fromRGB(220, 230, 240),
        TextMuted = Color3.fromRGB(140, 160, 180),
        TextDark = Color3.fromRGB(90, 110, 130),
        Accent = Color3.fromRGB(0, 180, 255),
        AccentDark = Color3.fromRGB(0, 140, 210),
        Toggle = Color3.fromRGB(40, 55, 70),
        ToggleEnabled = Color3.fromRGB(0, 180, 255),
        Slider = Color3.fromRGB(35, 50, 65),
        SliderFill = Color3.fromRGB(0, 180, 255),
        Dropdown = Color3.fromRGB(25, 35, 45),
        Input = Color3.fromRGB(25, 35, 45),
        Shadow = Color3.fromRGB(0, 0, 0),
    },
    
    Blood = {
        Background = Color3.fromRGB(20, 12, 12),
        Sidebar = Color3.fromRGB(25, 15, 15),
        TopBar = Color3.fromRGB(30, 18, 18),
        Card = Color3.fromRGB(35, 22, 22),
        CardHover = Color3.fromRGB(45, 28, 28),
        Border = Color3.fromRGB(60, 35, 35),
        Text = Color3.fromRGB(240, 220, 220),
        TextMuted = Color3.fromRGB(180, 140, 140),
        TextDark = Color3.fromRGB(130, 90, 90),
        Accent = Color3.fromRGB(255, 60, 60),
        AccentDark = Color3.fromRGB(200, 40, 40),
        Toggle = Color3.fromRGB(55, 40, 40),
        ToggleEnabled = Color3.fromRGB(255, 60, 60),
        Slider = Color3.fromRGB(50, 35, 35),
        SliderFill = Color3.fromRGB(255, 60, 60),
        Dropdown = Color3.fromRGB(35, 22, 22),
        Input = Color3.fromRGB(35, 22, 22),
        Shadow = Color3.fromRGB(0, 0, 0),
    }
}

-- ═══════════════════════════════════════════════════════════════════
-- UTILITY FUNCTIONS
-- ═══════════════════════════════════════════════════════════════════
local Utility = {}

function Utility.Create(instanceType, properties, children)
    local instance = Instance.new(instanceType)
    
    for property, value in pairs(properties or {}) do
        if property ~= "Parent" then
            instance[property] = value
        end
    end
    
    for _, child in pairs(children or {}) do
        child.Parent = instance
    end
    
    if properties and properties.Parent then
        instance.Parent = properties.Parent
    end
    
    return instance
end

function Utility.Tween(instance, properties, duration, easingStyle, easingDirection)
    duration = duration or 0.15
    easingStyle = easingStyle or Enum.EasingStyle.Quad
    easingDirection = easingDirection or Enum.EasingDirection.Out
    
    local tweenInfo = TweenInfo.new(duration, easingStyle, easingDirection)
    local tween = TweenService:Create(instance, tweenInfo, properties)
    tween:Play()
    return tween
end

function Utility.Ripple(parent, x, y, color)
    local ripple = Utility.Create("Frame", {
        Parent = parent,
        BackgroundColor3 = color or Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 0.7,
        BorderSizePixel = 0,
        Position = UDim2.new(0, x - parent.AbsolutePosition.X, 0, y - parent.AbsolutePosition.Y),
        Size = UDim2.new(0, 0, 0, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        ZIndex = 100
    }, {
        Utility.Create("UICorner", {
            CornerRadius = UDim.new(1, 0)
        })
    })
    
    local maxSize = math.max(parent.AbsoluteSize.X, parent.AbsoluteSize.Y) * 2
    
    Utility.Tween(ripple, {
        Size = UDim2.new(0, maxSize, 0, maxSize),
        BackgroundTransparency = 1
    }, 0.4)
    
    task.delay(0.4, function()
        ripple:Destroy()
    end)
end

function Utility.Drag(frame, dragFrame)
    dragFrame = dragFrame or frame
    
    local dragging = false
    local dragInput, mousePos, framePos
    
    dragFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            mousePos = input.Position
            framePos = frame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    dragFrame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - mousePos
            frame.Position = UDim2.new(
                framePos.X.Scale,
                framePos.X.Offset + delta.X,
                framePos.Y.Scale,
                framePos.Y.Offset + delta.Y
            )
        end
    end)
end

function Utility.GetTextBounds(text, font, size)
    return game:GetService("TextService"):GetTextSize(text, size, font, Vector2.new(1000, 1000))
end

-- ═══════════════════════════════════════════════════════════════════
-- BLUR CONTROLLER
-- ═══════════════════════════════════════════════════════════════════
local BlurController = {}
BlurController.Blur = nil
BlurController.Enabled = false

function BlurController:Init()
    self.Blur = Instance.new("BlurEffect")
    self.Blur.Size = 0
    self.Blur.Name = "VapeV5Blur"
    self.Blur.Parent = Lighting
end

function BlurController:Enable(size)
    if not self.Blur then self:Init() end
    self.Enabled = true
    Utility.Tween(self.Blur, {Size = size or 10}, 0.3)
end

function BlurController:Disable()
    if not self.Blur then return end
    self.Enabled = false
    Utility.Tween(self.Blur, {Size = 0}, 0.3)
end

function BlurController:Toggle()
    if self.Enabled then
        self:Disable()
    else
        self:Enable()
    end
end

function BlurController:Destroy()
    if self.Blur then
        self.Blur:Destroy()
        self.Blur = nil
    end
end

VapeV5.Blur = BlurController

-- ═══════════════════════════════════════════════════════════════════
-- NOTIFICATION SYSTEM
-- ═══════════════════════════════════════════════════════════════════
local NotificationSystem = {}
NotificationSystem.Container = nil
NotificationSystem.Active = {}

function NotificationSystem:Init(parent)
    if self.Container then return end
    
    self.Container = Utility.Create("Frame", {
        Parent = parent,
        Name = "NotificationContainer",
        BackgroundTransparency = 1,
        Size = UDim2.new(0, 300, 1, 0),
        Position = UDim2.new(1, -320, 0, 0),
        ZIndex = 1000
    }, {
        Utility.Create("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Bottom,
            Padding = UDim.new(0, 10)
        }),
        Utility.Create("UIPadding", {
            PaddingBottom = UDim.new(0, 20)
        })
    })
end

function NotificationSystem:Notify(options)
    options = options or {}
    local title = options.Title or "Notification"
    local message = options.Message or ""
    local duration = options.Duration or 3
    local type_ = options.Type or "Info"
    local theme = options.Theme or VapeV5.Themes.Dark
    
    local typeColors = {
        Info = theme.Accent,
        Success = Color3.fromRGB(0, 255, 100),
        Warning = Color3.fromRGB(255, 200, 0),
        Error = Color3.fromRGB(255, 60, 60)
    }
    
    local notification = Utility.Create("Frame", {
        Parent = self.Container,
        BackgroundColor3 = theme.Card,
        Size = UDim2.new(1, 0, 0, 0),
        ClipsDescendants = true,
        ZIndex = 1000
    }, {
        Utility.Create("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }),
        Utility.Create("UIStroke", {
            Color = theme.Border,
            Transparency = 0.5
        }),
        Utility.Create("Frame", {
            Name = "AccentLine",
            BackgroundColor3 = typeColors[type_] or theme.Accent,
            Size = UDim2.new(0, 3, 1, 0),
            BorderSizePixel = 0
        }),
        Utility.Create("Frame", {
            Name = "Content",
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 15, 0, 0),
            Size = UDim2.new(1, -15, 1, 0)
        }, {
            Utility.Create("TextLabel", {
                Name = "Title",
                BackgroundTransparency = 1,
                Position = UDim2.new(0, 0, 0, 10),
                Size = UDim2.new(1, -10, 0, 20),
                Font = Enum.Font.GothamBold,
                Text = title,
                TextColor3 = theme.Text,
                TextSize = 14,
                TextXAlignment = Enum.TextXAlignment.Left
            }),
            Utility.Create("TextLabel", {
                Name = "Message",
                BackgroundTransparency = 1,
                Position = UDim2.new(0, 0, 0, 32),
                Size = UDim2.new(1, -10, 0, 40),
                Font = Enum.Font.Gotham,
                Text = message,
                TextColor3 = theme.TextMuted,
                TextSize = 12,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Top,
                TextWrapped = true
            })
        })
    })
    
    Utility.Tween(notification, {Size = UDim2.new(1, 0, 0, 80)}, 0.3, Enum.EasingStyle.Back)
    
    task.delay(duration, function()
        Utility.Tween(notification, {Size = UDim2.new(1, 0, 0, 0)}, 0.3)
        task.wait(0.3)
        notification:Destroy()
    end)
    
    return notification
end

VapeV5.Notifications = NotificationSystem

-- ═══════════════════════════════════════════════════════════════════
-- WINDOW CLASS
-- ═══════════════════════════════════════════════════════════════════
local Window = {}
Window.__index = Window

function VapeV5:CreateWindow(options)
    options = options or {}
    
    local windowData = {
        Title = options.Title or "VapeV5",
        Size = options.Size or UDim2.fromOffset(620, 450),
        Theme = (type(options.Theme) == "string" and VapeV5.Themes[options.Theme]) or options.Theme or VapeV5.Themes.Dark,
        MinimizeKey = options.MinimizeKey or Enum.KeyCode.RightShift,
        Visible = true,
        Tabs = {},
        CurrentTab = nil,
        Flags = VapeV5.Flags
    }
    
    setmetatable(windowData, Window)
    
    -- Clean old UI
    if CoreGui:FindFirstChild("VapeV5") then
        CoreGui:FindFirstChild("VapeV5"):Destroy()
    end
    
    -- ScreenGui
    local screenGui = Utility.Create("ScreenGui", {
        Parent = CoreGui,
        Name = "VapeV5",
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        ResetOnSpawn = false
    })
    
    windowData.ScreenGui = screenGui
    
    -- Initialize notification system
    NotificationSystem:Init(screenGui)
    
    -- Background Layer (for blur overlay effect)
    local backgroundLayer = Utility.Create("Frame", {
        Parent = screenGui,
        Name = "BackgroundLayer",
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 1, 0),
        ZIndex = 0
    })
    
    windowData.BackgroundLayer = backgroundLayer
    
    -- Main Window
    local mainWindow = Utility.Create("Frame", {
        Parent = screenGui,
        Name = "MainWindow",
        BackgroundColor3 = windowData.Theme.Background,
        Size = windowData.Size,
        Position = UDim2.new(0.5, 0, 0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        ClipsDescendants = true
    }, {
        Utility.Create("UICorner", {
            CornerRadius = UDim.new(0, 10)
        })
    })
    
    windowData.MainWindow = mainWindow
    
    -- Shadow
    local shadow = Utility.Create("ImageLabel", {
        Parent = mainWindow,
        Name = "Shadow",
        BackgroundTransparency = 1,
        Position = UDim2.new(0.5, 0, 0.5, 0),
        Size = UDim2.new(1, 40, 1, 40),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Image = "rbxassetid://5028857084",
        ImageColor3 = windowData.Theme.Shadow,
        ImageTransparency = 0.5,
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(24, 24, 276, 276),
        ZIndex = -1
    })
    
    -- Top Bar
    local topBar = Utility.Create("Frame", {
        Parent = mainWindow,
        Name = "TopBar",
        BackgroundColor3 = windowData.Theme.TopBar,
        Size = UDim2.new(1, 0, 0, 40),
        BorderSizePixel = 0
    }, {
        Utility.Create("UICorner", {
            CornerRadius = UDim.new(0, 10)
        }),
        Utility.Create("Frame", {
            Name = "BottomCover",
            BackgroundColor3 = windowData.Theme.TopBar,
            Size = UDim2.new(1, 0, 0, 15),
            Position = UDim2.new(0, 0, 1, -15),
            BorderSizePixel = 0
        })
    })
    
    windowData.TopBar = topBar
    Utility.Drag(mainWindow, topBar)
    
    -- Title
    local title = Utility.Create("TextLabel", {
        Parent = topBar,
        Name = "Title",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 15, 0, 0),
        Size = UDim2.new(0, 200, 1, 0),
        Font = Enum.Font.GothamBold,
        Text = windowData.Title,
        TextColor3 = windowData.Theme.Text,
        TextSize = 16,
        TextXAlignment = Enum.TextXAlignment.Left
    })
    
    -- Top Bar Buttons Container
    local topBarButtons = Utility.Create("Frame", {
        Parent = topBar,
        Name = "Buttons",
        BackgroundTransparency = 1,
        Position = UDim2.new(1, -120, 0, 0),
        Size = UDim2.new(0, 110, 1, 0)
    }, {
        Utility.Create("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Right,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            Padding = UDim.new(0, 8)
        })
    })
    
    -- Minimize Button
    local minimizeBtn = Utility.Create("TextButton", {
        Parent = topBarButtons,
        Name = "Minimize",
        BackgroundColor3 = windowData.Theme.Card,
        Size = UDim2.new(0, 30, 0, 30),
        Font = Enum.Font.GothamBold,
        Text = "-",
        TextColor3 = windowData.Theme.TextMuted,
        TextSize = 18,
        AutoButtonColor = false
    }, {
        Utility.Create("UICorner", {
            CornerRadius = UDim.new(0, 6)
        })
    })
    
    minimizeBtn.MouseEnter:Connect(function()
        Utility.Tween(minimizeBtn, {BackgroundColor3 = windowData.Theme.CardHover}, 0.15)
    end)
    
    minimizeBtn.MouseLeave:Connect(function()
        Utility.Tween(minimizeBtn, {BackgroundColor3 = windowData.Theme.Card}, 0.15)
    end)
    
    minimizeBtn.MouseButton1Click:Connect(function()
        windowData:Minimize()
    end)
    
    -- Close Button
    local closeBtn = Utility.Create("TextButton", {
        Parent = topBarButtons,
        Name = "Close",
        BackgroundColor3 = windowData.Theme.Card,
        Size = UDim2.new(0, 30, 0, 30),
        Font = Enum.Font.GothamBold,
        Text = "×",
        TextColor3 = windowData.Theme.TextMuted,
        TextSize = 20,
        AutoButtonColor = false
    }, {
        Utility.Create("UICorner", {
            CornerRadius = UDim.new(0, 6)
        })
    })
    
    closeBtn.MouseEnter:Connect(function()
        Utility.Tween(closeBtn, {BackgroundColor3 = Color3.fromRGB(200, 50, 50), TextColor3 = Color3.fromRGB(255, 255, 255)}, 0.15)
    end)
    
    closeBtn.MouseLeave:Connect(function()
        Utility.Tween(closeBtn, {BackgroundColor3 = windowData.Theme.Card, TextColor3 = windowData.Theme.TextMuted}, 0.15)
    end)
    
    closeBtn.MouseButton1Click:Connect(function()
        windowData:Destroy()
    end)
    
    -- Sidebar
    local sidebar = Utility.Create("Frame", {
        Parent = mainWindow,
        Name = "Sidebar",
        BackgroundColor3 = windowData.Theme.Sidebar,
        Size = UDim2.new(0, 160, 1, -40),
        Position = UDim2.new(0, 0, 0, 40),
        BorderSizePixel = 0
    })
    
    windowData.Sidebar = sidebar
    
    -- Sidebar Tab Container
    local tabContainer = Utility.Create("ScrollingFrame", {
        Parent = sidebar,
        Name = "TabContainer",
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 1, -20),
        Position = UDim2.new(0, 0, 0, 10),
        ScrollBarThickness = 2,
        ScrollBarImageColor3 = windowData.Theme.Accent,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y
    }, {
        Utility.Create("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 4)
        }),
        Utility.Create("UIPadding", {
            PaddingLeft = UDim.new(0, 10),
            PaddingRight = UDim.new(0, 10),
            PaddingTop = UDim.new(0, 5)
        })
    })
    
    windowData.TabContainer = tabContainer
    
    -- Content Area
    local contentArea = Utility.Create("Frame", {
        Parent = mainWindow,
        Name = "ContentArea",
        BackgroundTransparency = 1,
        Size = UDim2.new(1, -165, 1, -50),
        Position = UDim2.new(0, 165, 0, 45)
    })
    
    windowData.ContentArea = contentArea
    
    -- Page Container (for UIPageLayout)
    local pageContainer = Utility.Create("Frame", {
        Parent = contentArea,
        Name = "PageContainer",
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 1, 0),
        ClipsDescendants = true
    })
    
    local pageLayout = Utility.Create("UIPageLayout", {
        Parent = pageContainer,
        SortOrder = Enum.SortOrder.LayoutOrder,
        EasingDirection = Enum.EasingDirection.Out,
        EasingStyle = Enum.EasingStyle.Quad,
        TweenTime = 0.3,
        Circular = false,
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        Padding = UDim.new(0, 20)
    })
    
    windowData.PageContainer = pageContainer
    windowData.PageLayout = pageLayout
    
    -- Keybind Handler
    UserInputService.InputBegan:Connect(function(input, processed)
        if processed then return end
        if input.KeyCode == windowData.MinimizeKey then
            windowData:Toggle()
        end
    end)
    
    table.insert(VapeV5.Windows, windowData)
    
    return windowData
end

function Window:Minimize()
    if self.Visible then
        self.Visible = false
        Utility.Tween(self.MainWindow, {
            Size = UDim2.new(0, self.Size.X.Offset, 0, 40)
        }, 0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In)
    else
        self.Visible = true
        Utility.Tween(self.MainWindow, {
            Size = self.Size
        }, 0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
    end
end

function Window:Toggle()
    if self.MainWindow.Visible then
        Utility.Tween(self.MainWindow, {
            Size = UDim2.new(0, 0, 0, 0),
            BackgroundTransparency = 1
        }, 0.3)
        task.delay(0.3, function()
            self.MainWindow.Visible = false
        end)
        VapeV5.Blur:Disable()
    else
        self.MainWindow.Visible = true
        self.MainWindow.Size = UDim2.new(0, 0, 0, 0)
        self.MainWindow.BackgroundTransparency = 1
        Utility.Tween(self.MainWindow, {
            Size = self.Size,
            BackgroundTransparency = 0
        }, 0.3, Enum.EasingStyle.Back)
    end
end

function Window:SetTheme(themeName)
    if type(themeName) == "string" and VapeV5.Themes[themeName] then
        self.Theme = VapeV5.Themes[themeName]
    elseif type(themeName) == "table" then
        self.Theme = themeName
    end
    -- Update all UI elements with new theme
    self:UpdateTheme()
end

function Window:UpdateTheme()
    local theme = self.Theme
    
    self.MainWindow.BackgroundColor3 = theme.Background
    self.TopBar.BackgroundColor3 = theme.TopBar
    self.TopBar.BottomCover.BackgroundColor3 = theme.TopBar
    self.Sidebar.BackgroundColor3 = theme.Sidebar
    
    -- Update tabs and components...
    for _, tab in pairs(self.Tabs) do
        tab:UpdateTheme(theme)
    end
end

function Window:Destroy()
    VapeV5.Blur:Destroy()
    if self.ScreenGui then
        self.ScreenGui:Destroy()
    end
end

function Window:Notify(options)
    options.Theme = self.Theme
    return VapeV5.Notifications:Notify(options)
end

-- ═══════════════════════════════════════════════════════════════════
-- TAB CLASS
-- ═══════════════════════════════════════════════════════════════════
local Tab = {}
Tab.__index = Tab

function Window:CreateTab(options)
    options = options or {}
    
    local tabData = {
        Name = options.Name or "Tab",
        Icon = options.Icon or nil,
        Window = self,
        Theme = self.Theme,
        Elements = {},
        Sections = {}
    }
    
    setmetatable(tabData, Tab)
    
    -- Tab Button in Sidebar
    local tabButton = Utility.Create("TextButton", {
        Parent = self.TabContainer,
        Name = "Tab_" .. tabData.Name,
        BackgroundColor3 = self.Theme.Card,
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, 38),
        Font = Enum.Font.GothamMedium,
        Text = "",
        AutoButtonColor = false
    }, {
        Utility.Create("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }),
        Utility.Create("Frame", {
            Name = "Indicator",
            BackgroundColor3 = self.Theme.Accent,
            Size = UDim2.new(0, 3, 0, 20),
            Position = UDim2.new(0, 0, 0.5, 0),
            AnchorPoint = Vector2.new(0, 0.5),
            BackgroundTransparency = 1
        }, {
            Utility.Create("UICorner", {
                CornerRadius = UDim.new(0, 2)
            })
        }),
        Utility.Create("TextLabel", {
            Name = "Label",
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 15, 0, 0),
            Size = UDim2.new(1, -20, 1, 0),
            Font = Enum.Font.GothamMedium,
            Text = tabData.Name,
            TextColor3 = self.Theme.TextMuted,
            TextSize = 13,
            TextXAlignment = Enum.TextXAlignment.Left
        })
    })
    
    tabData.TabButton = tabButton
    
    -- Tab Content Page
    local page = Utility.Create("ScrollingFrame", {
        Parent = self.PageContainer,
        Name = "Page_" .. tabData.Name,
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 1, 0),
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = self.Theme.Accent,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y
    }, {
        Utility.Create("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 8)
        }),
        Utility.Create("UIPadding", {
            PaddingTop = UDim.new(0, 5),
            PaddingBottom = UDim.new(0, 10),
            PaddingLeft = UDim.new(0, 5),
            PaddingRight = UDim.new(0, 10)
        })
    })
    
    tabData.Page = page
    
    -- Tab Button Interactions
    tabButton.MouseEnter:Connect(function()
        if self.CurrentTab ~= tabData then
            Utility.Tween(tabButton, {BackgroundTransparency = 0.5}, 0.15)
        end
    end)
    
    tabButton.MouseLeave:Connect(function()
        if self.CurrentTab ~= tabData then
            Utility.Tween(tabButton, {BackgroundTransparency = 1}, 0.15)
        end
    end)
    
    tabButton.MouseButton1Click:Connect(function()
        tabData:Select()
    end)
    
    table.insert(self.Tabs, tabData)
    
    -- Select first tab automatically
    if #self.Tabs == 1 then
        tabData:Select()
    end
    
    return tabData
end

function Tab:Select()
    local window = self.Window
    
    -- Deselect previous tab
    if window.CurrentTab then
        local prevTab = window.CurrentTab
        Utility.Tween(prevTab.TabButton, {BackgroundTransparency = 1}, 0.15)
        Utility.Tween(prevTab.TabButton.Indicator, {BackgroundTransparency = 1}, 0.15)
        Utility.Tween(prevTab.TabButton.Label, {TextColor3 = self.Theme.TextMuted}, 0.15)
    end
    
    -- Select this tab
    window.CurrentTab = self
    Utility.Tween(self.TabButton, {BackgroundTransparency = 0.8}, 0.15)
    Utility.Tween(self.TabButton.Indicator, {BackgroundTransparency = 0}, 0.15)
    Utility.Tween(self.TabButton.Label, {TextColor3 = self.Theme.Text}, 0.15)
    
    -- Switch page
    window.PageLayout:JumpTo(self.Page)
end

function Tab:UpdateTheme(theme)
    self.Theme = theme
    -- Update all elements with new theme
    for _, element in pairs(self.Elements) do
        if element.UpdateTheme then
            element:UpdateTheme(theme)
        end
    end
end

-- ═══════════════════════════════════════════════════════════════════
-- SECTION
-- ═══════════════════════════════════════════════════════════════════
function Tab:CreateSection(name)
    local section = Utility.Create("Frame", {
        Parent = self.Page,
        Name = "Section_" .. (name or "Section"),
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, 25)
    }, {
        Utility.Create("TextLabel", {
            Name = "Title",
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, 20),
            Font = Enum.Font.GothamBold,
            Text = name or "Section",
            TextColor3 = self.Theme.Accent,
            TextSize = 12,
            TextXAlignment = Enum.TextXAlignment.Left
        }),
        Utility.Create("Frame", {
            Name = "Line",
            BackgroundColor3 = self.Theme.Border,
            Size = UDim2.new(1, 0, 0, 1),
            Position = UDim2.new(0, 0, 1, -3)
        })
    })
    
    table.insert(self.Sections, section)
    return section
end

-- ═══════════════════════════════════════════════════════════════════
-- BUTTON
-- ═══════════════════════════════════════════════════════════════════
function Tab:CreateButton(options)
    options = options or {}
    
    local buttonData = {
        Name = options.Name or "Button",
        Callback = options.Callback or function() end,
        Theme = self.Theme
    }
    
    local button = Utility.Create("TextButton", {
        Parent = self.Page,
        Name = "Button_" .. buttonData.Name,
        BackgroundColor3 = self.Theme.Card,
        Size = UDim2.new(1, 0, 0, 36),
        Font = Enum.Font.GothamMedium,
        Text = "",
        AutoButtonColor = false,
        ClipsDescendants = true
    }, {
        Utility.Create("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }),
        Utility.Create("UIStroke", {
            Color = self.Theme.Border,
            Transparency = 0.5
        }),
        Utility.Create("TextLabel", {
            Name = "Label",
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 12, 0, 0),
            Size = UDim2.new(1, -24, 1, 0),
            Font = Enum.Font.GothamMedium,
            Text = buttonData.Name,
            TextColor3 = self.Theme.Text,
            TextSize = 13,
            TextXAlignment = Enum.TextXAlignment.Left
        }),
        Utility.Create("TextLabel", {
            Name = "Icon",
            BackgroundTransparency = 1,
            Position = UDim2.new(1, -30, 0, 0),
            Size = UDim2.new(0, 20, 1, 0),
            Font = Enum.Font.GothamBold,
            Text = "→",
            TextColor3 = self.Theme.TextMuted,
            TextSize = 14
        })
    })
    
    buttonData.Button = button
    
    button.MouseEnter:Connect(function()
        Utility.Tween(button, {BackgroundColor3 = self.Theme.CardHover}, 0.15)
    end)
    
    button.MouseLeave:Connect(function()
        Utility.Tween(button, {BackgroundColor3 = self.Theme.Card}, 0.15)
    end)
    
    button.MouseButton1Click:Connect(function()
        Utility.Ripple(button, Mouse.X, Mouse.Y, self.Theme.Accent)
        buttonData.Callback()
    end)
    
    table.insert(self.Elements, buttonData)
    return buttonData
end

-- ═══════════════════════════════════════════════════════════════════
-- TOGGLE
-- ═══════════════════════════════════════════════════════════════════
function Tab:CreateToggle(options)
    options = options or {}
    
    local toggleData = {
        Name = options.Name or "Toggle",
        Flag = options.Flag or options.Name or "Toggle",
        Default = options.Default or false,
        Callback = options.Callback or function() end,
        Theme = self.Theme,
        Value = options.Default or false
    }
    
    -- Register flag
    VapeV5.Flags[toggleData.Flag] = toggleData.Value
    
    local toggle = Utility.Create("TextButton", {
        Parent = self.Page,
        Name = "Toggle_" .. toggleData.Name,
        BackgroundColor3 = self.Theme.Card,
        Size = UDim2.new(1, 0, 0, 36),
        Font = Enum.Font.GothamMedium,
        Text = "",
        AutoButtonColor = false
    }, {
        Utility.Create("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }),
        Utility.Create("UIStroke", {
            Color = self.Theme.Border,
            Transparency = 0.5
        }),
        Utility.Create("TextLabel", {
            Name = "Label",
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 12, 0, 0),
            Size = UDim2.new(1, -60, 1, 0),
            Font = Enum.Font.GothamMedium,
            Text = toggleData.Name,
            TextColor3 = self.Theme.Text,
            TextSize = 13,
            TextXAlignment = Enum.TextXAlignment.Left
        }),
        Utility.Create("Frame", {
            Name = "Switch",
            BackgroundColor3 = self.Theme.Toggle,
            Position = UDim2.new(1, -50, 0.5, 0),
            Size = UDim2.new(0, 38, 0, 20),
            AnchorPoint = Vector2.new(0, 0.5)
        }, {
            Utility.Create("UICorner", {
                CornerRadius = UDim.new(1, 0)
            }),
            Utility.Create("Frame", {
                Name = "Indicator",
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                Position = UDim2.new(0, 3, 0.5, 0),
                Size = UDim2.new(0, 14, 0, 14),
                AnchorPoint = Vector2.new(0, 0.5)
            }, {
                Utility.Create("UICorner", {
                    CornerRadius = UDim.new(1, 0)
                })
            })
        })
    })
    
    toggleData.Toggle = toggle
    toggleData.Switch = toggle.Switch
    toggleData.Indicator = toggle.Switch.Indicator
    
    function toggleData:Set(value)
        self.Value = value
        VapeV5.Flags[self.Flag] = value
        
        if value then
            Utility.Tween(self.Switch, {BackgroundColor3 = self.Theme.ToggleEnabled}, 0.2)
            Utility.Tween(self.Indicator, {Position = UDim2.new(1, -17, 0.5, 0)}, 0.2)
        else
            Utility.Tween(self.Switch, {BackgroundColor3 = self.Theme.Toggle}, 0.2)
            Utility.Tween(self.Indicator, {Position = UDim2.new(0, 3, 0.5, 0)}, 0.2)
        end
        
        self.Callback(value)
    end
    
    toggle.MouseEnter:Connect(function()
        Utility.Tween(toggle, {BackgroundColor3 = self.Theme.CardHover}, 0.15)
    end)
    
    toggle.MouseLeave:Connect(function()
        Utility.Tween(toggle, {BackgroundColor3 = self.Theme.Card}, 0.15)
    end)
    
    toggle.MouseButton1Click:Connect(function()
        toggleData:Set(not toggleData.Value)
    end)
    
    -- Set initial state
    if toggleData.Default then
        toggleData:Set(true)
    end
    
    table.insert(self.Elements, toggleData)
    return toggleData
end

-- ═══════════════════════════════════════════════════════════════════
-- SLIDER
-- ═══════════════════════════════════════════════════════════════════
function Tab:CreateSlider(options)
    options = options or {}
    
    local sliderData = {
        Name = options.Name or "Slider",
        Flag = options.Flag or options.Name or "Slider",
        Min = options.Min or 0,
        Max = options.Max or 100,
        Default = options.Default or options.Min or 0,
        Increment = options.Increment or 1,
        Suffix = options.Suffix or "",
        Callback = options.Callback or function() end,
        Theme = self.Theme,
        Value = options.Default or options.Min or 0
    }
    
    VapeV5.Flags[sliderData.Flag] = sliderData.Value
    
    local slider = Utility.Create("Frame", {
        Parent = self.Page,
        Name = "Slider_" .. sliderData.Name,
        BackgroundColor3 = self.Theme.Card,
        Size = UDim2.new(1, 0, 0, 50)
    }, {
        Utility.Create("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }),
        Utility.Create("UIStroke", {
            Color = self.Theme.Border,
            Transparency = 0.5
        }),
        Utility.Create("TextLabel", {
            Name = "Label",
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 12, 0, 0),
            Size = UDim2.new(0.5, 0, 0, 25),
            Font = Enum.Font.GothamMedium,
            Text = sliderData.Name,
            TextColor3 = self.Theme.Text,
            TextSize = 13,
            TextXAlignment = Enum.TextXAlignment.Left
        }),
        Utility.Create("TextLabel", {
            Name = "Value",
            BackgroundTransparency = 1,
            Position = UDim2.new(0.5, 0, 0, 0),
            Size = UDim2.new(0.5, -12, 0, 25),
            Font = Enum.Font.GothamMedium,
            Text = tostring(sliderData.Value) .. sliderData.Suffix,
            TextColor3 = self.Theme.Accent,
            TextSize = 13,
            TextXAlignment = Enum.TextXAlignment.Right
        }),
        Utility.Create("Frame", {
            Name = "SliderBar",
            BackgroundColor3 = self.Theme.Slider,
            Position = UDim2.new(0, 12, 0, 32),
            Size = UDim2.new(1, -24, 0, 8)
        }, {
            Utility.Create("UICorner", {
                CornerRadius = UDim.new(1, 0)
            }),
            Utility.Create("Frame", {
                Name = "Fill",
                BackgroundColor3 = self.Theme.SliderFill,
                Size = UDim2.new(0, 0, 1, 0)
            }, {
                Utility.Create("UICorner", {
                    CornerRadius = UDim.new(1, 0)
                })
            }),
            Utility.Create("Frame", {
                Name = "Knob",
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                Position = UDim2.new(0, 0, 0.5, 0),
                Size = UDim2.new(0, 16, 0, 16),
                AnchorPoint = Vector2.new(0.5, 0.5)
            }, {
                Utility.Create("UICorner", {
                    CornerRadius = UDim.new(1, 0)
                })
            })
        })
    })
    
    sliderData.Slider = slider
    sliderData.SliderBar = slider.SliderBar
    sliderData.Fill = slider.SliderBar.Fill
    sliderData.Knob = slider.SliderBar.Knob
    sliderData.ValueLabel = slider.Value
    
    function sliderData:Set(value)
        value = math.clamp(value, self.Min, self.Max)
        value = math.floor(value / self.Increment + 0.5) * self.Increment
        self.Value = value
        VapeV5.Flags[self.Flag] = value
        
        local percent = (value - self.Min) / (self.Max - self.Min)
        
        Utility.Tween(self.Fill, {Size = UDim2.new(percent, 0, 1, 0)}, 0.1)
        Utility.Tween(self.Knob, {Position = UDim2.new(percent, 0, 0.5, 0)}, 0.1)
        self.ValueLabel.Text = tostring(value) .. self.Suffix
        
        self.Callback(value)
    end
    
    -- Slider interaction
    local dragging = false
    
    local function updateSlider(input)
        local sliderBar = sliderData.SliderBar
        local percent = math.clamp((input.Position.X - sliderBar.AbsolutePosition.X) / sliderBar.AbsoluteSize.X, 0, 1)
        local value = sliderData.Min + (sliderData.Max - sliderData.Min) * percent
        sliderData:Set(value)
    end
    
    sliderData.SliderBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            updateSlider(input)
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            updateSlider(input)
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
    
    -- Set initial value
    sliderData:Set(sliderData.Default)
    
    table.insert(self.Elements, sliderData)
    return sliderData
end

-- ═══════════════════════════════════════════════════════════════════
-- DROPDOWN
-- ═══════════════════════════════════════════════════════════════════
function Tab:CreateDropdown(options)
    options = options or {}
    
    local dropdownData = {
        Name = options.Name or "Dropdown",
        Flag = options.Flag or options.Name or "Dropdown",
        Options = options.Options or {},
        Default = options.Default or nil,
        MultiSelect = options.MultiSelect or false,
        Callback = options.Callback or function() end,
        Theme = self.Theme,
        Value = options.MultiSelect and {} or nil,
        Open = false
    }
    
    local dropdown = Utility.Create("Frame", {
        Parent = self.Page,
        Name = "Dropdown_" .. dropdownData.Name,
        BackgroundColor3 = self.Theme.Card,
        Size = UDim2.new(1, 0, 0, 36),
        ClipsDescendants = true
    }, {
        Utility.Create("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }),
        Utility.Create("UIStroke", {
            Color = self.Theme.Border,
            Transparency = 0.5
        }),
        Utility.Create("TextButton", {
            Name = "Header",
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, 36),
            Font = Enum.Font.GothamMedium,
            Text = "",
            AutoButtonColor = false
        }, {
            Utility.Create("TextLabel", {
                Name = "Label",
                BackgroundTransparency = 1,
                Position = UDim2.new(0, 12, 0, 0),
                Size = UDim2.new(0.5, 0, 1, 0),
                Font = Enum.Font.GothamMedium,
                Text = dropdownData.Name,
                TextColor3 = self.Theme.Text,
                TextSize = 13,
                TextXAlignment = Enum.TextXAlignment.Left
            }),
            Utility.Create("TextLabel", {
                Name = "Selected",
                BackgroundTransparency = 1,
                Position = UDim2.new(0.3, 0, 0, 0),
                Size = UDim2.new(0.65, -30, 1, 0),
                Font = Enum.Font.Gotham,
                Text = "Select...",
                TextColor3 = self.Theme.TextMuted,
                TextSize = 12,
                TextXAlignment = Enum.TextXAlignment.Right,
                TextTruncate = Enum.TextTruncate.AtEnd
            }),
            Utility.Create("TextLabel", {
                Name = "Arrow",
                BackgroundTransparency = 1,
                Position = UDim2.new(1, -30, 0, 0),
                Size = UDim2.new(0, 20, 1, 0),
                Font = Enum.Font.GothamBold,
                Text = "▼",
                TextColor3 = self.Theme.TextMuted,
                TextSize = 10
            })
        }),
        Utility.Create("Frame", {
            Name = "OptionsContainer",
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 0, 0, 40),
            Size = UDim2.new(1, 0, 0, 0),
            ClipsDescendants = true
        }, {
            Utility.Create("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 2)
            }),
            Utility.Create("UIPadding", {
                PaddingLeft = UDim.new(0, 8),
                PaddingRight = UDim.new(0, 8)
            })
        })
    })
    
    dropdownData.Dropdown = dropdown
    dropdownData.Header = dropdown.Header
    dropdownData.Arrow = dropdown.Header.Arrow
    dropdownData.Selected = dropdown.Header.Selected
    dropdownData.OptionsContainer = dropdown.OptionsContainer
    
    function dropdownData:Toggle()
        self.Open = not self.Open
        
        if self.Open then
            local optionCount = #self.Options
            local height = 36 + 4 + (optionCount * 30) + ((optionCount - 1) * 2)
            Utility.Tween(dropdown, {Size = UDim2.new(1, 0, 0, height)}, 0.2)
            Utility.Tween(self.OptionsContainer, {Size = UDim2.new(1, 0, 0, (optionCount * 30) + ((optionCount - 1) * 2))}, 0.2)
            Utility.Tween(self.Arrow, {Rotation = 180}, 0.2)
        else
            Utility.Tween(dropdown, {Size = UDim2.new(1, 0, 0, 36)}, 0.2)
            Utility.Tween(self.OptionsContainer, {Size = UDim2.new(1, 0, 0, 0)}, 0.2)
            Utility.Tween(self.Arrow, {Rotation = 0}, 0.2)
        end
    end
    
    function dropdownData:Set(value)
        if self.MultiSelect then
            if type(value) == "table" then
                self.Value = value
            else
                if table.find(self.Value, value) then
                    table.remove(self.Value, table.find(self.Value, value))
                else
                    table.insert(self.Value, value)
                end
            end
            self.Selected.Text = #self.Value > 0 and table.concat(self.Value, ", ") or "Select..."
            VapeV5.Flags[self.Flag] = self.Value
            self.Callback(self.Value)
        else
            self.Value = value
            self.Selected.Text = value or "Select..."
            VapeV5.Flags[self.Flag] = value
            self.Callback(value)
            self:Toggle()
        end
        
        -- Update option visuals
        for _, optionBtn in pairs(self.OptionsContainer:GetChildren()) do
            if optionBtn:IsA("TextButton") then
                local isSelected = self.MultiSelect and table.find(self.Value, optionBtn.Name) or self.Value == optionBtn.Name
                Utility.Tween(optionBtn, {BackgroundColor3 = isSelected and self.Theme.Accent or self.Theme.Dropdown}, 0.15)
                Utility.Tween(optionBtn, {TextColor3 = isSelected and Color3.fromRGB(0, 0, 0) or self.Theme.Text}, 0.15)
            end
        end
    end
    
    function dropdownData:Refresh(newOptions)
        self.Options = newOptions
        
        -- Clear old options
        for _, child in pairs(self.OptionsContainer:GetChildren()) do
            if child:IsA("TextButton") then
                child:Destroy()
            end
        end
        
        -- Create new options
        for _, option in ipairs(self.Options) do
            local optionBtn = Utility.Create("TextButton", {
                Parent = self.OptionsContainer,
                Name = option,
                BackgroundColor3 = self.Theme.Dropdown,
                Size = UDim2.new(1, 0, 0, 28),
                Font = Enum.Font.Gotham,
                Text = option,
                TextColor3 = self.Theme.Text,
                TextSize = 12,
                AutoButtonColor = false
            }, {
                Utility.Create("UICorner", {
                    CornerRadius = UDim.new(0, 6)
                })
            })
            
            optionBtn.MouseEnter:Connect(function()
                if not (self.MultiSelect and table.find(self.Value, option) or self.Value == option) then
                    Utility.Tween(optionBtn, {BackgroundColor3 = self.Theme.CardHover}, 0.15)
                end
            end)
            
            optionBtn.MouseLeave:Connect(function()
                local isSelected = self.MultiSelect and table.find(self.Value, option) or self.Value == option
                Utility.Tween(optionBtn, {BackgroundColor3 = isSelected and self.Theme.Accent or self.Theme.Dropdown}, 0.15)
            end)
            
            optionBtn.MouseButton1Click:Connect(function()
                self:Set(option)
            end)
        end
    end
    
    -- Header click
    dropdownData.Header.MouseButton1Click:Connect(function()
        dropdownData:Toggle()
    end)
    
    -- Initialize options
    dropdownData:Refresh(dropdownData.Options)
    
    -- Set default
    if dropdownData.Default then
        if dropdownData.MultiSelect and type(dropdownData.Default) == "table" then
            for _, v in ipairs(dropdownData.Default) do
                dropdownData:Set(v)
            end
        else
            dropdownData:Set(dropdownData.Default)
        end
    end
    
    table.insert(self.Elements, dropdownData)
    return dropdownData
end

-- ═══════════════════════════════════════════════════════════════════
-- TEXTBOX / INPUT
-- ═══════════════════════════════════════════════════════════════════
function Tab:CreateInput(options)
    options = options or {}
    
    local inputData = {
        Name = options.Name or "Input",
        Flag = options.Flag or options.Name or "Input",
        Placeholder = options.Placeholder or "Enter text...",
        Default = options.Default or "",
        Numeric = options.Numeric or false,
        ClearOnFocus = options.ClearOnFocus or false,
        Callback = options.Callback or function() end,
        Theme = self.Theme,
        Value = options.Default or ""
    }
    
    VapeV5.Flags[inputData.Flag] = inputData.Value
    
    local input = Utility.Create("Frame", {
        Parent = self.Page,
        Name = "Input_" .. inputData.Name,
        BackgroundColor3 = self.Theme.Card,
        Size = UDim2.new(1, 0, 0, 36)
    }, {
        Utility.Create("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }),
        Utility.Create("UIStroke", {
            Color = self.Theme.Border,
            Transparency = 0.5
        }),
        Utility.Create("TextLabel", {
            Name = "Label",
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 12, 0, 0),
            Size = UDim2.new(0.4, 0, 1, 0),
            Font = Enum.Font.GothamMedium,
            Text = inputData.Name,
            TextColor3 = self.Theme.Text,
            TextSize = 13,
            TextXAlignment = Enum.TextXAlignment.Left
        }),
        Utility.Create("Frame", {
            Name = "InputBox",
            BackgroundColor3 = self.Theme.Input,
            Position = UDim2.new(0.4, 5, 0.5, 0),
            Size = UDim2.new(0.6, -17, 0, 26),
            AnchorPoint = Vector2.new(0, 0.5)
        }, {
            Utility.Create("UICorner", {
                CornerRadius = UDim.new(0, 6)
            }),
            Utility.Create("TextBox", {
                Name = "TextBox",
                BackgroundTransparency = 1,
                Position = UDim2.new(0, 8, 0, 0),
                Size = UDim2.new(1, -16, 1, 0),
                Font = Enum.Font.Gotham,
                Text = inputData.Default,
                PlaceholderText = inputData.Placeholder,
                PlaceholderColor3 = self.Theme.TextDark,
                TextColor3 = self.Theme.Text,
                TextSize = 12,
                ClearTextOnFocus = inputData.ClearOnFocus
            })
        })
    })
    
    inputData.Input = input
    inputData.TextBox = input.InputBox.TextBox
    
    function inputData:Set(value)
        self.Value = tostring(value)
        self.TextBox.Text = self.Value
        VapeV5.Flags[self.Flag] = self.Value
        self.Callback(self.Value)
    end
    
    inputData.TextBox.FocusLost:Connect(function(enterPressed)
        local text = inputData.TextBox.Text
        
        if inputData.Numeric then
            text = tonumber(text) and text or inputData.Value
            inputData.TextBox.Text = text
        end
        
        inputData.Value = text
        VapeV5.Flags[inputData.Flag] = text
        inputData.Callback(text, enterPressed)
    end)
    
    table.insert(self.Elements, inputData)
    return inputData
end

-- ═══════════════════════════════════════════════════════════════════
-- KEYBIND
-- ═══════════════════════════════════════════════════════════════════
function Tab:CreateKeybind(options)
    options = options or {}
    
    local keybindData = {
        Name = options.Name or "Keybind",
        Flag = options.Flag or options.Name or "Keybind",
        Default = options.Default or Enum.KeyCode.Unknown,
        Callback = options.Callback or function() end,
        ChangedCallback = options.ChangedCallback or function() end,
        Theme = self.Theme,
        Value = options.Default or Enum.KeyCode.Unknown,
        Binding = false
    }
    
    VapeV5.Flags[keybindData.Flag] = keybindData.Value
    
    local keybind = Utility.Create("Frame", {
        Parent = self.Page,
        Name = "Keybind_" .. keybindData.Name,
        BackgroundColor3 = self.Theme.Card,
        Size = UDim2.new(1, 0, 0, 36)
    }, {
        Utility.Create("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }),
        Utility.Create("UIStroke", {
            Color = self.Theme.Border,
            Transparency = 0.5
        }),
        Utility.Create("TextLabel", {
            Name = "Label",
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 12, 0, 0),
            Size = UDim2.new(0.6, 0, 1, 0),
            Font = Enum.Font.GothamMedium,
            Text = keybindData.Name,
            TextColor3 = self.Theme.Text,
            TextSize = 13,
            TextXAlignment = Enum.TextXAlignment.Left
        }),
        Utility.Create("TextButton", {
            Name = "KeyButton",
            BackgroundColor3 = self.Theme.Input,
            Position = UDim2.new(1, -90, 0.5, 0),
            Size = UDim2.new(0, 78, 0, 26),
            AnchorPoint = Vector2.new(0, 0.5),
            Font = Enum.Font.GothamMedium,
            Text = keybindData.Default ~= Enum.KeyCode.Unknown and keybindData.Default.Name or "None",
            TextColor3 = self.Theme.TextMuted,
            TextSize = 11,
            AutoButtonColor = false
        }, {
            Utility.Create("UICorner", {
                CornerRadius = UDim.new(0, 6)
            })
        })
    })
    
    keybindData.Keybind = keybind
    keybindData.KeyButton = keybind.KeyButton
    
    local shortNames = {
        RightControl = "RCtrl",
        LeftControl = "LCtrl",
        RightShift = "RShift",
        LeftShift = "LShift",
        RightAlt = "RAlt",
        LeftAlt = "LAlt",
        Unknown = "None"
    }
    
    function keybindData:Set(keyCode)
        self.Value = keyCode
        VapeV5.Flags[self.Flag] = keyCode
        self.KeyButton.Text = shortNames[keyCode.Name] or keyCode.Name
        self.ChangedCallback(keyCode)
    end
    
    keybindData.KeyButton.MouseButton1Click:Connect(function()
        if keybindData.Binding then return end
        keybindData.Binding = true
        keybindData.KeyButton.Text = "..."
        
        local connection
        connection = UserInputService.InputBegan:Connect(function(input, processed)
            if input.UserInputType == Enum.UserInputType.Keyboard then
                keybindData:Set(input.KeyCode)
                keybindData.Binding = false
                connection:Disconnect()
            elseif input.UserInputType == Enum.UserInputType.MouseButton1 and not processed then
                task.wait()
                if keybindData.Binding then
                    keybindData:Set(Enum.KeyCode.Unknown)
                    keybindData.Binding = false
                    connection:Disconnect()
                end
            end
        end)
    end)
    
    -- Listen for keybind press
    UserInputService.InputBegan:Connect(function(input, processed)
        if processed then return end
        if input.KeyCode == keybindData.Value and keybindData.Value ~= Enum.KeyCode.Unknown then
            keybindData.Callback(keybindData.Value)
        end
    end)
    
    table.insert(self.Elements, keybindData)
    return keybindData
end

-- ═══════════════════════════════════════════════════════════════════
-- LABEL
-- ═══════════════════════════════════════════════════════════════════
function Tab:CreateLabel(text)
    local label = Utility.Create("TextLabel", {
        Parent = self.Page,
        Name = "Label",
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, 20),
        Font = Enum.Font.Gotham,
        Text = text or "Label",
        TextColor3 = self.Theme.TextMuted,
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Left
    })
    
    local labelData = {
        Label = label,
        Set = function(self, newText)
            label.Text = newText
        end
    }
    
    table.insert(self.Elements, labelData)
    return labelData
end

-- ═══════════════════════════════════════════════════════════════════
-- PARAGRAPH
-- ═══════════════════════════════════════════════════════════════════
function Tab:CreateParagraph(options)
    options = options or {}
    
    local paragraph = Utility.Create("Frame", {
        Parent = self.Page,
        Name = "Paragraph",
        BackgroundColor3 = self.Theme.Card,
        Size = UDim2.new(1, 0, 0, 60),
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        Utility.Create("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }),
        Utility.Create("UIStroke", {
            Color = self.Theme.Border,
            Transparency = 0.5
        }),
        Utility.Create("UIPadding", {
            PaddingTop = UDim.new(0, 10),
            PaddingBottom = UDim.new(0, 10),
            PaddingLeft = UDim.new(0, 12),
            PaddingRight = UDim.new(0, 12)
        }),
        Utility.Create("TextLabel", {
            Name = "Title",
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, 20),
            Font = Enum.Font.GothamBold,
            Text = options.Title or "Title",
            TextColor3 = self.Theme.Text,
            TextSize = 14,
            TextXAlignment = Enum.TextXAlignment.Left
        }),
        Utility.Create("TextLabel", {
            Name = "Content",
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 0, 0, 22),
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            Font = Enum.Font.Gotham,
            Text = options.Content or "Content",
            TextColor3 = self.Theme.TextMuted,
            TextSize = 12,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextWrapped = true
        })
    })
    
    local paragraphData = {
        Paragraph = paragraph,
        Title = paragraph.Title,
        Content = paragraph.Content,
        Set = function(self, title, content)
            if title then self.Title.Text = title end
            if content then self.Content.Text = content end
        end
    }
    
    table.insert(self.Elements, paragraphData)
    return paragraphData
end

-- ═══════════════════════════════════════════════════════════════════
-- COLOR PICKER
-- ═══════════════════════════════════════════════════════════════════
function Tab:CreateColorPicker(options)
    options = options or {}
    
    local colorPickerData = {
        Name = options.Name or "Color Picker",
        Flag = options.Flag or options.Name or "ColorPicker",
        Default = options.Default or Color3.fromRGB(255, 255, 255),
        Callback = options.Callback or function() end,
        Theme = self.Theme,
        Value = options.Default or Color3.fromRGB(255, 255, 255),
        Open = false,
        Hue = 0,
        Saturation = 1,
        Brightness = 1
    }
    
    VapeV5.Flags[colorPickerData.Flag] = colorPickerData.Value
    
    -- Convert default color to HSV
    local h, s, v = colorPickerData.Default:ToHSV()
    colorPickerData.Hue = h
    colorPickerData.Saturation = s
    colorPickerData.Brightness = v
    
    local colorPicker = Utility.Create("Frame", {
        Parent = self.Page,
        Name = "ColorPicker_" .. colorPickerData.Name,
        BackgroundColor3 = self.Theme.Card,
        Size = UDim2.new(1, 0, 0, 36),
        ClipsDescendants = true
    }, {
        Utility.Create("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }),
        Utility.Create("UIStroke", {
            Color = self.Theme.Border,
            Transparency = 0.5
        }),
        Utility.Create("TextButton", {
            Name = "Header",
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, 36),
            Font = Enum.Font.GothamMedium,
            Text = "",
            AutoButtonColor = false
        }, {
            Utility.Create("TextLabel", {
                Name = "Label",
                BackgroundTransparency = 1,
                Position = UDim2.new(0, 12, 0, 0),
                Size = UDim2.new(0.7, 0, 1, 0),
                Font = Enum.Font.GothamMedium,
                Text = colorPickerData.Name,
                TextColor3 = self.Theme.Text,
                TextSize = 13,
                TextXAlignment = Enum.TextXAlignment.Left
            }),
            Utility.Create("Frame", {
                Name = "Preview",
                BackgroundColor3 = colorPickerData.Default,
                Position = UDim2.new(1, -50, 0.5, 0),
                Size = UDim2.new(0, 38, 0, 20),
                AnchorPoint = Vector2.new(0, 0.5)
            }, {
                Utility.Create("UICorner", {
                    CornerRadius = UDim.new(0, 4)
                })
            })
        }),
        Utility.Create("Frame", {
            Name = "PickerContainer",
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 0, 0, 40),
            Size = UDim2.new(1, 0, 0, 0),
            ClipsDescendants = true
        }, {
            Utility.Create("UIPadding", {
                PaddingLeft = UDim.new(0, 10),
                PaddingRight = UDim.new(0, 10)
            }),
            Utility.Create("ImageLabel", {
                Name = "Saturation",
                BackgroundColor3 = Color3.fromHSV(colorPickerData.Hue, 1, 1),
                Position = UDim2.new(0, 0, 0, 5),
                Size = UDim2.new(1, -30, 0, 100),
                Image = "rbxassetid://4155801252"
            }, {
                Utility.Create("UICorner", {
                    CornerRadius = UDim.new(0, 4)
                }),
                Utility.Create("Frame", {
                    Name = "Cursor",
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    Size = UDim2.new(0, 10, 0, 10),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.new(1, 0, 0, 0)
                }, {
                    Utility.Create("UICorner", {
                        CornerRadius = UDim.new(1, 0)
                    }),
                    Utility.Create("UIStroke", {
                        Color = Color3.fromRGB(0, 0, 0),
                        Thickness = 1
                    })
                })
            }),
            Utility.Create("ImageLabel", {
                Name = "Hue",
                BackgroundTransparency = 1,
                Position = UDim2.new(1, -18, 0, 5),
                Size = UDim2.new(0, 18, 0, 100),
                Image = "rbxassetid://3641079629"
            }, {
                Utility.Create("UICorner", {
                    CornerRadius = UDim.new(0, 4)
                }),
                Utility.Create("Frame", {
                    Name = "Cursor",
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    Size = UDim2.new(1, 4, 0, 4),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.new(0.5, 0, 0, 0)
                }, {
                    Utility.Create("UICorner", {
                        CornerRadius = UDim.new(0, 2)
                    }),
                    Utility.Create("UIStroke", {
                        Color = Color3.fromRGB(0, 0, 0),
                        Thickness = 1
                    })
                })
            })
        })
    })
    
    colorPickerData.ColorPicker = colorPicker
    colorPickerData.Header = colorPicker.Header
    colorPickerData.Preview = colorPicker.Header.Preview
    colorPickerData.PickerContainer = colorPicker.PickerContainer
    colorPickerData.SaturationFrame = colorPicker.PickerContainer.Saturation
    colorPickerData.HueFrame = colorPicker.PickerContainer.Hue
    colorPickerData.SaturationCursor = colorPicker.PickerContainer.Saturation.Cursor
    colorPickerData.HueCursor = colorPicker.PickerContainer.Hue.Cursor
    
    function colorPickerData:UpdateColor()
        self.Value = Color3.fromHSV(self.Hue, self.Saturation, self.Brightness)
        VapeV5.Flags[self.Flag] = self.Value
        self.Preview.BackgroundColor3 = self.Value
        self.SaturationFrame.BackgroundColor3 = Color3.fromHSV(self.Hue, 1, 1)
        self.Callback(self.Value)
    end
    
    function colorPickerData:Set(color)
        local h, s, v = color:ToHSV()
        self.Hue = h
        self.Saturation = s
        self.Brightness = v
        
        self.SaturationCursor.Position = UDim2.new(s, 0, 1 - v, 0)
        self.HueCursor.Position = UDim2.new(0.5, 0, h, 0)
        
        self:UpdateColor()
    end
    
    function colorPickerData:Toggle()
        self.Open = not self.Open
        
        if self.Open then
            Utility.Tween(colorPicker, {Size = UDim2.new(1, 0, 0, 155)}, 0.2)
            Utility.Tween(self.PickerContainer, {Size = UDim2.new(1, 0, 0, 115)}, 0.2)
        else
            Utility.Tween(colorPicker, {Size = UDim2.new(1, 0, 0, 36)}, 0.2)
            Utility.Tween(self.PickerContainer, {Size = UDim2.new(1, 0, 0, 0)}, 0.2)
        end
    end
    
    -- Header click
    colorPickerData.Header.MouseButton1Click:Connect(function()
        colorPickerData:Toggle()
    end)
    
    -- Saturation picker
    local satDragging = false
    colorPickerData.SaturationFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            satDragging = true
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            satDragging = false
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if satDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local frame = colorPickerData.SaturationFrame
            local x = math.clamp((input.Position.X - frame.AbsolutePosition.X) / frame.AbsoluteSize.X, 0, 1)
            local y = math.clamp((input.Position.Y - frame.AbsolutePosition.Y) / frame.AbsoluteSize.Y, 0, 1)
            
            colorPickerData.Saturation = x
            colorPickerData.Brightness = 1 - y
            colorPickerData.SaturationCursor.Position = UDim2.new(x, 0, y, 0)
            colorPickerData:UpdateColor()
        end
    end)
    
    -- Hue picker
    local hueDragging = false
    colorPickerData.HueFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            hueDragging = true
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            hueDragging = false
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if hueDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local frame = colorPickerData.HueFrame
            local y = math.clamp((input.Position.Y - frame.AbsolutePosition.Y) / frame.AbsoluteSize.Y, 0, 1)
            
            colorPickerData.Hue = y
            colorPickerData.HueCursor.Position = UDim2.new(0.5, 0, y, 0)
            colorPickerData:UpdateColor()
        end
    end)
    
    -- Set initial position of cursors
    colorPickerData.SaturationCursor.Position = UDim2.new(colorPickerData.Saturation, 0, 1 - colorPickerData.Brightness, 0)
    colorPickerData.HueCursor.Position = UDim2.new(0.5, 0, colorPickerData.Hue, 0)
    
    table.insert(self.Elements, colorPickerData)
    return colorPickerData
end

-- ═══════════════════════════════════════════════════════════════════
-- RETURN LIBRARY
-- ═══════════════════════════════════════════════════════════════════
return VapeV5