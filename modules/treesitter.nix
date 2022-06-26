{ pkgs, dsl, ... }:
with dsl; {
  plugins = with pkgs; [
    # commenting with treesiter
    comment-nvim
    # which method am I on
    vimPlugins.nvim-treesitter-context
    vimPlugins.nvim-treesitter-textobjects
    (pkgs.vimPlugins.nvim-treesitter.withPlugins
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
  ];

  use."nvim-treesitter.configs".setup = callWith {
    ensure_installed = [ "nix" "rust" "ocaml" "javascript" "typescript" ];
    highlight = {
      enable = true;
      use_languagetree = true;
      # TODO why?
      disable = [ "css" ];
    };
    incremental_selection = {
      enable = true;
      keymaps = {
        init_selection = "<C-n>";
        node_incremental = "<C-n>";
        scope_incremental = "<C-s>";
        node_decremental = "<C-p>";
      };
    };
    # indent.enable = true;
    rainbow = {
      enable = true;
      disable = [ "html" ];
      extended_mode = true;
      max_file_lines = 10000;
      colors = [
        "#bd93f9"
        "#6272a4"
        "#8be9fd"
        "#50fa7b"
        "#f1fa8c"
        "#ffb86c"
        "#ff5555"
      ];
    };
    textobjects = {
      select = {
        enable = true;
        lookahead = true;

        keymaps = {
          # functions
          "['tfo']" = "@function.outer";
          "['tfi']" = "@function.inner";
          # classes
          "['tco']" = "@class.outer";
          "['tci']" = "@class.inner";
          # boolean
          "['too']" = "@conditional.outer";
          "['toi']" = "@conditional.inner";
          # comment "useless"
          "['tuo']" = "@comment.outer";
          "['tui']" = "@comment.inner";
          # param
          "['tpo']" = "@param.outer";
          "['tpi']" = "@param.inner";
          # loop
          "['tlo']" = "@loop.outer";
          "['tli']" = "@loop.inner";
          # block
          "['tbo']" = "@block.outer";
          "['tbi']" = "@block.inner";
          # statement (expression, bad use of e, agreed)
          "['teo']" = "@statement.outer";
          "['tei']" = "@statement.inner";
        };
      };
      move = {
        enable = true;
        set_jumps = true; # whether to set jumps in the jumplist
        goto_next_start = {
          "['tmf']" = "@function.outer";
          "['tmc']" = "@class.outer";
          "['tmo']" = "@conditional.outer";
          "['tmu']" = "@comment.outer";
          "['tmp']" = "@param.outer";
          "['tml']" = "@loop.outer";
          "['tmb']" = "@block.outer";
          "['tms']" = "@statement.outer";
        };
        goto_next_end = {
          "['tmF']" = "@function.outer";
          "['tmC']" = "@class.outer";
          "['tmO']" = "@conditional.outer";
          "['tmU']" = "@comment.outer";
          "['tmP']" = "@param.outer";
          "['tmL']" = "@loop.outer";
          "['tmB']" = "@block.outer";
          "['tmS']" = "@statement.outer";
        };
        goto_previous_start = {
          "['tMf']" = "@function.outer";
          "['tMc']" = "@class.outer";
          "['tMo']" = "@conditional.outer";
          "['tMu']" = "@comment.outer";
          "['tMp']" = "@param.outer";
          "['tMl']" = "@loop.outer";
          "['tMb']" = "@block.outer";
          "['tMs']" = "@statement.outer";
        };
        goto_previous_end = {
          "['tMF']" = "@function.outer";
          "['tMC']" = "@class.outer";
          "['tMO']" = "@conditional.outer";
          "['tMU']" = "@comment.outer";
          "['tMP']" = "@param.outer";
          "['tML']" = "@loop.outer";
          "['tMB']" = "@block.outer";
          "['tMS']" = "@statement.outer";
        };
      };
      swap = {
        enable = true;
        swap_next = {
          "['tsf']" = "@function.outer";
          "['tsc']" = "@class.outer";
          "['tso']" = "@conditional.outer";
          "['tsu']" = "@comment.outer";
          "['tsp']" = "@param.outer";
          "['tsl']" = "@loop.outer";
          "['tsb']" = "@block.outer";
          "['tss']" = "@statement.outer";
        };
        swap_previous = {
          "['tSf']" = "@function.outer";
          "['tSc']" = "@class.outer";
          "['tSo']" = "@conditional.outer";
          "['tSu']" = "@comment.outer";
          "['tSp']" = "@param.outer";
          "['tSl']" = "@loop.outer";
          "['tSb']" = "@block.outer";
          "['tSs']" = "@statement.outer";
        };
      };
      lsp_interop = {
        enable = true;
        border = "none";
        peek_definition_code = {
          "['<leader>df']" = "@function.outer";
          "['<leader>dF']" = "@class.outer";
        };
      };
    };
    matchup.enable = true;
    autotag.enable = true;
  };
}
