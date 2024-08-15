/*
   ____ ___  ______   ______  ___ ____ _   _ _____ 
  / ___/ _ \|  _ \ \ / /  _ \|_ _/ ___| | | |_   _|
 | |  | | | | |_) \ V /| |_) || | |  _| |_| | | |  
 | |__| |_| |  __/ | | |  _ < | | |_| |  _  | | |  
  \____\___/|_|    |_| |_| \_\___\____|_| |_| |_|  
                                                   

  Reccpe all copy rights all reserved
  Publishing my respository is prohibited
  
*/

local background = Material("background-unik.png")
local femaleMat = Material("women512.png")
local maleMat = Material("delivery-boy.png")
local logout = Material("logout.png")

surface.CreateFont( "CharacterUnikRP_ButtonFontBig", { font = "Freeman", extended = false, size = 40, weight = 500,} )
surface.CreateFont( "CharacterUnikRP_ButtonFontSmall", { font = "Freeman", extended = false, size = 20, weight = 300,} )

include("autorun/client/cl_characters.lua")

surface.CreateFont( "CloseButtonFont", { font = "Arial", extended = false, size = 16, weight = 400} )

net.Receive('CharacterFrameInitialize', function(len,ply)

    local randomFemale = table.Random( CHARACTERS.Woman )
    local randomMale = table.Random( CHARACTERS.Male )

    if !IsValid( CHARACTER_FRAME ) then
        
        local CHARACTER_FRAME = vgui.Create('DFrame')
        CHARACTER_FRAME:Dock(FILL)
        CHARACTER_FRAME:MakePopup()
        CHARACTER_FRAME:SetDraggable( false )
        CHARACTER_FRAME:SetSizable( false ) 
        CHARACTER_FRAME:ShowCloseButton( false )
        CHARACTER_FRAME:SetTitle("")
        CHARACTER_FRAME.Paint = function(self,w,h)
            surface.SetDrawColor(32,32,32)
            surface.DrawRect(0,0,w,h)
            surface.SetMaterial(background)
            surface.SetDrawColor(255,255,255,230)
            surface.DrawTexturedRect(0,0,w,h)
        end 

        local x,y = CHARACTER_FRAME:GetWide() 

        local closeButton = vgui.Create("DButton",CHARACTER_FRAME)
        closeButton:Dock(TOP)
        closeButton:SetText("")
        closeButton:DockMargin(1830,-20,0,0)
        closeButton.Paint = function(self,w,h)
            if self:IsHovered() then
                surface.SetDrawColor(255,0,0)
                surface.DrawRect(0,0,w,h)
                surface.SetDrawColor(255,0,0,200)
                surface.DrawOutlinedRect(0,0,w,h,1)
                draw.DrawText("Close","CloseButtonFont",35,2,color_white,TEXT_ALIGN_CENTER)
            else
                surface.SetDrawColor(255,0,0,200)
                surface.DrawOutlinedRect(0,0,w,h,1)
                draw.DrawText("Close","CloseButtonFont",35,2,color_white,TEXT_ALIGN_CENTER)
            end

        end
        closeButton.DoClick = function(self)
            CHARACTER_FRAME:Remove()
        end

        local firstNameBtn = vgui.Create("DButton", CHARACTER_FRAME)
        firstNameBtn:Dock(TOP)
        firstNameBtn:DockMargin(55,130,1490,0)
        firstNameBtn:SetText("")
        firstNameBtn:SetTall(80)
        firstNameBtn.Paint = function(self,w,h)
            surface.SetDrawColor(255,255,255)
            surface.DrawOutlinedRect(0,0,w,h,1)
            draw.RoundedBox(11,0,0,w,h,Color(0,0,0,230))
            -- draw.SimpleText("FIRST NAME & LAST NAME","CharacterUnikRP_ButtonFontBig",80,20,color_white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)  
            draw.SimpleText("36 Characters Maximum", "CharacterUnikRP_ButtonFontSmall",80,50,color_white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
        end

        // ENTRY SECTIONS

        local firstNameEntry = vgui.Create('DTextEntry', firstNameBtn)
        firstNameEntry:Dock(TOP)
        firstNameEntry:DockMargin(11,10,140,0)
        firstNameEntry:SetTall(30)
        firstNameEntry:SetPaintBackground( false )
        firstNameEntry:SetFont("CharacterUnikRP_ButtonFontBig")
        firstNameEntry:SetTextColor(Color(255,255,255))
        firstNameEntry:SetPlaceholderText("FIRST NAME & LAST NAME")
        firstNameEntry:SetPlaceholderColor(Color(255,255,255))
        firstNameEntry.OnEnter = function(self)
            net.Start('CharacterSetNickname')
            net.WriteString( self:GetValue() )
            net.SendToServer()
        end

        local birthdayDate = vgui.Create("DButton", CHARACTER_FRAME)
        birthdayDate:Dock(TOP)
        birthdayDate:DockMargin(55,30,1490,0)
        birthdayDate:SetText("")
        birthdayDate:SetTall(80)
        birthdayDate.Paint = function(self,w,h)
            surface.SetDrawColor(255,255,255)
            surface.DrawOutlinedRect(0,0,w,h,1)
            draw.RoundedBox(11,0,0,w,h,Color(0,0,0,230))
            draw.SimpleText("Must be at least 18 years", "CharacterUnikRP_ButtonFontSmall",81,50,color_white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
        end

        local birthdayEntry = vgui.Create('DTextEntry', birthdayDate)
        birthdayEntry:Dock(TOP)
        birthdayEntry:DockMargin(11,10,140,0)
        birthdayEntry:SetTall(30)
        birthdayEntry:SetPaintBackground( false )
        birthdayEntry:SetFont("CharacterUnikRP_ButtonFontBig")
        birthdayEntry:SetTextColor(Color(255,255,255))
        birthdayEntry:SetPlaceholderText("DATE OF BIRTH")
        birthdayEntry:SetPlaceholderColor(Color(255,255,255))
        birthdayEntry.OnEnter = function(self)
            net.Start('BirthDayEnter')
            net.WriteString( self:GetValue() )
            net.SendToServer()
        end

        local nationalityBtn = vgui.Create("DButton", CHARACTER_FRAME)
        nationalityBtn:Dock(TOP)
        nationalityBtn:DockMargin(55,30,1490,0)
        nationalityBtn:SetText("")
        nationalityBtn:SetTall(80)
        nationalityBtn.Paint = function(self,w,h)
            surface.SetDrawColor(255,255,255)
            surface.DrawOutlinedRect(0,0,w,h,1)
            draw.RoundedBox(11,0,0,w,h,Color(0,0,0,230))
            draw.SimpleText("NATIONALITY","CharacterUnikRP_ButtonFontBig",80,20,color_white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)  
            draw.SimpleText("The country you come from", "CharacterUnikRP_ButtonFontSmall",81,50,color_white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
        end

        local scroll = vgui.Create('DScrollPanel', nationalityBtn)
        scroll:Dock(RIGHT)
        local ListItems = vgui.Create('DIconLayout', scroll)
        ListItems:Dock(RIGHT)
        ListItems:SetSpaceX(1)
        ListItems:SetSpaceY(1)
        for flags,values in pairs( CHARACTERS.Nations ) do
        
            local flagLists = vgui.Create('DButton',ListItems)
            flagLists:SetSize(30,30)
            flagLists:SetMaterial(values)
            flagLists.Paint = nil
            flagLists.DoClick = function(self)
                net.Start('SelectedFlag')
                net.WriteString( values )
                net.SendToServer()
            end

        end

        local femaleButton = vgui.Create("DButton", CHARACTER_FRAME)
        femaleButton:Dock(TOP)
        femaleButton:DockMargin(55,50,1670,0)
        femaleButton:SetText("")
        femaleButton:SetTall(60)
        femaleButton.Paint = function(self,w,h)
            surface.SetDrawColor(255,255,255)
            surface.DrawOutlinedRect(0,0,w,h,1)
            draw.RoundedBox(11,0,0,w,h,Color(0,0,0,230))
            draw.SimpleText("FEMALE","CharacterUnikRP_ButtonFontBig",106,30,color_white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
            surface.SetMaterial(femaleMat)
            surface.SetDrawColor(255,255,255)
            surface.DrawTexturedRect(0,13,50,50)
        end

        local maleButton = vgui.Create("DButton", CHARACTER_FRAME)
        maleButton:Dock(TOP)
        maleButton:DockMargin(270,-60,1470,0)
        maleButton:SetText("")
        maleButton:SetTall(60)
        maleButton.Paint = function(self,w,h)
            surface.SetDrawColor(255,255,255)
            surface.DrawOutlinedRect(0,0,w,h,1)
            draw.RoundedBox(11,0,0,w,h,Color(0,0,0,230))
            draw.SimpleText("MALE","CharacterUnikRP_ButtonFontBig",106,30,color_white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
            surface.SetMaterial(maleMat)
            surface.SetDrawColor(255,255,255)
            surface.DrawTexturedRect(0,13,50,50)
        end

        local adjustModel = vgui.Create( "DModelPanel", CHARACTER_FRAME )
        adjustModel:SetSize( 800, 800 )
        adjustModel:SetPos(650,300)
        adjustModel:SetModel( LocalPlayer():GetModel() )
        function adjustModel:LayoutEntity( ent ) end

        femaleButton.DoClick = function(self)
            adjustModel:SetModel( randomFemale )
            net.Start('AdjustModelFemale')
            net.WriteString(randomFemale)
            net.SendToServer()
        end

        maleButton.DoClick = function(self)
            adjustModel:SetModel( randomMale )
            net.Start('AdjustModelMaleModel')
            net.WriteString(randomMale)
            net.SendToServer()
        end

        local joinDiscord = vgui.Create('DButton', CHARACTER_FRAME)
        joinDiscord:Dock(BOTTOM)
        joinDiscord:DockMargin(820,0,820,0)
        joinDiscord:SetTall(50)
        joinDiscord:SetText("")
        joinDiscord.Paint = function(self,w,h)
            draw.RoundedBox(5,0,0,w,h,Color(16,78,177))
            draw.DrawText('JOIN OUR DISCORD','CharacterUnikRP_ButtonFontBig',130,4,Color(255,255,255),TEXT_ALIGN_CENTER)
        end
        joinDiscord.DoClick = function(self)
            gui.OpenURL("https://discord.gg/eQ63maTrGp")
        end

        local playButton = vgui.Create('DButton', CHARACTER_FRAME)
        playButton:Dock(BOTTOM)
        playButton:DockMargin(886,0,885,30)
        playButton:SetTall(50)
        playButton:SetText("")
        playButton.Paint = function(self,w,h)
            draw.RoundedBox(5,0,0,w,h,Color(0,255,0))
            draw.DrawText('PLAY','CharacterUnikRP_ButtonFontBig',65,4,Color(255,255,255),TEXT_ALIGN_CENTER)
        end
        playButton.DoClick = function(self)
            CHARACTER_FRAME:Remove()
        end

    end
    
end)