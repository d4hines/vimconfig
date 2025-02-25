{ pkgs, dsl, ... }:
with dsl;
let
  cmd = command: desc: [ "<cmd>${command}<cr>" desc ];
in
{
  # hello  TODO: asdf
  plugins = with pkgs; [
    # command discover
    which-key
    legendary

    # Git
    vimPlugins.neogit
    blamer-nvim
    vimPlugins.diffview-nvim
    vimPlugins.gitsigns-nvim

    # motion
    vimPlugins.repeat
    leap

    # commenting with treesiter
    comment-nvim
    # which method am I on
    vimPlugins.nvim-treesitter-context
    vimPlugins.nvim-treesitter-textobjects
    (vimPlugins.nvim-treesitter.withPlugins
      # tree sitter with language support
      (plugins:
        with plugins; [
          tree-sitter-nix
          tree-sitter-json
          tree-sitter-c
          tree-sitter-go
          tree-sitter-bash
          tree-sitter-javascript
          tree-sitter-typescript
          tree-sitter-ocaml
          tree-sitter-rust
        ]))
    # auto open/close html tags with treesitter
    vimPlugins.nvim-ts-autotag
    # highlighted parens
    vimPlugins.nvim-ts-rainbow
    # toggle btwn all the things with %
    vimPlugins.vim-matchup

    # aesthetics
    one_monokai
    vimPlugins.lualine-nvim
    vimPlugins.tabline-nvim
    vimPlugins.nvim-web-devicons   
    todo-comments
  ];

  lua = builtins.readFile ./init.lua;

  # use.which-key.register = dsl.callWith {};
  #   "K" = [ "<cmd>lua show_documentation()<CR>" "Get Type Information" ];
  #   "['<leader>']" = {
  #     name = "+leader_bindings";
  #     D = cmd "lua vim.lsp.buf.declaration()" "Jump to Declaration";
  #     d = cmd "lua vim.lsp.buf.definition()" "Jump to Definition";
  #     i = cmd "lua vim.lsp.buf.implementation()" "Jump to Implementation";
  #     s = cmd "lua vim.lsp.buf.signature_help()" "Get function signature";

  #     "k" = [ "<cmd>lua vim.lsp.buf.type_definition()<CR>" "Get type definition" ];
  #     "rn" = [ "<cmd>lua vim.lsp.buf.rename()<CR>" "Rename function/variable" ];
  #     "ca" = [ "<cmd>lua vim.lsp.buf.code_action()<CR>" "Perform code action" ];
  #     "r" = [
  #       "<cmd>lua vim.lsp.buf.references()<CR>"
  #       "Get function/variable refs"
  #     ];
  #     "e" = [
  #       "<cmd>lua vim.diagnostic.open_float()<CR>"
  #       "Get lsp errors"
  #     ];
  #     "dn" = [
  #       "<cmd>lua vim.diagnostic.goto_next()<CR>"
  #       "next diag"
  #     ];
  #     "dp" = [
  #       "<cmd>lua vim.diagnostic.goto_prev()<CR>"
  #       "prev diag"
  #     ];
  #     "mb" = [ ":VimtexCompile<CR>" "build latex buffer" ];
  #     "f" = [ "<cmd>lua vim.lsp.buf.formatting()<CR>" "Format buffer" ];
  #     "bb" = [ "<cmd>Telescope buffers<cr>" "Get buffer list" ];
  #     "fb" = [ "<cmd>Telescope file_browser<cr>" "Get buffer list" ];
  #     "gg" = [ "<cmd>Telescope live_grep<cr>" "Fzf fuzzy search" ];
  #     "['<leader>']" = [ "<cmd>Telescope find_files<cr>" "search files" ];
  #     "ws" = [ "<cmd>sp<cr>" "Split window horizontally" ];
  #     "wv" = [ "<cmd>vs<cr>" "Split window vertically" ];
  #     "bd" = [ "<cmd>q<cr>" "Delete buffer" ];
  #     "bn" = [ "<cmd>bnext<cr>" "Next buffer" ];
  #     "bp" = [ "<cmd>bprev<cr>" "Previous buffer" ];
  #     "bN" = [ "<cmd>tabedit<cr>" "New buffer/tab" ];
  #     "bD" = [ "<cmd>Bclose!<cr>" "Delete buffer aggressively" ];
  #     "wd" = [ "<cmd>q<cr>" "Delete window" ];
  #     "wl" = [ "<cmd>wincmd l<cr>" "Move window right" ];
  #     "wj" = [ "<cmd>wincmd j<cr>" "Move window down" ];
  #     "wk" = [ "<cmd>wincmd k<cr>" "Move window up" ];
  #     "wh" = [ "<cmd>wincmd h<cr>" "Move window left" ];
  #     "gs" =
  #       [ "<cmd>lua require('neogit').open()<CR>" "Open neogit (magit clone)" ];
  #     "gb" = [ "<cmd>BlamerToggle<CR>" "Toggle git blame" ];
  #     "gc" = [ "<cmd>Neogen<CR>" "generate comments boilerplate" ];

  #     "l" = [ "<cmd>Telescope resume<CR>" "last telescope query" ];

  #     "gf" = [
  #       "<cmd>lua require('telescope.builtins').live_grep {default_text='function'}<CR>"
  #       "grep for functions only"
  #     ];
  #     "hs" = [ "<cmd>Gitsigns preview_hunk<CR>" "preview hunk" ];
  #     "hn" = [ "<cmd>Gitsigns next_hunk<CR>" "next hunk" ];
  #     "hp" = [ "<cmd>Gitsigns prev_hunk<CR>" "prev hunk" ];

  #     "rm" = [
  #       "<cmd>lua require'rust-tools.expand_macro'.expand_macro()<CR>"
  #       "Expand macro"
  #     ];
  #     "rh" = [
  #       "cmd lua require('rust-tools.inlay_hints').toggle_inlay_hints()<CR>"
  #       "toggle inlay type hints"
  #     ];
  #     "rpm" = [
  #       "cmd lua require'rust-tools.parent_module'.parent_module()<CR>"
  #       "go to parent module"
  #     ];
  #     "rJ" = [
  #       "cmd lua require'rust-tools.join_lines'.join_lines()<CR>"
  #       "join lines rust"
  #     ];
  #     "cu" = [ "lua require('crates').update_crate()" "update a crate" ];
  #     "cua" =
  #       [ "lua require('crates').update_all_crates()" "update all crates" ];
  #     "cU" = [ "lua require('crates').upgrade_crate()" "upgrade a crate" ];
  #     "cUa" =
  #       [ "lua require('crates').upgrade_all_crates()" "upgrade all crates" ];
  #   };
  # };
  # use.which-key.setup = callWith { };
}
