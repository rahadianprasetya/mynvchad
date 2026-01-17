require "nvchad.mappings"


-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--
-- Nvim DAP
map("n", "<Leader>dl", "<cmd>lua require'dap'.step_into()<CR>", { desc = "Debugger step into" })
map("n", "<Leader>dj", "<cmd>lua require'dap'.step_over()<CR>", { desc = "Debugger step over" })
map("n", "<Leader>dk", "<cmd>lua require'dap'.step_out()<CR>", { desc = "Debugger step out" })
map("n", "<Leader>dc", "<cmd>lua require'dap'.continue()<CR>", { desc = "Debugger continue" })
map("n", "<Leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Debugger toggle breakpoint" })
map(
	"n",
	"<Leader>dd",
	"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
	{ desc = "Debugger set conditional breakpoint" }
)
map("n", "<Leader>de", "<cmd>lua require'dap'.terminate()<CR>", { desc = "Debugger reset" })
map("n", "<Leader>dr", "<cmd>lua require'dap'.run_last()<CR>", { desc = "Debugger run last" })

-- rustaceanvim
map("n", "<Leader>dt", "<cmd>lua vim.cmd('RustLsp testables')<CR>", { desc = "Debugger testables" })


vim.keymap.set('n', 'gpd', function()
  local clients = vim.lsp.get_active_clients({bufnr = 0})
  if #clients == 0 then return end  -- pastikan ada LSP aktif
  local client = clients[1]         -- ambil client pertama

  -- buat params dengan position_encoding
  local params = vim.lsp.util.make_position_params(nil, client.offset_encoding)

  vim.lsp.buf_request(0, 'textDocument/definition', params, function(err, result, ctx, _)
    if err or not result or vim.tbl_isempty(result) then return end

    local def = result[1]
    local uri = def.uri or def.targetUri
    local range = def.range or def.targetRange
    local bufnr = vim.uri_to_bufnr(uri)

    vim.fn.bufload(bufnr)
    vim.lsp.util.preview_location({ uri = uri, range = range })
  end)
end, { noremap = true, silent = true })



-- Untuk karakter kontrol (Ctrl+Shift menghasilkan ^J/^K)
vim.keymap.set("n", "<C-S-Down>", ":move+<CR>==", { 
  silent = true,
  desc = "Move line down (Ctrl+J)" 
})

vim.keymap.set("n", "<C-S-Up>", ":move-2<CR>==", { 
  silent = true,
  desc = "Move line up (Ctrl+K)" 
})

vim.keymap.set("v", "<C-S-Down>", ":move '>+1<CR>gv=gv", { 
  silent = true,
  desc = "Move selection down (Ctrl+J)" 
})
vim.keymap.set("v", "<C-S-Up>", ":move '<-2<CR>gv=gv", { 

  silent = true,
  desc = "Move selection up (Ctrl+K)" 
})

--- COPY CODE CTRL + D
vim.keymap.set("n", "<C-d>", "yyp", { noremap = true, silent = true })

vim.keymap.set("x", "<C-d>", "<Esc>yP", { noremap = true, silent = true })

vim.keymap.set("i", "<C-d>", "<Esc>yypa", { noremap = true, silent = true })





