local copilot_status, copilot = pcall(require, "copilot")
if not copilot_status then
  return
end

copilot.setup({
  -- We don't want the inline ghost-text suggestion engine running,
  -- because suggestions are routed through nvim-cmp via copilot-cmp instead.
  suggestion = { enabled = false },
  panel      = { enabled = false },
  -- filetypes is left at default. Add overrides here later if needed.
})

local copilot_cmp_status, copilot_cmp = pcall(require, "copilot_cmp")
if not copilot_cmp_status then
  return
end

copilot_cmp.setup()
