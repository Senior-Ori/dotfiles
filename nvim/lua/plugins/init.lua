return {
  -- UI & Navigation
  { "nvim-lualine/lualine.nvim", config = true },
  { "nvim-tree/nvim-tree.lua", config = true },
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

  -- Git
  { "TimUntersberger/neogit", dependencies = { "nvim-lua/plenary.nvim" }, config = true },

  -- LSP and Tools
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim", config = true },
  { "williamboman/mason-lspconfig.nvim" },

  -- Completion
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip" },

  -- Syntax Highlighting
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
}
