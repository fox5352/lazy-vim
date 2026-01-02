function ColorMeImpressed()
  local colors = { "cyberdream", "rose-pine", "rose-pine-main", "rose-pine-moon", "rose-pine-dawn" }

  math.randomseed(os.time())
  local color = colors[math.random(1, #colors)]

  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
  { -- highloights colors automagicly
    "brenoprata10/nvim-highlight-colors",
    config = function()
      vim.opt.termguicolors = true

      require("nvim-highlight-colors").setup({
        ---Render style #fc7373
        ---@usage 'background'|'foreground'|'virtual'
        render = "background",
        enable_named_colors = true,
      })
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
  },
  {
    "kdheepak/monochrome.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "maxmx03/fluoromachine.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.keymap.set("n", "<leader>cmpf", function()
        local fm = require("fluoromachine")

        fm.setup({
          glow = true,
          theme = "fluoromachine",
          transparent = true,
        })

        vim.cmd.colorscheme("fluoromachine")
      end, { desc = "color me fluoromachine" })
      vim.keymap.set("n", "<leader>cmpm", function()
        vim.cmd.colorscheme("monochrome")
      end, { desc = "select high contrast color" })

      vim.keymap.set("n", "<leader>cmpr", function()
        ColorMeImpressed()
      end, { desc = "select a random color in the list" })

      ColorMeImpressed()
    end,
  },
}
