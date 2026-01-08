return {
  {
    "ThePrimeagen/harpoon",
    lazy = false,
    config = function()
      -- local harpoon = require('harpoon').setup()

      vim.keymap.set("n", "<leader>a", function()
        local harp = require("harpoon.mark")
        -- harpoon.ui:toggle_quick_menu(harpoon:list())
        harp.add_file()
      end)
      vim.keymap.set("n", "<C-e>", function()
        local harp = require("harpoon.ui")

        harp.toggle_quick_menu()
      end)
    end,
  },
}
