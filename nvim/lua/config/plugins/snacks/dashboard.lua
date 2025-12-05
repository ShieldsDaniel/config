math.randomseed(os.time())

local neovimVersion = function()
  local versionInfo = vim.version()
  local version = versionInfo.major .. "." .. versionInfo.minor .. "." .. versionInfo.patch
  return {
    align = "center",
    text = {
      { " Neovim ", hl = "footer" },
      { version, hl = "special" },
    },
  }
end

local luaJitVersion = function()
  local version = string.gsub(jit.version, "LuaJIT", "")
  return {
    align = "center",
    text = {
      { " LuaJIT", hl = "footer" },
      { version, hl = "special" },
    },
  }
end

local asciiHeaders = {
  [[
_/\\\\\_____/\\\__/\\\\\\\\\\\\\\\_______/\\\\\_______/\\\________/\\\__/\\\\\\\\\\\__/\\\\____________/\\\\________
_\/\\\\\\___\/\\\_\/\\\///////////______/\\\///\\\____\/\\\_______\/\\\_\/////\\\///__\/\\\\\\________/\\\\\\_______
__\/\\\/\\\__\/\\\_\/\\\_______________/\\\/__\///\\\__\//\\\______/\\\______\/\\\_____\/\\\//\\\____/\\\//\\\______
___\/\\\//\\\_\/\\\_\/\\\\\\\\\\\______/\\\______\//\\\__\//\\\____/\\\_______\/\\\_____\/\\\\///\\\/\\\/_\/\\\_____
____\/\\\\//\\\\/\\\_\/\\\///////______\/\\\_______\/\\\___\//\\\__/\\\________\/\\\_____\/\\\__\///\\\/___\/\\\____
_____\/\\\_\//\\\/\\\_\/\\\_____________\//\\\______/\\\_____\//\\\/\\\_________\/\\\_____\/\\\____\///_____\/\\\___
______\/\\\__\//\\\\\\_\/\\\______________\///\\\__/\\\________\//\\\\\__________\/\\\_____\/\\\_____________\/\\\__
_______\/\\\___\//\\\\\_\/\\\\\\\\\\\\\\\____\///\\\\\/__________\//\\\________/\\\\\\\\\\\_\/\\\_____________\/\\\_
________\///_____\/////__\///////////////_______\/////_____________\///________\///////////__\///______________\///_

    ]],
  [[
..............................................................
::'##::: ##:'########::'#######::'##::::'##:'####:'##::::'##::
:: ###:: ##: ##.....::'##.... ##: ##:::: ##:. ##:: ###::'###::
:: ####: ##: ##::::::: ##:::: ##: ##:::: ##:: ##:: ####'####::
:: ## ## ##: ######::: ##:::: ##: ##:::: ##:: ##:: ## ### ##::
:: ##. ####: ##...:::: ##:::: ##:. ##:: ##::: ##:: ##. #: ##::
:: ##:. ###: ##::::::: ##:::: ##::. ## ##:::: ##:: ##:.:: ##::
:: ##::. ##: ########:. #######::::. ###::::'####: ##:::: ##::
::..::::..::........:::.......::::::...:::::....::..:::::..:::

  ]],
}

local imageHeaders = {
  'neovim.svg',
  'vim.svg',
  'rust.png',
  'haskell.svg',
  'elm.svg',
  'rxjs.svg',
  'typescript.webp',
}

local imageHeaderSet = {}
for _, v in ipairs(imageHeaders) do
  imageHeaderSet[v] = true
end

local function getRandomHeader()
  if math.random(2) == 1 then
    return {
      section = "terminal",
      cmd = "chafa ~/.config/nvim/images/" .. imageHeaders[math.random(#imageHeaders)] ..
          " --align vcenter,hcenter --size 30x30; sleep .1",
      height = 20,
      width = 60,
    }
  else
    return {
      align = "center",
      text = {
        asciiHeaders[math.random(#asciiHeaders)],
        hl = "footer"
      }
    }
  end
end

local function dashboardHeader(entry)
  -- If `entry` is a number, assume it refers to an ASCII header index
  if type(entry) == "number" and asciiHeaders[entry] then
    return {
      align = "center",
      text = { asciiHeaders[entry], hl = "footer" }
    }
  end

  -- If `entry` is a string and exists in `imageHeaderSet`, use it as an image header
  if type(entry) == "string" and imageHeaderSet[entry] then
    return {
      section = "terminal",
      cmd = "chafa ~/.config/nvim/images/" .. entry .. " --align vcenter,hcenter --size 30x30; sleep .1",
      height = 20,
      width = 60,
    }
  end

  -- Default: Return a random header
  return getRandomHeader()
end

return {
  enabled = true,
  width = 60,
  pane_gap = 1,
  preset = {
    pick = 'telescope.nvim',
    keys = {
      { icon = " ", key = "f", desc = "Find File", action = "<leader>sf" },
      { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
      {
        icon = " ",
        key = "g",
        desc = "Find Text",
        action = "<leader>sg"
      },
      { icon = " ", key = "r", desc = "Recent Files", action = "<leader>so" },
      {
        icon = " ",
        key = "c",
        desc = "Config",
        action = function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end
      },
      { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
      { icon = " ", key = "q", desc = "Quit", action = ":qa" },
    },
  },
  sections = {
    dashboardHeader(),
    { section = "keys",   gap = 1, padding = 1 },
    neovimVersion(),
    luaJitVersion(),
    { section = "startup" },
  },
}
