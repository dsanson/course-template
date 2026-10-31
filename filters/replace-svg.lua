-- replace-svg.lua
-- an AI generated filter that replaces {{< var ... >}} and {{< meta ... >}} codes in svg files, creating sibling '*-generated.svg' files.


local function xml_escape(value)
  return tostring(value)
    :gsub("&", "&amp;")
    :gsub("<", "&lt;")
    :gsub(">", "&gt;")
    :gsub('"', "&quot;")
    :gsub("'", "&apos;")
end

local function replace_shortcodes(svg)
  return svg:gsub(
    "{{<%s*(%a+)%s+([%w_.%-]+)%s*>}}",
    function(kind, key)
      local value

      if kind == "var" then
        value = quarto.variables.get(key)
      elseif kind == "meta" then
        value = quarto.metadata.get(key)
        if value ~= nil then
          value = pandoc.utils.stringify(value)
        end
      else
        return "{{< " .. kind .. " " .. key .. " >}}"
      end

      if value == nil then
        error("Could not find " .. kind .. " value: " .. key)
      end

      return xml_escape(value)
    end
  )
end

local function read_file(path)
  local file = io.open(path, "r")
  if not file then
    return nil
  end

  local contents = file:read("*a")
  file:close()
  return contents
end

local function write_file(path, contents)
  local file, err = io.open(path, "w")
  if not file then
    error("Could not write " .. path .. ": " .. tostring(err))
  end

  file:write(contents)
  file:close()
end

local function scan_directory(dir)
  local ok, entries = pcall(pandoc.system.list_directory, dir)
  if not ok or type(entries) ~= "table" then
    return
  end

  for _, name in ipairs(entries) do
    if name ~= ".git" and name ~= "_site" and name ~= "node_modules" then
      local path = pandoc.path.join({ dir, name })
      local is_dir, children = pcall(pandoc.system.list_directory, path)

      if is_dir and type(children) == "table" then
        scan_directory(path)
      elseif name:lower():match("%.svg$")
          and not name:lower():match("%-generated%.svg$") then


        local svg = read_file(path)

        if svg then
          local generated_path = path:gsub("%.svg$", "-generated.svg")
          local generated_svg = replace_shortcodes(svg)
          local previous_svg = read_file(generated_path)
          local changed = previous_svg ~= generated_svg

          if changed then
            write_file(generated_path, generated_svg)
          end

          -- Export only when the generated SVG changes or an icon is missing
          if path:gsub("\\", "/"):match("media/favicon%.svg$") then
            local dir = pandoc.path.directory(path)
            local favicon_png = pandoc.path.join({ dir, "favicon-32x32.png" })
            local apple_icon = pandoc.path.join({ dir, "apple-touch-icon.png" })

            if changed or not read_file(favicon_png) or not read_file(apple_icon) then
              pandoc.pipe("inkscape", {
                generated_path,
                "--export-filename=" .. apple_icon,
                "--export-width=180",
                "--export-height=180"
              }, "")
            end
          end
        end
      end
    end
  end
end

function Pandoc(doc)
  local root = quarto.project.directory
    or pandoc.system.get_working_directory()

  scan_directory(root)
  return doc
end
