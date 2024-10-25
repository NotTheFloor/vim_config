function comment_visual_mode()
    local filetype = vim.bo.filetype
    local comment_token = "# "

    if filetype == "lua" or filetype == "sql" then
        comment_token = "-- "
    elseif filetype == "javascript" or filetype == "typescript" or filetype == "cpp" or filetype == "c" then
        comment_token = "// "
    end

    local start_line = vim.fn.getpos("'<")[2]
    local end_line = vim.fn.getpos("'>")[2]


    for line = start_line, end_line do
        local current_line = vim.fn.getline(line)
        local trimmed_line = current_line:match("^%s*")
        local line_content = current_line:sub(#trimmed_line + 1)

        if line_content:sub(1, #comment_token) == comment_token then
            vim.fn.setline(line, trimmed_line .. line_content:sub(#comment_token + 1))
        else
            vim.fn.setline(line, trimmed_line .. comment_token .. line_content)
        end
    end
end

function comment_current_line()
    local filetype = vim.bo.filetype
    local comment_token = "# "

    if filetype == "lua" or filetype == "sql" then
        comment_token = "-- "
    elseif filetype == "javascript" or filetype == "typescript" or filetype == "cpp" or filetype == "c" then
        comment_token = "// "
    end

    local start_line = vim.fn.getpos("'<")[2]
    local end_line = vim.fn.getpos("'>")[2]


    local current_line = vim.fn.getline(".")
    local trimmed_line = current_line:match("^%s*")
    local line_content = current_line:sub(#trimmed_line + 1)

    if line_content:sub(1, #comment_token) == comment_token then
        vim.fn.setline(".", trimmed_line .. line_content:sub(#comment_token + 1))
    else
        vim.fn.setline(".", trimmed_line .. comment_token .. line_content)
    end
end

vim.api.nvim_set_keymap("v", "<leader>/", ":lua comment_visual_mode()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>/", ":lua comment_current_line()<CR>", { noremap = true, silent = true })
