return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    {
      "<leader>a",
      function()
        require("harpoon"):list():add()
      end,
      desc = "Add file to harpoon",
    },
    {
      "<C-e>",
      function()
        local h = require("harpoon")
        h.ui:toggle_quick_menu(h:list())
      end,
      desc = "Harpoon quick menu",
    },
    {
      "<leader>1",
      function()
        require("harpoon"):list():select(1)
      end,
      desc = "Harpoon file 1",
    },
    {
      "<leader>2",
      function()
        require("harpoon"):list():select(2)
      end,
      desc = "Harpoon file 2",
    },
    {
      "<leader>3",
      function()
        require("harpoon"):list():select(3)
      end,
      desc = "Harpoon file 3",
    },
    {
      "<leader>4",
      function()
        require("harpoon"):list():select(4)
      end,
      desc = "Harpoon file 4",
    },
    {
      "<leader>hc",
      function()
        require("harpoon"):list():clear()
      end,
      desc = "Clear harpoon list",
    },
  },
  config = function()
    require("harpoon"):setup()
  end,
}
