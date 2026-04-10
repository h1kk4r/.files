local esc = string.char(27)

local palette = {
  black = 30,
  red = 31,
  green = 32,
  yellow = 33,
  blue = 34,
  magenta = 35,
  cyan = 36,
  white = 37,
  bright_black = 90,
  bright_red = 91,
  bright_green = 92,
  bright_yellow = 93,
  bright_blue = 94,
  bright_magenta = 95,
  bright_cyan = 96,
  bright_white = 97,
}

local colors = {
  reset = esc .. "[0m",
}

local function code(value)
  return esc .. "[" .. value .. "m"
end

local function wrap(value, text)
  return code(value) .. text .. colors.reset
end

function colors.paint(name, text)
  local value = palette[name]

  if value == nil then
    return text
  end

  return wrap(value, text)
end

for name, value in pairs(palette) do
  colors[name] = function(text)
    return wrap(value, text)
  end
end

function colors.join(lines)
  return table.concat(lines, "\n")
end

return colors
