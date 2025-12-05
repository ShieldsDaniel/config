local snacks = require("snacks")

local function get_relative_path(cwd, file)
  local relative_path = file:gsub("^" .. vim.pesc(cwd), "")
  return relative_path
end

local function get_spec_file(file)
  return file:gsub("%.component%.ts$", ".component.spec.ts")
      :gsub("%.component%.html$", ".component.spec.ts")
      :gsub("%.component%.scss$", ".component.spec.ts")
end

function run_jest_script(testFile)
  -- Spinner animation
  local spinner_frames = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
  local spinner_index = 1
  local running = true
  local cwd = vim.fn.getcwd()
  testFile = get_relative_path(cwd, testFile)
  testFile = get_spec_file(testFile)

  print(testFile)
  snacks.notify(testFile)

  -- Start updating the spinner
  local function update_spinner()
    if running then
      snacks.notify("Running Jest tests... " .. spinner_frames[spinner_index], {
        id = "jest_spinner",
        title = "Jest Runner",
        icon = " ",
      })
      spinner_index = (spinner_index % #spinner_frames) + 1
      vim.defer_fn(update_spinner, 100)
    end
  end
  update_spinner()

  -- Create pipes for output
  local stdout = vim.loop.new_pipe(false)
  local stderr = vim.loop.new_pipe(false)
  local output = {}

  -- Spawn Jest asynchronously
  local handle
  handle = vim.loop.spawn("jest-to-quickfix", {
    args = { testFile },
    stdio = { nil, stdout, stderr },
  }, function(code, _)
    running = false -- Stop spinner

    -- Stop reading output
    stdout:read_stop()
    stderr:read_stop()
    stdout:close()
    stderr:close()
    if handle then handle:close() end

    -- Join all output
    local json_output = table.concat(output, "")

    if json_output == "" then
      snacks.notify.error("Jest returned empty output!", { title = "Jest Runner" })
      return
    end

    -- Try decoding the JSON
    local success, test_results = pcall(vim.json.decode, json_output)

    if not success or type(test_results) ~= "table" then
      snacks.notify.error("Failed to parse Jest output!", { title = "Jest Runner" })
      return
    end

    -- **Schedule Quickfix modifications safely**
    vim.schedule(function()
      if test_results.testFailed then
        if test_results.testSuiteFailed then
          vim.diagnostic.setqflist({
            severity = vim.diagnostic.severity.ERROR,
          })
        else
          vim.fn.setqflist(test_results.quickfixList, "r")
        end
        vim.cmd("copen")
        snacks.notify.error("Tests failed!", { title = "Jest Runner" })
      else
        vim.cmd("cclose")
        snacks.notify("✅ All tests passed!", { title = "Jest Runner" })
      end
    end)
  end)

  -- Capture stdout asynchronously
  stdout:read_start(function(err, data)
    if err then
      snacks.notify.error("Error reading Jest output", { title = "Jest Runner" })
      return
    end
    if data then
      table.insert(output, data)
    end
  end)
end

-- Map function to keybind
vim.keymap.set("n", "<leader>test", function()
  run_jest_script(vim.fn.expand("%:p"))
end, { noremap = true, silent = true })
