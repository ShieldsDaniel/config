return {
  {
    "echasnovski/mini.nvim",
    enabled = true,
    config = function()
      require("mini.ai").setup()
      require("mini.comment").setup()
      require("mini.pairs").setup()
      require("mini.move").setup()
      require("mini.splitjoin").setup({
        mappings = {
          toggle = "<leader>sj"
        }
      })
      require("mini.surround").setup()
      require("mini.bracketed").setup()
      require("mini.jump").setup()
      require("config.plugins.mini.hipatterns")
      require("config.plugins.mini.basics")
    end,
  },
}
