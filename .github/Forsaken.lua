local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Paplo Hub (Beta)",
   Icon = "venetian-mask", -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Rayfield Interface Suite",
   LoadingSubtitle = "by Sirius",
   Theme = "DarkBlue", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Paplo Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Paplo Keysystem",
      Subtitle = "Real paplo🤯",
      Note = "Join discord for key", -- Use this to tell the user how to get a key
      FileName = "PaploKey", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"ExperimentalSkins"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local Tab = Window:CreateTab("Skins", "drama") -- Title, Image

local Section = Tab:CreateSection("Pick your skin👅")

local Button = Tab:CreateButton({
   Name = "Femboy Elliot (test)",
   Callback = function()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Function to check if the character is Elliot
local function checkFemboyElliot()
    local characterName = player.Character.Name
    if characterName ~= "Elliot" then
        showMessage("Oops, your current character isn't Elliot. This script may not work correctly!", UDim2.new(0.3, 0, 0.5, 0))
        return false
    end
    return true
      end

-- Function to replace mesh and texture of the torso    
local function replaceTorsoMeshAndTexture()
    local torso = character:FindFirstChild("Torso")
    if torso then
        local mesh = torso:FindFirstChildOfClass("SpecialMesh")
        if mesh then
            mesh.MeshId = "rbxassetid://48112070"
            mesh.TextureId = "rbxassetid://1258225294"
            mesh.Scale = Vector3.new(1, 1, 1) -- keeping the original size
        end
    end
      end

local function replaceHeadMeshAndTexture()
    local head = character:FindFirstChild("Head")
    if head then
        local mesh = head:FindFirstChildOfClass("SpecialMesh")
        if mesh then
            mesh.MeshId = "rbxassetid://92027633499623"
            mesh.TextureId = "rbxassetid://105362884988168"
            mesh.Scale = Vector3.new(1, 1, 1) -- keeping the original size
        end
    end
      end

-- Function to apply the correct body color to body parts
local function applyBodyColors()
    local head = character:FindFirstChild("Head")
    local leftArm = character:FindFirstChild("Left Arm")
    local rightArm = character:FindFirstChild("Right Arm")
    local leftLeg = character:FindFirstChild("Left Leg")
    local rightLeg = character:FindFirstChild("Right Leg")
    local torso = character:FindFirstChild("Torso")
 
    if leftLeg then
        leftLeg.Color = Color3.fromRGB(0, 0, 0) -- Dark
    end
    if rightLeg then
        rightLeg.Color = Color3.fromRGB(0, 0, 0) -- Dark
    enD
      end

-- Function to  customize the character to Elliot (femboy)
local function reskinFemboyElliot()
    if not checkFemboyElliot() then return end -- check the character before continuing
 
    character = player.Character or player.CharacterAdded:Wait()
 
    -- Remove everything from the character before modyfiying
    for _, item in ipairs(character:GetChildren()) do
        if item:IsA("Clothing") then
            item:Destroy()
        end
    end
 
    -- Remove specific items
    removeSpecificItems()
 
    -- Apply new clothes
    local shirt = Instance.new("Shirt")
    shirt.ShirtTemplate = "http://www.roblox.com/asset/?id=1258225294"
    shirt.Parent = character

-- Função aprimorada para criar acessórios
local function createAccessory(accessoryId, textureId, name, scale, attachmentName, cframeOffset)
    local accessory = Instance.new("Accessory")
    accessory.Name = name
 
    local handle = Instance.new("Part")
    handle.Name = "Handle"
    handle.Size = Vector3.new(1, 1, 1) -- Tamanho fixo para colisões
    handle.CanCollide = false
    handle.Parent = accessory
 
    local mesh = Instance.new("SpecialMesh")
    mesh.MeshId = accessoryId
    mesh.TextureId = textureId
    mesh.Scale = scale -- Controle de escala pelo parâmetro
    mesh.Parent = handle
 
    -- Configurar Motor6D para animação correta
    local attachment = character:FindFirstChild(attachmentName, true)
    if attachment then
        local motor = Instance.new("Motor6D")
        motor.Name = "Motor"
        motor.Part0 = handle
        motor.Part1 = attachment.Parent
        motor.C0 = cframeOffset
        motor.Parent = handle
    end
 
    accessory.Parent = character
end
 
-- Função ajustada para aplicar acessórios
local function applyAccessories()
    -- WhiteCollar
    createAccessory(
        "rbxassetid://16302962200",
        "rbxassetid://17187727444",
        "WhiteCollar",
        Vector3.new(1.1, 1.1, 1.1), -- Escala
        "NeckAttachment",
        CFrame.new(0, -0.9, 0) -- Posição
    )
 
    -- PilotCapBlack (Ajustes de posição e rotação)
    createAccessory(
        "rbxassetid://98795869714110",
        "rbxassetid://107929282661128",
        "hairtuftyAccessory",
        Vector3.new(1.1, 1.1, 1.1), -- Escala
        "HatAttachment",
        CFrame.new(0, -0.6, 0) * CFrame.Angles(0, math.rad(90), 0) -- Posição + Rotação corrigida
    )
end
   end,
})
