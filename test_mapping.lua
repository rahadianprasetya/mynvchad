-- test_mappings.lua
print("Testing Ctrl+Shift+Arrow mappings...")

-- Test receiver
vim.keymap.set('n', '\x1b[1;6A', function()
  print("Ctrl+Shift+Up received!")
  vim.cmd('move-2')
  vim.cmd('normal! ==')
end, { silent = true })

vim.keymap.set('n', '\x1b[1;6B', function()
  print("Ctrl+Shift+Down received!")
  vim.cmd('move+')
  vim.cmd('normal! ==')
end, { silent = true })
