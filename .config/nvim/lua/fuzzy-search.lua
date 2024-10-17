-- from https://www.chrisdeluca.me/2022/01/12/diy-neovim-fzy.html
local M = {}
M.FuzzySearch = function()
    local width = vim.o.columns - 4
    local height = 11
    if (vim.o.columns >= 85) then
        width = 80
    end
    -- we want the normal background
    vim.api.nvim_set_hl(0, 'NormalFloat', {
        link = 'Normal',
    })
    vim.api.nvim_open_win(
        vim.api.nvim_create_buf(false, true),
        true,
        {
            relative = 'editor',
            style = 'minimal',
            border = 'double',
            noautocmd = true,
            width = width,
            height = height,
            col = math.min((vim.o.columns - width) / 2),
            row = math.min((vim.o.lines - height) / 2 - 1),
        }
    )
    local file = vim.fn.tempname()
    vim.api.nvim_command('startinsert')
    -- fzf removed again, fzy is good enough
    -- vim.fn.termopen('fdfind -u -t f | fzf --reverse >' .. file, {on_exit = function()
    vim.fn.termopen('fdfind -u -t f | fzy >' .. file, {on_exit = function()
        vim.api.nvim_command('bdelete!')
        local f = io.open(file, 'r')
        local stdout = f:read('*all')
        f:close()
        os.remove(file)
        vim.api.nvim_command('edit ' .. stdout)
    end})
end
return M
