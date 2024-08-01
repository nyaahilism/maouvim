local plugins = { "rktjmp/hotpot.nvim",
                     config = function ()
                     require("hotpot").setup({
                       provide_require_fennel = true,
                     })
                     end, }

require("lazy").setup({


 --                                      𛰫 EXT-lazy ）

 { "nvim-telescope/telescope.nvim",
    dependencies = { {'nvim-treesitter/nvim-treesitter'},
      {'tsakirist/telescope-lazy.nvim'},
      {'nvim-telescope/telescope-fzf-native.nvim'}, },
    cmd = "Telescope",
    opts = function()
    config = function(_, opts)
      local telescope = require "telescope"
      telescope.setup(opts)
      -- load extensions
      for _, ext in ipairs(opts.extensions_list) do
        telescope.load_extension(ext)
      end
    end
  end, },

{ "nvim-telescope/telescope-fzf-native.nvim", build = 'make' },

{ "tamton-aquib/nvim-market",
   import = "nvim-market.plugins",
   config = true, },

 --                               𛰫 neoXTEND ）
 { "lambdalisue/vim-suda" },


{ "theblob42/drex.nvim",
   lazy = false,
   dependencies = { {'nvim-tree/nvim-web-devicons'}, } },
   
{ "abcdefg233/rainbowcursor.nvim",
   lazy = false,
   cmd = { "RainbowCursor" },
   config = true,
   dependencies = {
    "abcdefg233/hcutil.nvim",
   },
},

{ "silentz/nvim.nocopy-paste" },

{ "shellRaining/hlchunk.nvim",
   event = { "BufReadPre", "BufNewFile" },
   config = function()
	 require("hlchunk").setup({
     chunk = {
		   enable = true,
			 chars = {
				 horizontal_line = "",
				 vertical_line = "│",
         left_top = "╭",
         left_bottom = "╰",
				 right_arrow = "🢖", }, --"󰑃 " "󰁔"  "🡪" "🡢" "" "⮚"  "⥇ " "🢒",
				 style = {"#62ffed", "#ff00bb", }, },
      indent = {
          enable = true,
          chars = { "┆", "│", },
          style = { "#a666ff", "#629eff", "#ff6694", }, },
			line_num = { style = { vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui"), }, },
	    blank = { enable = false }, })
 end, },

 --[[{ 'glacambre/firenvim',
    lazy = not vim.g.started_by_firenvim,
	  build = function()
		vim.fn["firenvim#install"](0)
	  end, }, ]]

{ 'mrcjkb/rustaceanvim',
  version = '^5', -- Recommended
  lazy = false, },

{ 'MeanderingProgrammer/markdown.nvim',
    main = "render-markdown",
    opts = {},
    name = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, }, -- if you prefer nvim-web-devicons },

 --                                𛰫 GLYcons ）

{ "nvim-tree/nvim-web-devicons" },

{ "adelarsq/vim-emoji-icon-theme" },

{ "yamatsum/nvim-nonicons",
   dependencies = { {'nvim-tree/nvim-web-devicons'}, } },

{ "mskelton/termicons.nvim",
   dependencies = { {'nvim-tree/nvim-web-devicons'}, } },

{ "2kabhishek/nerdy.nvim",
   cmd = 'Nerdy',
   dependencies = { {'stevearc/dressing.nvim'},
	   {'nvim-telescope/telescope.nvim'}, } },

--[[ { "rachartier/tiny-devicons-auto-colors.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    event = "VeryLazy",
    config = function()
        require('tiny-devicons-auto-colors').setup()
    end }, ]]

    --                                    𛰫 langVIM ）

{ "VonHeikemen/lsp-zero.nvim", 
	branch = 'v3.x',
	lazy = true,
  config = false,
  init = function()
    vim.g.lsp_zero_extend_cmp = 0
    vim.g.lsp_zero_extend_lspconfig = 0
	end, },

  -- lsp stuff
 { "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
    opts = function()
    config = function(_, opts)
      require("mason").setup(opts)
        vim.api.nvim_create_user_command("MasonInstallAll", function()
      end, {})
    end
  end, },

 { "neovim/nvim-lspconfig",
    event = "User FilePost",
    config = function()
    end,  },


  -- load luasnips + cmp related in insert mode only
 { "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = { { -- snippet plugin
        "L3MON4D3/LuaSnip",
        dependencies = { {'rafamadriz/friendly-snippets'},
        {'hrsh7th/cmp-path'},
	   {'hrsh7th/cmp-buffer'},
		 {'hrsh7th/cmp-cmdline'},
	   {'hrsh7th/cmp-nvim-lsp'},
		 {'L3MON4D3/LuaSnip'},
		 {'KadoBOT/cmp-plugins',
	     config = function()
			 require("cmp-plugins").setup({
			   files = { ".*\\.lua", "plugins.lua" }, })
			 end, },},
        opts = { history = true, updateevents = "TextChanged,TextChangedI" },
        config = function(_, opts)
          require("luasnip").config.set_config(opts)
        end, }, }, },

{ "ray-x/cmp-treesitter" },
{ "hrsh7th/cmp-nvim-lua" },
{ "amarakon/nvim-cmp-fonts" },
{ "chrisgrieser/cmp-nerdfont" },
{ "hrsh7th/cmp-emoji" },
{ "tamago324/cmp-zsh",
   dependencies = {'Shougo/deol.nvim'} },
{ "f3fora/cmp-spell" },
{ "dmitmel/cmp-cmdline-history" },
{ "PhilippFeo/cmp-help-tags" },

-- { "folke/neodev.nvim", opts = {} },

{ "folke/lua-dev.nvim" },

{ "folke/neoconf.nvim" },

{ "windwp/nvim-autopairs",
   event = "InsertEnter",
   config = true,
	 opts = {} },

{ "onsails/lspkind.nvim"},

{ "adoyle-h/lsp-toggle.nvim",
   config = function()
   require('lsp-toggle').setup{
     create_cmds = true,
     telescope = true, }
   end, },

 { "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },
  { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
  { -- optional completion source for require statements and module annotations
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      table.insert(opts.sources, {
        name = "lazydev",
        group_index = 0, -- set group index to 0 to skip loading LuaLS completions
      })
    end, },
  -- { "folke/neodev.nvim", enabled = false }, -- make sure to uninstall or disable neodev.nvim


 --                                𛰫 WIN.vim ）

{ "xiyaowong/transparent.nvim" },

 { "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    opts = function()
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
      end
    end,  },

{ "windwp/nvim-ts-autotag",
   config = function()
   require('nvim-ts-autotag').setup()
     filetypes = { "html", "markdown", "text", }
   end, },

--{ "nathom/filetype.nvim" },

--[[{ "RRethy/nvim-treesitter-endwise",
   config = function()
	 require('nvim.treesitter.configs')setup{
	 endwise = { enable = true, }, }
   end, },]]--

{ "folke/twilight.nvim",
  opts = { context = 16, } },

--[[{ "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
  -- you can enable a preset for easier configuration
    presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        long_message_to_split = true, -- long messages will be sent to a split
        --inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
    },
    cmdline = {
        view = "cmdline",
    },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
    },
}, ]]


 --                                    𛰫  neoTHEMES ）

{ "scottmckendry/cyberdream.nvim",
   lazy = false,
  -- priority = 1000,
     config = function()
     vim.cmd("colorscheme cyberdream")
     vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
     vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"})
     end, },

{ "nyoom-engineering/oxocarbon.nvim",
   lazy = false,
   priority = 1000,
     config = function()
     vim.opt.background = "dark"
     vim.cmd("colorscheme oxocarbon")
     vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
     vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"})
     end, },

{ "mrs4ndman/theme-selector.nvim",
   cmd = { "Themer" },
   dependencies = { "nvim-telescope/telescope.nvim" },
     config = function()
     require("theme-selector.colorschemes").list = {
       "oxocarbon",
       "cyberdream",
		   "dullahan",
			 "koalight",
			 "moonblue",
		   "lavender",
		   "dogrun",
			 "sweet-fusion",
			 "eldritch",
       "poimandres",
       "oh-lucy",}
     require("theme-selector")
     end, },

{ "EdenEast/nightfox.nvim" }, -- lazy

{ "Yazeed1s/oh-lucy.nvim",
    config = function()
      -- Lua
      vim.cmd[[colorscheme oh-lucy]] -- for oh-lucy
      vim.cmd[[colorscheme oh-lucy-evening]] -- for oh-lucy-evening
    end, },

{ 'olivercederborg/poimandres.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('poimandres').setup {}
  end,

  -- optionally set the colorscheme within lazy config
  init = function()
    vim.cmd("colorscheme poimandres")
  end },

{ "Koalhack/koalight.nvim",
	 lazy = false,
	 config = function()
	 vim.cmd.colorscheme("koalight")
	 end, },

{ "PunGrumpy/dullahan.nvim",
	 lazy = false,
   config = function()
	 vim.cmd.colorscheme("dullahan")
	 require("dullahan").setup({
		 transparent = false,
		 styles = {
				comments = { italic = true },
				keywords = { bold = true }, }, })
	 end, },

{ "mobj44/moonblue",
	  dependencies = { {"rktjmp/lush.nvim"} },
	 	name = "moonblue",
		lazy = false,
		config = function()
    vim.cmd.colorscheme("moonblue")
    end, },

{ url = "https://codeberg.org/jthvai/lavender.nvim",
    branch = "stable",
	  lazy = false,
	  config = function()
		vim.cmd.colorscheme("lavender")
	  end, },

{ "wadackel/vim-dogrun",
   lazy = false,
   config = function()
	 vim.cmd.colorscheme("dogrun")
   end, },

{ "DanielEliasib/sweet-fusion",
   name = 'sweet-fusion',
   lazy = false,
   config = function()
	 vim.cmd.colorscheme("sweet-fusion")
   end, },

{ "presindent/ethereal.nvim",
   lazy = false,
   opts = { transparent_background = true, },
   config = function(_, opts)
     vim.cmd.colorscheme("ethereal")
   end, },

{ "noorwachid/nvim-nightsky",
   lazy = false,
   config = function()
   vim.cmd.colorscheme("nightsky")
   end, },

{ "pauchiner/pastelnight.nvim",
   lazy = false,
   config = function()
     vim.cmd.colorscheme("pastelnight")
     vim.api.nvim_command [[colorscheme pastelnight]]
   end, },

{ "embark-theme/vim",
  name = "embark",
  lazy = false,
  config = function()
    vim.cmd.colorscheme("embark")
  end, },

{ "backdround/melting",
   lazy = false,
   config = function()
     require("melting").setup({})
     vim.cmd.colorscheme("melting")
   end, },

{ "tjdevries/colorbuddy.vim" },

{ "rktjmp/lush.nvim" },

{ "eldritch-theme/eldritch.nvim",
  lazy = false,
  config = function()
    vim.cmd.colorscheme("eldritch")
  end,
  opts = { transparent = true, }, },

{ "vague2k/huez.nvim",
    import = "huez-manager.import",
    branch = "stable",
    event = "UIEnter",
    config = function()
       require("huez").setup({
         theme_config_module="my.theme.directory",
         fallback = "eldritch", })
         local pickers = require("huez.pickers")

         vim.keymap.set("n", "<leader>co", pickers.themes, {})
         vim.keymap.set("n", "<leader>cof", pickers.favorites, {})
         vim.keymap.set("n", "<leader>col", pickers.live, {})
         vim.keymap.set("n", "<leader>coe", pickers.ensured, {})
         end, },


--                            𛰫 vimHELP

{ "zk-org/zk-nvim",
   config = function()
	 require("zk").setup({
     picker = "telescope",
		 lsp = {
			 config = {
				 cmd = { "zk", "lsp" },
				 name = "zk", },

			auto_attach = {
				enabled = true,
				filetypes = { "markdown", }, }, }, })
   end },

{ "sudormrfbin/cheatsheet.nvim",
   dependencies = { 
		 {"nvim-telescope/telescope.nvim"}, 
	   {"nvim-lua/popup.nvim"},
	   {"nvim-lua/plenary.nvim"}, } },

{ "fladson/vim-kitty" },

{ "elkowar/yuck.vim" },

{ "lambdalisue/suda.vim" },

})

 --                                      𛰫 NEOconfag ）

require("plugins.cyberdream")
require("plugins.icon-picker")
require("plugins.drex")
-- require("plugins.lsp_zero")
-- require("plugins.autoclose")
require("plugins.cmp")
require("plugins.telescope")
require("plugins.treesitter")
require("plugins.lspconfig")
require("plugins.luasnip")
require("plugins.mason")
-- require("plugins.noice")
