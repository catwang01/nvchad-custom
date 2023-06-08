local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",

     "mypy",
     "jedi-language-server",
     "pyright",

     "vim-language-server",
     "vint",

     "bash-debug-adapter",
     "bash-language-server",

     "csharp-language-server",
     "autoflake",
     "pylint"
  },
}

local function on_attach_nvim_tree(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
  vim.keymap.set('n', 'v',     api.node.open.vertical,              opts('Vertical Open'))
  vim.keymap.set('n', 'h',     api.node.open.horizontal,            opts('Horizontal Open'))
end

-- git support in nvimtree
M.nvimtree = {
  on_attach = on_attach_nvim_tree,
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
