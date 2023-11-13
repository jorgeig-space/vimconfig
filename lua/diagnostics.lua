local rightAlignFormatFunction = function(diagnostic) -- luacheck: ignore  
	local line = diagnostic.lnum  
	local lwidth = vim.api.nvim_get_option("columns")  
	local line_length = vim.fn.strdisplaywidth(vim.api.nvim_buf_get_lines(0, line, line + 1, false)[1] or "")  
	--local lwidth = vim.api.nvim_win_get_width(0)  
	--TODO: get width of the window  
	--local splen = string.rep(" ", 80 - line_length - #(diagnostic.message or ""))  
	--local splen = string.rep(" ", lwidth - line_length - string.len(diagnostic.message[1]) - 12)  
	local splen = string.rep(" ", lwidth - line_length - string.len(diagnostic.message[1] or "") - 8)  
	return string.format("%sr🔥%s", splen, diagnostic.message)  
end  

vim.diagnostic.config({  
	underline = true,  
	signs = true,  
	virtual_text = true,  
	-- virtual_text = { source = false, prefix = "", format = rightAlignFormatFunction, spacing = 0 },  
	float = {  
		show_header = true,  
		source = true,  
		border = border,  
		focus = false,  
		width = 60,  
	},  
	update_in_insert = false,
}) 

vim.api.nvim_set_keymap('n', '<C-e>', ':lua vim.diagnostic.open_float()<CR>', {})
vim.api.nvim_set_keymap('n', ']j', ':lua vim.diagnostic.goto_next()<CR>', {})
vim.api.nvim_set_keymap('n', ']k', ':lua vim.diagnostic.goto_prev()<CR>', {})
