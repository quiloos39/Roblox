--jaja has struck again n00b
local Acuntiox

StartOffTime = tick()

rot = 0

Acuntiox = {
        Commands = {};
        Ranked = {};
        Tablets = {};
        Chats = {};
        Trials = {};
        
        Services = {
              Players = game:GetService("Players");
              Workspace = game:GetService("Workspace");
              Lighting = game:GetService("Lighting");
              RunService = game:GetService("RunService");
              HttpService = game:GetService("HttpService");
        };
        
        Rotation = 0;
        RotationIncrease = .1;
        
        ServerSided = false;
        PrivateServer = {};
        Settings = {
              PrivateServer = {};
              Bans = {};
              Cilent = false;
              Waiting = {};
        };
        
        ServerCilent = false;
        ServerLock = false;
        Script_Owner = getfenv().owner or "Unknown";
        
        Version = 3;
        
        Ranks = {
              {Rank = 10, Description = "Creator"};
              {Rank = 9,  Description = "Lead Developer"};
              {Rank = 8,  Description = "Developer"};
              {Rank = 7,  Description = "Maxiunm Admin"};
              {Rank = 6,  Description = "High Adminstrator"};
              {Rank = 5,  Description = "Good Friend"};
              {Rank = 4,  Description = "Scripter"};
              {Rank = 3,  Description = "Uknown Player"};
              {Rank = 2,  Description = "Player"};
              {Rank = 1,  Description = "Guest"};
              {Rank = 0,  Description = "Member"};
              {Rank = -1, Description = "Banned"};
              {Rank = -2, Description = "Lost"};
              {Rank = -3, Description = "Lagged"};
        };
        
         Colors = {
                "Institutional white",
                "Bright red",
                "Bright blue",
                "Bright yellow",
                "Really black",
                "Bright orange",
                "Bright violet",
                "Dark stone grey",
                "Light stone grey",
                "Really red",
                "Lime green",
                "Really blue",
                "Teal",
                "Hot pink",
                "Gold"
        };--Colors
    
        Functions = {
               CreateData = function(Name,Rank,Color,Description,Prefix)
                        Name=Name or'';
        Rank=Rank or Actuniox.Ranked;
        Description=Description or Acuntiox.Ranked.Description;
        Color=Color or 'New Yeller';
        if(Acuntiox.Ranked[Name]==nil)then
                Acuntiox.Ranked[Name]={Name=Name,Rank=Rank,Color=Color,Color=Color,Description=Description,Prefix=Prefix};
        end;
    end;
               
               
               CreateCommand = function(Name, Say, Rank, Description, Function)
                    Acuntiox.Commands[Name]={Name=Name,Say=Say,Rank=Rank,Description=Description,Function=Function};
               end;
               
               GetRank = function(Player)
                    pcall(function()Player=Player.Name;end);
                    local data=Acuntiox.Ranked[Player];
                    local rank=0;
                    pcall(function()rank=data.Rank;end);
                    return rank;
               end;
               GetColor = function(Player)
                    pcall(function()Player=Player.Name;end);
                    local data=Acuntiox.Ranked[Player];
                    local clr="Lime green";
                    pcall(function()clr=data.Color;end);
                    return clr;
               end;
               GetReason = function(Player)
                    pcall(function()Player=Player.Name;end);
                    local data=Acuntiox.Ranked[Player];
                    local Reason="N/A";
                    pcall(function()Reason=data.Description;end);
                    return Reason;
               end;
               GetPrefix = function(Player)
                      pcall(function()Player=Player.Name;end);
                    local data=Acuntiox.Ranked[Player];
                    local pefix=";";
                    pcall(function()Reason=data.Prefix;end);
                    return prefix;
               end;
               
               Output = function(Player, Text, Time, Color, Function)
                   if Color == nil then Color = "White" or Actuniox.Functions.GetColor(Player)end;
                   if Time == nil then Time = 0 end;
                   if Text == nil then Text = Text or tostring(Text) end;
                   if Player == nil then Player = tostring(Player) or false end;
                   local tablez = {};
                    local Part = Acuntiox.Functions.Create("Part", {Parent = game.Workspace, Name = "REVEX Output~"..tick()*math.tan(os.time()), Locked = true, CFrame = PartCFrame, BrickColor = BrickColor.new(Color), FormFactor = "Custom", TopSurface = 0, BottomSurface = 0, Transparency = 0, Material = "Plastic",Anchored = true, CanCollide = false, Size = Vector3.new(0,0,0)})
                    pcall(function() Part.CFrame = Player.Character.Torso.CFrame end)
                    local  Box = Acuntiox.Functions.Create("SelectionBox", {Parent = Part, Name = "Box", Color = Part.BrickColor, Adornee = Part,Transparency  = 0.7})
                    local Gui = Acuntiox.Functions.Create("BillboardGui", {Parent = Part, Name = "Gui", StudsOffset = Vector3.new(0, 5, 0), Size = UDim2.new(10,0,10,0), Adornee = Part})
                    local TextLabel = Acuntiox.Functions.Create("TextLabel", {Parent = Gui, Name = "Text", Text = Text, FontSize = "Size24", TextColor3 = Part.Color, Font = "SourceSansBold", BackgroundTransparency = 1, Size = UDim2.new(1,0,1,0), TextStrokeTransparency = 0, TextTransparency = 0})
                    local ClickDetector = Acuntiox.Functions.Create("ClickDetector",{Parent = Part,MaxActivationDistance=1/0}) 
                        ClickDetector.MouseClick:connect(function(p)
                            if p.Name == Player.Name then
                              if Acuntiox.Functions.GetRank(p) > Acuntiox.Functions.GetRank(Player) then
                                 Part:Destroy()
                             else
                                 for i,v in pairs(Acuntiox.Tablets) do
                                    if v.Name == Part.Name then
                                        table.remove(Acuntiox.Tablets, i)
                                    end 
                               end;
                                  if Function ~= nil then
                                     local a,b=ypcall(function()
                                         Function(Part, Box)
                                    end) if not a then Acuntiox.Functions.Output(Player,b,0,"Really red") end
                                end 
                        end 
                    end
                end)
                for Size = 2.5, 2.5, 2.5 do
                     Part.Size = Vector3.new(Size, Size, Size)
                     --game:GetService("RunService").Heartbeat:wait()
                end 
                Part.Parent = script
            tablez.Owner = Player
            tablez.Tab = Part
           table.insert(Acuntiox.Tablets, tablez)
         end;  
           Create = function(ClassName, Properties) -- A function to create instances.
                                local Instance = Instance.new(ClassName)
                                local Properties = Properties or {}
                                local ConnectionIndexes = {"MouseClick","MouseHoverEnter","MouseHoverLeave","MouseButton1Down","MouseButton2Down"}
                                local CheckConnection = function(Index)
                                        local Index = tostring(Index)
                                        for _, Connect in next,(ConnectionIndexes) do
                                                if Index:lower() == Connect:lower() then
                                                        return true
                                                end
                                        end
                                        return false
                                end
                                for Index, Value in next,(Properties) do
                                        if not CheckConnection(Index) then
                                                Instance[Index] = Value
                                        else
                                                Instance[Index]:connect(Value)
                                        end
                                end
                                return Instance
        end;
        UpdateTablets = function()
              --pcall(function()
         Acuntiox.Rotation=Acuntiox.Rotation+Acuntiox.RotationIncrease/100
        for _,Player in pairs(game:service'Players':GetPlayers()) do
            local Counter = 0
            local PlayerTablets = {}
            for i,v in pairs(Acuntiox.Tablets) do
                if v.Tab.Parent ~= nil and v.Owner==Player then
                    table.insert(PlayerTablets,v)
                end
        end
       
 
            local Start = CFrame.new(0,0,0)
            for I = 1, #PlayerTablets do
                radius = (#PlayerTablets*.6)+4
                        local Pos = nil
                        pcall(function() Pos = Player.Character.Torso.CFrame end)
                        if Pos == nil then return end
                           local m=(I/#PlayerTablets-(.5/#PlayerTablets)+(Acuntiox["Rotation"]/(#PlayerTablets/10)))*math.pi*2
                           local rad=(#PlayerTablets*.6)+4
                            local x = math.sin(time()/#PlayerTablets + (math.pi*2)/#PlayerTablets*I) * (#PlayerTablets+3)
                        local y = math.sin(math.sin(time()+I*1))
                        local z = math.cos(time()/#PlayerTablets + (math.pi*2)/#PlayerTablets*I) * (#PlayerTablets+3)
                           local arot=Vector3.new(x,y,z)+Pos.p
                           local brot=PlayerTablets[I].Tab.CFrame.p
                           local crot=arot*.1+brot *.9
                           local d=math.rad((Acuntiox["Rotation"]*300)*math.pi)
                           PlayerTablets[I].Tab.CFrame=CFrame.new(crot,Pos.p)*CFrame.Angles(0,0,0)
                           * CFrame.fromEulerAnglesXYZ(math.sin(time()/math.pi),math.sin(time()/math.pi),math.sin(time()/math.pi))
                end;
           end;
        end;
       Chatted = function(Speaker, Message)
             if Message:sub(1,3) == "/e" then
                 Message=Message:sub(4); 
           end; 
           local key=Acuntiox.Functions.GetPrefix(Speaker) or '/'
           local command=message;
           for _,CMDS in pairs(Acuntiox.Commands) do
                 if Message:sub(1,#CMDS['Say']+#key) == CMDS['Say']..key then
                       if Acuntiox.Functions.GetRank(Speaker) >= CMDS['Rank'] then
                            local Error,Func=ypcall(function()
                                 CMDS['Function'](Speaker, Message);
                            end)  if not Error then Acuntiox.Functions.Output(Speaker, Func, 0, "Really red"); end;
                        else
                            Acuntiox.Functions.Output(Speaker, "You cannot execute that command for rank " .. CMDS['Rank'] .. "!", 0, "Really red");
                      end; 
                 end; 
            end; 
       end;
       Dismiss = function(Player)
             for _,v in next, Acuntiox.Tablets do
                 if v.Owner == Player then
                     v.Tab:Destroy();
                end; 
           end; 
       end;
       PlayerSettings = function(Speaker)
             
       end;
    };
};

Seconds = 0

Minutes = 0

Hours = 0

coroutine.wrap(function()
        while wait(1) do
            Seconds = Seconds + 1
                if Seconds == 60 then
                        Seconds = 0 ---<<<--- Also stolen by iKlitoris
                        Minutes = Minutes + 1
                end
                if Minutes == 60 then
                Minutes = 0
                        Hours = Hours + 1
                end
        end
end)()




Acuntiox.Functions.CreateData('GravityPerfextion',10,'White','Creator','/');
Acuntiox.Functions.CreateData('supersonicfan111',6,'New Yeller','Best Friend','>');
Acuntiox.Functions.CreateData('jillmiles1',3,'White','Good Friend',';');
Acuntiox.Functions.CreateData('SavageMunkey',3,'Hot pink','Good Friend made some admins with him.',';')
Acuntiox.Functions.CreateData('awesomedude739',3,'New Yeller','Good Friend made some admins with him.',';')
Acuntiox.Functions.CreateData('bomblover',-1,'Really red','Fucking idiot who kicked me.','')
Acuntiox.Functions.CreateData('Vexue',-1,'Really red','Stupid idiot.','')
Acuntiox.Functions.CreateData('iLordVex',3,'Hot pink','asd','')
Acuntiox.Functions.CreateData('CHAOSxFIGHTER',3,'Deep orange','Good Friend, Exploiter Buddy.','>')
Acuntiox.Functions.CreateData('Diitto',-2,'Hot pink','Skid, idiot, and a dumb brat.','')
Acuntiox.Functions.CreateData('Zeus980',-2,'Really red','Dumb fool','Trying to get me and supersonicfan111(s) ip.','')
Acuntiox.Functions.CreateData('detaching',3,'Teal','Good Friend','/')
Acuntiox.Functions.CreateData('Pkamara',3,'Deep orange','Good guy','!')
Acuntiox.Functions.CreateData('LordRevorius',3,'Royal purple','Good guy',';')
Acuntiox.Functions.CreateData('aceahmedmoh',1,'Really black','Lol asd','')
Acuntiox.Functions.CreateData("SolarEnvironment", 3, "Cyan", "Good guy and scripter.")
Acuntiox.Functions.CreateData("gavinsharp100", 3, "Really blue", "Good Guy.")





for _,Player in pairs(game:service("Players"):GetPlayers()) do
    if Acuntiox.Functions.GetRank(Player) <= Acuntiox.Functions.GetRank(Player) then
       Acuntiox.Functions.Output(Player, "Welcome to Actuniox Admin!", 1, "White");
       Acuntiox.Functions.Output(Player, "Made by GravityLegendary", 1, "White");
       Acuntiox.Functions.Output(Player, "You are Rank : " ..Acuntiox.Functions.GetRank(Player), 0, "White");
       Acuntiox.Functions.Output(Player, "Acuntiox Tabs Connected.", 0, "White");
       Player.Chatted:connect(function(m) Acuntiox.Functions.Chatted(Player, m) end);
       end
end

Acuntiox.Functions.OpenCommands = function(Speaker, rank)
            Acuntiox.Functions.Dismiss(Speaker);
      table.foreach( Acuntiox.Commands,function(i,v)
          if v['Rank'] <= rank then
         Acuntiox.Functions.Output(Speaker, v.Name,  0,   'Really blue', function()
             Acuntiox.Functions.Dismiss(Speaker);
             Acuntiox.Functions.Output(Speaker, 'Name : ' ..v.Name,  Acuntiox.Functions.GetColor(Speaker));
             Acuntiox.Functions.Output(Speaker, 'Rank : ' ..v.Rank,  Acuntiox.Functions.GetColor(Speaker));
             Acuntiox.Functions.Output(Speaker, 'Description : ' ..v.Description,  Acuntiox.Functions.GetColor(Speaker));
             Acuntiox.Functions.Output(Speaker, 'Usage : ' ..v.Say,  Acuntiox.Functions.GetColor(Speaker));
        end)
        end
    end)
end 

Acuntiox.Functions.CreateCommand('View Commands','cmds',0,'View All Commands',function(Speaker, Message)
       Acuntiox.Functions.Dismiss(Speaker)
       --pcall(function()
         Acuntiox.Functions.Output(Speaker, "View all commands that are avaiable", 0, "Lime green", function() Acuntiox.Functions.Dismiss(Speaker) Acuntiox.Functions.OpenCommands(Acuntiox.Functions.GetRank(Speaker)) end)
         for i = 0,10 do
             Acuntiox.Functions.Output(Speaker, "Rank " .. i .. " Commands", 0, Acuntiox.Functions.GetColor(Speaker), function() Acuntiox.Functions.OpenCommands(Speaker, i) end) 
        end 
    --end)
end)

Acuntiox.Functions.CreateCommand('Test','test',0,'Just a test',function(Speaker, Message)
      Acuntiox.Functions.Output(Speaker, Message);
end)

Acuntiox.Functions.CreateCommand('Dismiss','dt',0,'Dismiss your tablet.',function(Speaker, Message)
     Acuntiox.Functions.Dismiss(Speaker)
end)

Acuntiox.Functions.CreateCommand('Dismiss all','dtall',4,'Dismiss everyones tablet.',function(Speaker, Message)
      for _,Player in pairs(game:GetService("Players"):GetPlayers()) do
          Acuntiox.Functions.Dismiss(Player) 
     end 
end)

Acuntiox.Functions.CreateCommand('View Ranked people','ranked',1,'View all ranked people',function(Speaker, Message)
      Acuntiox.Functions.Dismiss(Speaker)
      table.foreach(Acuntiox.Ranked,function(i,v)
        Acuntiox.Functions.Output(Speaker, v.Name, 0, Acuntiox.Functions.GetColor(v), function()
            Acuntiox.Functions.Dismiss(Speaker)
                  Acuntiox.Functions.Output(Speaker, "Name : " ..v.Name, "White")
               Acuntiox.Functions.Output(Speaker, "Rank : " ..Acuntiox.Functions.GetRank(v), 0, "New Yeller")
               Acuntiox.Functions.Output(Speaker, "Color : " ..Acuntiox.Functions.GetColor(v), 0, "White")
               Acuntiox.Functions.Output(Speaker, "Reason : " ..Acuntiox.Functions.GetReason(v), 0, "New Yeller")
               --Acuntiox.Functions.Output(Speaker, "AccountAge : " ..Player.AccountAge, 1, "Lime green")
        end)
    end)
end)

Acuntiox.Functions.CreateCommand('View Players','plrs',3,'View list of players',function(Speaker, Message)
     Acuntiox.Functions.Dismiss(Speaker)
     table.foreach(game:GetService("Players"):GetPlayers(),function(_, Player)
           Acuntiox.Functions.Output(Speaker, Player.Name, 0, "Really blue", function() Acuntiox.Functions.Dismiss(Speaker)
               Acuntiox.Functions.Output(Speaker, "Name : " ..Player.Name, "White")
               Acuntiox.Functions.Output(Speaker, "Rank : " ..Acuntiox.Functions.GetRank(Player), 0, "New Yeller")
               Acuntiox.Functions.Output(Speaker, "Color : " ..Acuntiox.Functions.GetColor(Player), 0, "White")
               Acuntiox.Functions.Output(Speaker, "Reason : " ..Acuntiox.Functions.GetReason(Player), 0, "New Yeller")
               Acuntiox.Functions.Output(Speaker, "AccountAge : " ..Player.AccountAge, 1, "Lime green")
               Acuntiox.Functions.Output(Speaker, "UserId : " ..Player.userId, 0, "Really red")
          end)
     end)
end)

Acuntiox.Functions.CreateCommand('Net','net',3,'View all the network players.',function(Speaker, Message)
          table.foreach(game:GetService("NetworkServer"):children(),function(_, Player)
           Acuntiox.Functions.Output(Speaker, Player.Name, 0, "Really blue", function() Acuntiox.Functions.Dismiss(Speaker)
               Acuntiox.Functions.Output(Speaker, "Name : " ..Player.Name, "White")
               Acuntiox.Functions.Output(Speaker, "Rank : " ..Acuntiox.Functions.GetRank(Player), 0, "New Yeller")
               Acuntiox.Functions.Output(Speaker, "Color : " ..Acuntiox.Functions.GetColor(Player), 0, "White")
               Acuntiox.Functions.Output(Speaker, "Reason : " ..Acuntiox.Functions.GetReason(Player), 0, "New Yeller")
               Acuntiox.Functions.Output(Speaker, "AccountAge : " ..Player.AccountAge, 1, "Lime green")
               Acuntiox.Functions.Output(Speaker, "UserId : " ..Player.userId, 0, "Really red")
          end)
     end)
end)

Acuntiox.Functions.CreateCommand('Execute','exe',2,'Execute a message.',function(Speaker, Message)
      local Success, Error = loadstring(Message)
                getfenv(Success).print = function(...)
                        local Prints = {...}
                        for SelectedPrint = 1, #Prints do
                                Acuntiox.Functions.Output(Speaker, 0, 'Really red', tostring(Prints[SelectedPrint]))
                        end
                end
                if Success then
                        Success()
                        Acuntiox.Functions.Output(Speaker, 'The script has successfully completed.', 0, 'Really red')
                else
                        Acuntiox.Functions.Output(Speaker, Error,  0, 'Really red')
                end
                getfenv(Success).print = nil
end)

Acuntiox.Functions.CreateCommand('Info','info',0,'Info about Acuntiox', function(Speaker, Message)
       Acuntiox.Functions.Dismiss(Speaker)
       Acuntiox.Functions.Output(Speaker, "Name Of Admin : Acuntiox", 0, Acuntiox.Functions.GetColor(Speaker))
       Acuntiox.Functions.Output(Speaker, "It took : " .. StartOffTime .. " to start Acuntiox ", 0, Acuntiox.Functions.GetColor(Speaker))
       Acuntiox.Functions.Output(Speaker, "The Version is : " .. Acuntiox.Version .. " ! ", 0, Acuntiox.Functions.GetColor(Speaker))
       Acuntiox.Functions.Output(Speaker, "Made by GravityLegendary AKA, GravityPerfextion.", 0, Acuntiox.Functions.GetColor(Speaker))
end)

Acuntiox.Functions.CreateCommand('Run time','rtime',1,'Shows how many time Acuntiox has ran', function(Speaker, Message)
      Acuntiox.Functions.Output(Speaker,('Acuntiox has been running for %d:%d:%d'):format(Hours,Minutes,Seconds))
      Acuntiox.Functions.Output(Speaker,('Acuntiox has been running for %d hours, %d minutes, and %d seconds'):format(Hours,Minutes,Seconds))
end)

Acuntiox.Functions.CreateCommand('Open menu','cmenu',4,'View the menu',function(Speaker, Message)
      Acuntiox.Functions.Dismiss(Speaker)
      Acuntiox.Functions.Output(Speaker, "Admin menu", 0, Acutniox.Functions.GetColor(Speaker), function()
        Acuntiox.Functions.Dismiss(Speaker)
        Acuntiox.Functions.Output(Speaker, "Not done yet.", 0, "Really red")
    end)
end)

game:GetService("Players").PlayerAdded:connect(function(Player)
      Acuntiox.Functions.Output(Player, "Welcome to Actuniox Admin!", 1, "White");
       Acuntiox.Functions.Output(Player, "Made by GravityLegendary", 1, "White");
       Acuntiox.Functions.Output(Player, "You are Rank : " ..Acuntiox.Functions.GetRank(Player), 0, "White");
       Acuntiox.Functions.Output(Player, "Acuntiox Tabs Connected.", 0, "White");
       Player.Chatted:connect(function(m) Acuntiox.Functions.Chatted(Player, m) end);
end)

coroutine.wrap(function()
         
end)()

--[[for _,SelectedName in pairs(game.Players:players()) do
      coroutine.wrap(function()
             if Acuntiox.Functions.GetRank(SelectedName) == -0 then
                  Acutniox.Functions.Kick(Player)
             end 
         elseif Acuntiox.Functions.GetRank(SelectedName) == -1 then
             Acuntiox.Functions.Shutdown(Player)
         if Acuntiox.Functions.GetRank(Player) == 2 then
              Acutniox.Functions.Output(Player, "Welcome to Acutniox Tabs! " .. Player.Name.. "", 0, "New Yeller")
             end 
      end)()
end]]--


         
game:GetService("RunService").Heartbeat:connect(Acuntiox.Functions.UpdateTablets);