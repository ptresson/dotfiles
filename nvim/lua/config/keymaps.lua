-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- shamelessly copied from https://github.com/alexghergh/nvim-tmux-navigation/
local function tmux_command(command)
  local tmux_socket = vim.fn.split(vim.env.TMUX, ",")[1]
  return vim.fn.system("tmux -S " .. tmux_socket .. " " .. command)
end

function execute_python()
  session = vim.fn.system("echo -n $(tmux display-message -p '#S')")
  window = vim.fn.system("echo -n $(tmux display-message -p -F '#{window_index}')")
  num_panes = vim.fn.system("echo -n $(tmux display-message -p -F '#{window_panes}')") - 1
  pane_mode = vim.fn.system(
    'echo -n $(tmux display-message -p -t "' .. session .. ":" .. window .. "." .. num_panes .. "\" '#{pane_in_mode}')"
  )
  if pane_mode == "1" then
    clear_screen = 'tmux send-keys -t "' .. session .. ":" .. window .. "." .. num_panes .. "\" 'q' Enter"
    vim.fn.system(clear_screen)
  end
  filename = vim.fn.expand("%")
  command_call = 'tmux send-keys -t "'
    .. session
    .. ":"
    .. window
    .. "."
    .. num_panes
    .. "\" 'python '"
    .. filename
    .. " Enter"
  vim.fn.system(command_call)
end

-- general keymaps
vim.keymap.set("n", "<CR>", ":", { desc = "Alternative mapping to command mode" })
vim.keymap.set("n", "<S-CR>", "o<esc>k", { desc = "Add blank line without exiting normal mode" })
vim.keymap.set("n", "<Tab>", ":bn<CR>", { desc = "next buffer" })
vim.keymap.set("n", "<S-Tab>", ":bp<CR>", { desc = "previous buffer" })
vim.keymap.set("n", "<leader>d", ":bd<CR>", { desc = "detach buffer" })

-- python keymaps
vim.keymap.set({ "n", "v" }, "<leader>p", "yoprint(<esc>pa)<esc>k", { desc = "Print under current line" })
vim.keymap.set({ "n", "v" }, "<leader>pp", "oprint('pouet')<esc>k", { desc = "Print 'pouet' under current line" })
vim.keymap.set({ "n", "v" }, "<leader>s", "osys.exit(1)<esc>k", { desc = "Add sys exit under current line" })
vim.keymap.set({ "n", "v" }, "<leader>pl", "yoprint(len(<Esc>pa))<Esc>", { desc = "Print length under current line" })
vim.keymap.set({ "n", "v" }, "<leader>ps", "yiwoprint(<esc>pa.shape)<esc>", { desc = "print shape under current line" })

vim.keymap.set("n", "<F9>", ":w <CR>:lua execute_python()<CR>")
vim.keymap.set("n", "<C-CR>", ":w <CR>:lua execute_python()<CR>")
-- extra backward slashes add to avoid escape sequences in lua
vim.keymap.set("n", "<leader>(", ":s/\\((\\zs\\|, *\\zs\\|)\\)/\\r&/g|:'[,']normal ==<CR>")

-- Create a key mapping to find and jump to __main__
vim.keymap.set("n", "<leader>m", "/__main__<CR>")
