-- Headless nvim startup health check
-- Run: nvim --headless -c "luafile .github/scripts/nvim-startup.lua" nvim/init.lua

local errors = {}

local function check(name, fn)
  local ok, err = pcall(fn)
  if not ok then
    table.insert(errors, name .. ": " .. tostring(err))
  else
    io.write("  ✓ " .. name .. "\n")
  end
end

io.write("nvim startup health check\n")
io.write(string.rep("-", 40) .. "\n")

-- Check treesitter parsers are installed
check("treesitter parsers loaded", function()
  local parsers = vim.api.nvim_get_runtime_file("parser/*.so", true)
  assert(#parsers > 0, "no parsers found, got " .. #parsers)
end)

-- Check leader key
check("leader key is space", function()
  assert(vim.g.mapleader == " ", "leader is " .. tostring(vim.g.mapleader))
end)

-- Check core keymaps exist
check("core keymaps exist", function()
  local maps = vim.api.nvim_get_keymap("n")
  local expected = { [" ff"] = false, [" lg"] = false, [" cc"] = false }
  for _, m in ipairs(maps) do
    if expected[m.lhs] ~= nil then
      expected[m.lhs] = true
    end
  end
  for lhs, found in pairs(expected) do
    assert(found, "missing keymap: " .. lhs)
  end
end)

-- Check arrow keys are disabled
check("arrow keys disabled", function()
  local maps = vim.api.nvim_get_keymap("n")
  for _, m in ipairs(maps) do
    if m.lhs == "<Up>" or m.lhs == "<Down>" or m.lhs == "<Left>" or m.lhs == "<Right>" then
      assert(m.rhs == "" or m.rhs == "<Nop>", m.lhs .. " is not disabled")
    end
  end
end)

-- Check colorscheme is gruvbox
check("colorscheme is gruvbox", function()
  local cs = vim.g.colors_name
  assert(cs == "gruvbox", "colorscheme is " .. tostring(cs))
end)

-- Check no startup errors
check("no startup errors", function()
  local msgs = vim.api.nvim_exec2("messages", { output = true }).output
  if msgs:match("E%d%d%d+:") then
    error("found vim errors in messages:\n" .. msgs)
  end
end)

io.write(string.rep("-", 40) .. "\n")
if #errors > 0 then
  io.write("FAILED:\n")
  for _, e in ipairs(errors) do
    io.write("  ✗ " .. e .. "\n")
  end
  vim.cmd("cq 1")
else
  io.write("All checks passed!\n")
  vim.cmd("qa!")
end
