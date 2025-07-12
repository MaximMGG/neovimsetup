vim.cmd.colorscheme("unokai")
vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
vim.api.nvim_set_hl(0, "NormalNC", {bg = "none"})
vim.api.nvim_set_hl(0, "EndOfBuffer", {bg = "none"})

-- Basic settingns
vim.opt.number = true					-- Line numbers
vim.opt.relativenumber = true			-- Relative line numbers
vim.opt.cursorline = true				-- Highlight current line
vim.opt.wrap = false					-- Don't wrap lines
vim.opt.scrolloff = 10					-- Keep 10 lines above/below cursor
vim.opt.sidescrolloff = 8				-- Keep 8 columns left/right of cursor

-- Indetation
vim.opt.tabstop = 4						-- Tab width
vim.opt.shiftwidth = 4					-- Indent width
vim.opt.softtabstop = 4					-- Soft tab stop
vim.opt.expandtab = true				-- Use spaces instead of tabs
vim.opt.smartindent = true				-- Smart auto-indenting
vim.opt.autoindent = true               -- Copy indent from current line


-- Search settings
vim.opt.ignorecase = true               -- Case insensitive search
vim.opt.smartcase = true                -- Case sensitive if uppercase in search
vim.opt.hlsearch = false                -- Don't highlight search results
vim.opt.incsearch = true                -- Show matches as you type

-- Visual settings
vim.opt.termguicolors = true            -- Enable 24-bit color
vim.opt.signcolumn = "yes"              -- Always show sign colums 
vim.opt.colorcolumn = "100"             -- Show column at 100 characters
vim.opt.showmatch = false                -- Hightligt matching brackts
vim.opt.matchtime = 2                   -- How long to show matching bracket
vim.opt.cmdheight = 1                   -- Command line height
vim.opt.completeopt = "menuone,noinsert,noselect" -- Completion options
vim.opt.showmode = false                -- Don't show mode in command line
vim.opt.pumheight = 10                  -- Popup menu height
vim.opt.pumblend = 10                   -- Popup menu transparency
vim.opt.winblend = 0                    -- Floting window transparency
vim.opt.conceallevel = 0                -- Don't hide markup
vim.opt.concealcursor = ""              -- Don't hide cursor line markup
vim.opt.lazyredraw = true               -- Don't readraw during macros
vim.opt.synmaxcol = 300                 -- Syntax highlighting limint

-- File handling
vim.opt.backup = false                  -- Don't create backup files
vim.opt.writebackup = false             -- Don't create backup before writing
vim.opt.swapfile = false                -- Don't create swap files
vim.opt.undofile = true                 -- Persistent undo
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")   -- Undo directory
vim.opt.updatetime = 300                -- Faster completion
vim.opt.timeoutlen = 500                -- Key timeout duration
vim.opt.ttimeoutlen = 0                 -- Key code timout
vim.opt.autoread = true                 -- Auto reload files changed outside vim

-- Behavior settings
vim.opt.hidden = true                   -- Allow hidden buffers
vim.opt.errorbells = false              -- No error bells
vim.opt.backspace = "indent,eol,start"  -- Better backspace behavior
vim.opt.autochdir = false               -- Don't auto change directory
vim.opt.iskeyword:append("-")           -- Treat dash as aprt of word
vim.opt.path:append("**")               -- Include subdirectories in search
vim.opt.selection = "exclusive"         -- Selection behavior
vim.opt.mouse = "a"                     -- Enable mouse support
vim.opt.clipboard:append("unnamedplus") -- Use system clipcboar
vim.opt.modifiable = true               -- Allow buffer modification
vim.opt.encoding = "UTF-8"              -- Set encoding

-- Cursor settings
vim.opt.guicursor = "n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"


-- Y to EOL
vim.keymap.set("n", "Y", "y$", {desc = "Yank to end line line"})

-- Center screen when jumping
vim.keymap.set("n", "n", "nzzzv", {desc = "Next search result (centerd)"})
vim.keymap.set("n", "N", "Nzzzv", {desc = "Previous search result (centered)"})
vim.keymap.set("n", "<C-d>", "<C-d>zz", {desc = "Half page down (centered)"})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {desc = "Half page up (centered)"})

-- Key mapping
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Buffer navigation
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", {desc = "Next buffer"})
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", {desc = "Previous buffer"})
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", {desc = "Delete buffer"})

-- Splitting & Resizeing
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", {desc = "Split window vertically"})
vim.keymap.set("n", "<leader>sh", ":split<CR>", {desc = "Split window horizontally"})
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", {desc = "Increase window height"})
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", {desc = "Decrease window height"})
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", {desc = "Decrease window width"})
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", {desc = "Increase window width"})

-- Better window navigation
vim.keymap.set("n", "<C-l>", "<C-w>l", {desc = "Move to left window"})
vim.keymap.set("n", "<C-h>", "<C-w>h", {desc = "Move to right window"})
vim.keymap.set("n", "<C-k>", "<C-w>k", {desc = "Move to up window"})
vim.keymap.set("n", "<C-j>", "<C-w>j", {desc = "Move to down window"})

-- Move lines up/donw
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", {desc = "Move line down"})
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", {desc = "Move line up"})
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", {desc = "Move selection down"})
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", {desc = "Move selection up"})

-- Better indenting in visual mode
vim.keymap.set("v", "<", "<gv", {desc = "Indent left and reselect"})
vim.keymap.set("v", ">", ">gv", {desc = "Indent right and reselect"})

-- Quick file navigation
vim.keymap.set("n", "<leader>e", ":Explore<CR>", {desc = "Open file explorer"})
vim.keymap.set("n", "<leader>ff", ":find ", {desc = "Find file"})

-- Basic autocommands
local augroup = vim.api.nvim_create_augroup("UserConfig", {})

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
    group = augroup,
    callback = function()
        vim.highlight.on_yank()
    end,
})




-- Floating terminal


-- terminal
local terminal_state = {
    buf = nil,
    win = nil,
    is_open = false
}

local function FloatingTerminal()
    if terminal_state.is_open and vim.api.nvim_win_is_valid(terminal_state.win) then
        vim.api.nvim_win_close(terminal_state.win, false)
        terminal_state.is_open = false
        return
    end

    if not terminal_state.buf or not vim.api.nvim_buf_is_valid(terminal_state.buf) then
        terminal_state.buf = vim.api.nvim_create_buf(false, true)
        vim.api.nvim_buf_set_option(terminal_state.buf, 'bufhidden', 'hide')
    end

    local width = math.floor(vim.o.columns * 0.8)
    local height = math.floor(vim.o.lines * 0.8)
    local row = math.floor((vim.o.lines - height) / 2)
    local col = math.floor((vim.o.columns - width) / 2)

-- Create the floating window
    terminal_state.win = vim.api.nvim_open_win(terminal_state.buf, true, {
        relative = 'editor',
        width = width,
        height = height,
        row = row,
        col = col,
        style = 'minimal',
        border = 'rounded'
    })

    -- Set transparency from the floating window
    vim.api.nvim_win_set_option(terminal_state.win, 'winblend', 0)

    -- Set transparent background for the window
    vim.api.nvim_win_set_option(terminal_state.win, 'winhighlight',
        'Normal:FloatingTermNormal,FloatBorder:FloatingTermBorder')


    -- Define highlight groups for transparency
    vim.api.nvim_set_hl(0, "FloatingTermNormal", {bg = "none"})
    vim.api.nvim_set_hl(0, "FloatingTermBorder", {bg = "none"})

    --  Start terminal if not already running
    local has_terminal = false
    local lines = vim.api.nvim_buf_get_lines(terminal_state.buf, 0, -1, false)
    for _, line in ipairs(lines) do
        if line ~= "" then
            has_terminal = true
            break
        end
    end

    if not has_terminal then
        vim.fn.termopen(os.getenv("SHELL"))
    end

    terminal_state.is_open = true
    vim.cmd("startinsert")

    -- Set up auto-close on buffer leave
    vim.api.nvim_create_autocmd("BufLeave", {
        buffer = terminal_state.buf,
        callback = function()
            if terminal_state.is_open and vim.api.nvim_win_is_valid(terminal_state.win) then
                vim.api.nvim_win_close(terminal_state.win, false)
                terminal_state.is_open = false
            end
        end,
        once = true
    })
end

-- Function to wxplicitly close the terminal
local function CloseFloatingTerminal()
    if terminal_state.is_open and vim.api.nvim_win_is_valid(terminal_state.win) then
        vim.api.nvim_win_close(terminal_state.win, false)
        terminal_state.is_open = false
    end
end

-- Key mappings
vim.keymap.set("n", "<leader>t", FloatingTerminal, {noremap = true, silent = true, desc = "Toggle floating terminal"})
vim.keymap.set("t", "<Esc>", function()
    if terminal_state.is_open then
        vim.api.nvim_win_close(terminal_state.win, false)
        terminal_state.is_open = false
    end
end, { noremap = true, silent = true, desc = "Close floating terminal from terminal node"})

