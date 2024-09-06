local keys = {
  {
    "<leader>kg",
    function()
      local Terminal = require("toggleterm.terminal").Terminal
      local lazygit = Terminal:new({
        cmd = "lazygit",
        direction = "float",
        hidden = true,
      })

      lazygit:toggle()
    end,
    desc = "Open Lazygit (Toggleterm)",
  },
  {
    "<leader>kk",
    "<Cmd>ToggleTerm direction=float<CR>",
    desc = "Open Float Toggleterm",
  },
  {
    "<leader>kh",
    function()
      local Terminal = require("toggleterm.terminal").Terminal
      local hcmd = Terminal:new({
        direction = "horizontal",
        hidden = true,
      })
      hcmd:toggle()
    end,
    desc = "Open Horizontal Toggleterm",
  },
}
return keys
