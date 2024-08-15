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

hook.Add("PlayerSpawn", "InitializeChracterUnik", function( ply )
    net.Start('CharacterFrameInitialize')
    net.Send( ply )
    net.Broadcast()
end)    