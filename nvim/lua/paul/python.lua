-- shamelessly copied from https://github.com/alexghergh/nvim-tmux-navigation/

-- local function tmux_command(command)
--     local tmux_socket = vim.fn.split(vim.env.TMUX, ',')[1]
--     return vim.fn.system("tmux -S " .. tmux_socket .. " " .. command)
-- end

-- this could work but there is a newline char 
-- at the end of the returned strings:

-- tmux_session = tmux_command("display-message -p '#S'")
-- tmux_window = tmux_command("display-message -p -F '#{window_index}'")
-- tmux_num_panes = tmux_command("display-message -p -F '#{window_panes}'")

function ExecutePython()

		local session=vim.fn.system("echo -n $(tmux display-message -p '#S')")
		local window=vim.fn.system("echo -n $(tmux display-message -p -F '#{window_index}')")
		local num_panes=vim.fn.system("echo -n $(tmux display-message -p -F '#{window_panes}')")-1
		local pane_mode=vim.fn.system("echo -n $(tmux display-message -p -t \""..session..":".. window.."."..num_panes.."\" '#{pane_in_mode}')")
		if pane_mode == "1" then
				local clear_screen = "tmux send-keys -t \""..session..":".. window.."."..num_panes.."\" 'q' Enter"
				vim.fn.system(clear_screen)
		end

		local filename = vim.fn.expand('%')
		local command_call = "tmux send-keys -t \""..session..":".. window.."."..num_panes.."\" 'python '"..filename.." Enter"
        vim.cmd(":w")
		vim.fn.system(command_call)

end

function ExecuteTests()

		local session=vim.fn.system("echo -n $(tmux display-message -p '#S')")
		local window=vim.fn.system("echo -n $(tmux display-message -p -F '#{window_index}')")
		local num_panes=vim.fn.system("echo -n $(tmux display-message -p -F '#{window_panes}')")-1
		local pane_mode=vim.fn.system("echo -n $(tmux display-message -p -t \""..session..":".. window.."."..num_panes.."\" '#{pane_in_mode}')")
		if pane_mode == "1" then
				local clear_screen = "tmux send-keys -t \""..session..":".. window.."."..num_panes.."\" 'q' Enter"
				vim.fn.system(clear_screen)
		end

		local command_call = "tmux send-keys -t \""..session..":".. window.."."..num_panes.."\" 'pytest -m \"not slow\" tests/'".." Enter"
        vim.cmd(":w")
		vim.fn.system(command_call)

end

function ExecuteFullTests()

		local session=vim.fn.system("echo -n $(tmux display-message -p '#S')")
		local window=vim.fn.system("echo -n $(tmux display-message -p -F '#{window_index}')")
		local num_panes=vim.fn.system("echo -n $(tmux display-message -p -F '#{window_panes}')")-1
		local pane_mode=vim.fn.system("echo -n $(tmux display-message -p -t \""..session..":".. window.."."..num_panes.."\" '#{pane_in_mode}')")
		if pane_mode == "1" then
				local clear_screen = "tmux send-keys -t \""..session..":".. window.."."..num_panes.."\" 'q' Enter"
				vim.fn.system(clear_screen)
		end

		local command_call = "tmux send-keys -t \""..session..":".. window.."."..num_panes.."\" 'pytest tests/'".." Enter"
        vim.cmd(":w")
		vim.fn.system(command_call)

end

vim.keymap.set("n","<F9>", ":lua ExecutePython()<CR>",{silent=true})
vim.keymap.set("n","<C-CR>", ":lua ExecutePython()<CR>",{silent=true})
vim.keymap.set("n","<leader><CR>", ":lua ExecutePython()<CR>",{silent=true})

vim.keymap.set("n","<F10>", ":lua ExecuteTests()<CR>",{silent=true})
vim.keymap.set("n","<leader><F10>", ":lua ExecuteFullTests()<CR>",{silent=true})

vim.keymap.set("n","<leader>s", "osys.exit(1)<Esc>k")
vim.keymap.set("n","<leader>P", "yiwoprint(<Esc>pa)<Esc>")
vim.keymap.set("v","<leader>P", "yoprint(<Esc>pa)<Esc>")
vim.keymap.set("n","<leader>PL", "yiwoprint(len(<Esc>pa))<Esc>")
vim.keymap.set("v","<leader>PL", "yoprint(len(<Esc>pa))<Esc>")
vim.keymap.set("n","<leader>PS", "yiwoprint(<Esc>pa.shape)<Esc>")
vim.keymap.set("v","<leader>PS", "yoprint(<Esc>pa.shape)<Esc>")
vim.keymap.set("n","<leader>PH", "yiwoprint(<Esc>pa.head())<Esc>")
vim.keymap.set("v","<leader>PH", "yoprint(<Esc>pa.head())<Esc>")
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
