return {
  "EdenEast/nightfox.nvim", -- Default options
  config = function()
    require("nightfox").setup({
      options = {
        -- Compiled file's destination location
        compile_path = vim.fn.stdpath("cache") .. "/nightfox",
        compile_file_suffix = "_compiled", -- Compiled file suffix
        transparent = false, -- Disable setting background
        terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
        dim_inactive = false, -- Non focused panes set to alternative background
        module_default = true, -- Default enable value for modules
        colorblind = {
          enable = false, -- Enable colorblind support
          simulate_only = false, -- Only show simulated colorblind colors and not diff shifted
          severity = {
            protan = 0, -- Severity [0,1] for protan (red)
            deutan = 0, -- Severity [0,1] for deutan (green)
            tritan = 0, -- Severity [0,1] for tritan (blue)
          },
        },
        styles = {
          comments = "italic",
          keywords = "bold",
          types = "italic,bold",
          conditionals = "NONE",
          constants = "NONE",
          functions = "NONE",
          numbers = "NONE",
          operators = "NONE",
          strings = "NONE",
          variables = "NONE",
        },
        inverse = { -- Inverse highlight for different types
          match_paren = false,
          visual = false,
          search = false,
        },
        modules = { -- List of various plugins and additional options
          -- ...
        },
      },
      palettes = {},
      specs = {},
      groups = {},
    })

    -- setup must be called before loading
    vim.cmd("colorscheme nordfox") -- nightfox, duskfox, nordfox, terafox, carbonfox, dayfox, dawnfox
  end,
}
