-- Meld init.lua
local config = meld
local colors = dofile("colors.lua")

config.layout = {
  align = true,
  separator = "",
}

config.text = {
  case = "lower",
}

config.colors = {
  label = "white",
  separator = "bright_black",
  value = "white",
}

config.logo = {
  enabled = true,
  padding = 3,
  text = "(\\ /)\n".."( · ·)\n".."c("..colors.red('"')..")("..colors.red('"')..")",
}

-- config.image = {
--   enabled = true,
--   path = "assets/avatar.png",
--   height = 10,
--   crop = "center",
--   padding = 3,
-- }

config.blocks = {
  enabled = false,
  width = 3,
  height = 1,
  symbol = "█",
}

config.labels = {
  directory = "Directory",
  git = "Git",
  spotify = colors.green("now"),
  host = "Host",
  os = colors.blue("os"),
  kernel = colors.red("kr"),
  uptime = "Uptime",
  packages = "Packages",
  shell = colors.bright_cyan("sh"),
  terminal = "Terminal",
  cpu = "CPU",
  gpu = "GPU",
  memory = "Memory",
  battery = "Battery",
  disk = "Disk",
  display = "Resolution",
}

config.order = {
  "kernel",
  "os",
  "shell",
  "spotify",
  --"directory",
  --"git",
  --"host",
  --"uptime",
  --"packages",
  --"terminal",
  --"cpu",
  --"gpu",
  --"memory",
  --"battery",
  --"disk",
  --"display",
}

-- Values:  "branch", "branch_or_commit"
config.git = "branch_or_commit"

config.spotify = {
  format = "$artist —  $track",
  cover_as_image = false,
}

-- Values:  "name", "hostname", "full"
config.host = "full"

-- Values:  "name", "version", "name_version", "full"
config.os = "name"

-- Values:  "name", "version", "name_version", "full"
config.kernel = "name"

-- Values:  "short", "full"
config.uptime = "short"

-- Values:  "total", "compact", "full"
config.packages = "compact"

-- Values:  "name", "path", "full"
config.shell = "name"

-- Values:  "name", "command", "full"
config.terminal = "full"

-- Values:  "model", "model_cores", "full"
config.cpu = "model_cores"

-- Values:  "model", "model_cores", "full"
config.gpu = "full"

-- Values:  "total", "used_total", "full"
config.memory = "full"

-- Values:  "percent", "status", "full"
config.battery = "status"

-- Values:  "used_total", "mount_used_total", "full"
config.disk = "mount_used_total"

-- Values:  "resolution", "name_resolution", "full"
config.display = "resolution"
