local appname = "openpkg"
local version = "1.0.3"
local beta = true
local txColor = colors.orange
local bgColor = colors.black
local logotext = http.get("http://pastebin.com/raw/5YbSqE3A").readAll()

local args = {...}
local o = args[1]
local f = args[2]
local x = args[3]
local m = args[4]

term.setTextColor(txColor)
term.setBackgroundColor(bgColor)

local function drawLogo()
  print(logotext)
  print()
  if beta == true then
    print("openpkg " .. version .. " beta")
  else
    print("openpkg " .. version)
  end
  print("")
end

local function pull(url,file)
  if http then
    local ux = http.get(url).readAll()
    local ox = fs.open(file,"w")
    ox.write(ux)
    ox.close()
    return 1
  else
    return 0
  end
end

drawLogo()

