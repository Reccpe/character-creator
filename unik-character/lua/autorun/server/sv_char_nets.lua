/*
   ____ ___  ______   ______  ___ ____ _   _ _____ 
  / ___/ _ \|  _ \ \ / /  _ \|_ _/ ___| | | |_   _|
 | |  | | | | |_) \ V /| |_) || | |  _| |_| | | |  
 | |__| |_| |  __/ | | |  _ < | | |_| |  _  | | |  
  \____\___/|_|    |_| |_| \_\___\____|_| |_| |_|  
                                                   

  Reccpe all copy rights all reserved
  Publishing my respository is prohibited
  
*/


util.AddNetworkString('CharacterFrameInitialize')
util.AddNetworkString('CharacterSetNickname')
util.AddNetworkString('SelectedFlag')
util.AddNetworkString('BirthDayEnter')
util.AddNetworkString('AdjustModelFemale')
util.AddNetworkString('AdjustModelMaleModel')

hook.Add("PlayerSpawn", "InitializeChracterUnik", function( ply )
    net.Start('CharacterFrameInitialize')
    net.Send( ply )
    net.Broadcast()
end)    

net.Receive('CharacterSetNickname', function(len,ply)

    local receivedNickName = net.ReadString()
    ply:setRPName(receivedNickName)

end)

hook.Add('PlayerSpawn', 'SpawnMale', function(ply )
    ply:SetModel(ply:GetPData('ModelSelectedTheMale') )
end)

hook.Add('PlayerSpawn', 'SpawnPlayerTheFemale', function(ply)
    ply:SetModel( ply:GetPData('ChooseModelFemaleModel')  )
end)

net.Receive('SelectedFlag', function(len,ply)

    local flag = net.ReadString()
    ply:SetPData('FlagsSelected', flag)

end)

net.Receive('BirthDayEnter', function(len,ply)

    local birth = net.ReadString()
    ply:SetPData('EnteredBirthDay', birth)

end)

hook.Add("PlayerSpawn", "Identity", function(ply)
    ply:SetModel( ply:GetPData('ChooseModelFemaleModel') )
end)

net.Receive('AdjustModelFemale', function(len,ply)

    local modelFemale = net.ReadString()    
    ply:SetPData('ChooseModelFemaleModel', modelFemale) 

    ply:SetModel( modelFemale )

end)

net.Receive('AdjustModelMaleModel', function(len,ply)

    local randomMaleSelected = net.ReadString()
    ply:SetPData('ModelSelectedTheMale', randomMaleSelected)

    ply:SetModel( ply:GetPData('ModelSelectedTheMale') )

end)