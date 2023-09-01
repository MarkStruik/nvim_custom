 local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
    vim.keymap.set('n', 'h',  api.node.navigate.parent_close,        opts('Close Directory'))
    vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
  end

return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local nvimtree = require("nvim-tree")

    -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- change color for arrows in tree to light blue
    vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

    -- configure nvim-tree
    nvimtree.setup({
      on_attach = my_on_attach,
      view = {
        width = 45,
      },
      -- change folder arrow icons
      renderer = {
        icons = {
          git_placement = "after",
          glyphs = {
            folder = {
              arrow_closed = "", -- arrow when folder is closed
              arrow_open = "", -- arrow when folder is open
            },
          },
        },
      },
      -- disable window_picker for
      -- explorer to work well with
      -- window splits
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        git_ignored = true,
        dotfiles = true,
        git_clean = false,
        no_buffer = false,
        custom = { ".git" },
        exclude = {  },
      },
      git = {
        ignore = true,
      },
    })

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>e", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
  end,
}
