vim.opt.timeoutlen = 100
vim.opt.signcolumn = "yes"

vim.g.mapleader = " "
vim.g.noswapfile = true
vim.g.blamer_enabled = 1

-- TODO: remove or at least inspect this stuff
vim.o.undofile = true
vim.o.showcmd = true;
vim.o.showmatch = true;
vim.o.ignorecase = true;
vim.o.smartcase = true;
vim.o.cursorline = true;
vim.o.wrap = true;
vim.o.autoindent = true;
vim.o.copyindent = true;
vim.o.splitbelow = true;
vim.o.splitright = true;
vim.o.number = true;
vim.o.relativenumber = true;
vim.o.title = true;
vim.o.undofile = true;
vim.o.autoread = true;
vim.o.hidden = true;
vim.o.list = true;
vim.o.background = "dark";
vim.o.backspace = "indent,eol,start";
vim.o.undolevels = 1000000;
vim.o.undoreload = 1000000;
vim.o.foldmethod = "indent";
vim.o.foldnestmax = 10;
vim.o.foldlevel = 1;
vim.o.scrolloff = 3;
vim.o.sidescrolloff = 5;
vim.o.listchars = "tab:→→,trail:●,nbsp:○";
vim.o.clipboard = "unnamed,unnamedplus";
vim.o.formatoptions = "tcqj";
vim.o.encoding = "utf-8";
vim.o.fileencoding = "utf-8";
vim.o.fileencodings = "utf-8";
vim.o.bomb = true;
vim.o.binary = true;
vim.o.matchpairs = "(:),{:},[:],<:>";
vim.o.expandtab = true;
vim.o.wildmode = "list:longest,list:full";

-------------- Git --------------
require('gitsigns').setup { }
require('neogit').setup { }

------------- Leap ------------- 
require('leap').setup {
      case_insensitive = true,
      -- Leaving the appropriate list empty effectively disables "smart" mode,
      -- and forces auto-jump to be on or off.
      -- These keys are captured directly by the plugin at runtime.
      special_keys = {
        repeat_search = '<enter>',
        next_match    = '<enter>',
        prev_match    = '<tab>',
        next_group    = '<space>',
        prev_group    = '<tab>',
        eol           = '<space>',
      },
    }

    require('leap').init_highlight(true)

    -- Searching in all windows (including the current one) on the tab page:
    local function get_windows_on_tabpage()
      local t = {}
      local ids = string.gmatch(vim.fn.string(vim.fn.winlayout()), "%d+")
      for id in ids do t[#t + 1] = vim.fn.getwininfo(id)[1] end
      return t
    end
    function leap_all_windows()
      require('leap').leap { ['target-windows'] = get_windows_on_tabpage() }
    end

    -- Bidirectional search in the current window is just a specific case of the
    -- multi-window mode - set `target-windows` to a table containing the current
    -- window as the only element:
    function leap_bidirectional()
      require('leap').leap {
        ['target-windows'] = { vim.fn.getwininfo(vim.fn.win_getid())[1] }
      }
    end

    -- Map them to your preferred key, like:
    vim.keymap.set('n', 's', leap_all_windows, { silent = true })


------ 