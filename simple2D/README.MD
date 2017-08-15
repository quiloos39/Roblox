# How to use it
All you need to do is require it.

# Example
```lua
local simple2D = require("simple2D")

local Screen = simple2D.setup("ScreenGui")

simple2D.bgTransparency(0.3)
simple2D.bgColor3(21, 21, 21)
simple2D.textAlign("Left", "Top")
simple2D.newFont(Enum.Font.Legacy, 24)
--simple2D.setParent(workspace) Isn't neccesary since we run setup function.
-- so on...

local text = simple2D.print("Some text", 0, 0, 100, 100)
simple2D.clear() -- clears all changes you made
```