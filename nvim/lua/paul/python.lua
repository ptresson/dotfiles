-- shamelessly copied from https://github.com/alexghergh/nvim-tmux-navigation/

local function tmux_command(command)
    local tmux_socket = vim.fn.split(vim.env.TMUX, ',')[1]
    return vim.fn.system("tmux -S " .. tmux_socket .. " " .. command)
end

-- this could work but there is a newline char 
-- at the end of the returned strings:

-- tmux_session = tmux_command("display-message -p '#S'")
-- tmux_window = tmux_command("display-message -p -F '#{window_index}'")
-- tmux_num_panes = tmux_command("display-message -p -F '#{window_panes}'")

function execute_python()

		session=vim.fn.system("echo -n $(tmux display-message -p '#S')")
		window=vim.fn.system("echo -n $(tmux display-message -p -F '#{window_index}')")
		num_panes=vim.fn.system("echo -n $(tmux display-message -p -F '#{window_panes}')")-1
		pane_mode=vim.fn.system("echo -n $(tmux display-message -p -t \""..session..":".. window.."."..num_panes.."\" '#{pane_in_mode}')")
		if pane_mode == "1" then
				clear_screen = "tmux send-keys -t \""..session..":".. window.."."..num_panes.."\" 'q' Enter"
				vim.fn.system(clear_screen)
		end

		filename = vim.fn.expand('%') 
		command_call = "tmux send-keys -t \""..session..":".. window.."."..num_panes.."\" 'python '"..filename.." Enter"
		vim.fn.system(command_call)

end

vim.keymap.set("n","<F9>", ":w <CR>:lua execute_python()<CR>")
vim.keymap.set("n","<ctrl-CR>", ":w <CR>:lua execute_python()<CR>")

vim.keymap.set("n","<leader>s", "osys.exit(1)<Esc>k")
vim.keymap.set({"n", "v"},"<leader>P", "yiwoprint(<Esc>pa)<Esc>")
vim.keymap.set({"n", "v"},"<leader>PL", "yiwoprint(len(<Esc>pa))<Esc>")
vim.keymap.set({"n", "v"},"<leader>PS", "yiwoprint(<Esc>pa.shape)<Esc>")
vim.keymap.set("n","<leader>pp", "oprint('pouet')<Esc>k")

-- command to add newline after commas and autoindent
-- see https://vim.fandom.com/wiki/Add_a_newline_after_given_patterns
-- extra backward slashes add to avoid escape sequences in lua
vim.keymap.set("n","<leader>,", ":s/\\((\\zs\\|, *\\zs\\|)\\)/\\r&/g|:'[,']normal ==<CR>")


-- Create a key mapping to find and jump to __main__ 
vim.keymap.set('n', '<leader>m', "/__main__<CR>")

-- replace train with test and vice versa
vim.keymap.set('n', '<leader>t', ":s/train/test/g<CR>")
vim.keymap.set('n', '<leader>T', ":s/test/train/g<CR>")
