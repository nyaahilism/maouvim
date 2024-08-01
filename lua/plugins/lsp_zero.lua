local lsp_zero = require('lsp-zero')
lsp_zero.extend_lspconfig()

 lsp_zero.on_attach(function(client, bufnr)
   lsp_zero.default_keymaps({buffer = bufnr,
      preserve_mappings = false})
   local opts = {buffer = bufnr}

   vim.keymap.set({'n', 'x'}, 'gq', function()
     vim.lsp.buf.format({async = false, timeout_ms = 10000})
	 end, opts)
  end)

--[[ K : display hover information about symbol under cursor
	   gd: jumps to definition of symbol under cursor
	   gi: lists all implementations for the symbol under cursor
	   go: jumps to definition of type of symbol under cursor
	   gr: lists all references to symbol under cursor in quickfix window
	   gs: displays signature information about symbol under cursor flt. window
	 <F2>: renames all references to symbol under cursor
	 <F3>: format code in current buffer
	 <F4>: selects a code action available at cursor position
	   gl: show diagnostics in flt. window
		 [d: move to prev diagnostic in current buffer
		 ]d: move to next diagnostic
		 gq: format the current buffer using all active servers ]]

	lsp_zero.set_sign_icons({
		error = '',
		warn = '󱔁',
		hint = '󱗋',
		info = '󱆃', })

require("neodev").setup({})
require("neoconf").setup({
	local_settings = ".neoconf.json",
	live_reload = true,
	filetype_jsonc = true,
	plugins = { lspconfig = { enabled = true, },
              jsonls = { enabled = true,
							           configured_servers_only = true, },
						  lua_ls = { enabled_for_neovim_config = true,
						             enabled = false, }, }, })

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {'lua_ls'},
	handlers = {
		lsp_zero.default_setup,
    bashls = function()
	    require('lspconfig').bashls.setup({})
		 end,
	   lua_ls = function()
		   require('lspconfig').lua_ls.setup({}) 
			end, }, })

--[[ local cmp = require('cmp')

local has_words_before = function()
	 unpack = unpack or table.unpack
	 local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	 return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
 end

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local handlers = require('nvim-autopairs.completion.handlers')
cmp.event:on(
   'confirm_done',
    cmp_autopairs.on_confirm_done({
		  filetypes = {
				["*"] = {
					["("] = {
						kind = { cmp.lsp.CompletionItemKind.Function,
							       cmp.lsp.CompletionItemKind.Method, },
						handler = handlers["*"] } },
				    lua = {
						  ["("] = {
						    kind = { cmp.lsp.CompletionItemKind.Function,
												 cmp.lsp.CompletionItemKind.Method },
							handler = function(char, item, bufnr, rules, commit_character)
							end } },
						  tex = false } }) )

local cmp_action = require('lsp-zero').cmp_action()
local cmp_format = require('lsp-zero').cmp_format()

require('luasnip.loaders.from_vscode').lazy_load()

local lspkind = require('lspkind')


local kind_icons = {
	Text = "",
	Method = "",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "", }

cmp.setup({

 formatting = {
	 format = lspkind.cmp_format({
     mode = "symbol_text",
		 menu = ({
       nvim_lsp = "[LSP]",
		   buffer = "[Buffer]",
		   luasnip = "[luaSnip]",
		   treesitter = "[Treesitter]",
	     plugins = "[Plugins]",
	   	 nvim_lua = "[Lua]",
		   fonts	= "[Fonts]",  
		   nerdfont = "[Nerdfont]",
	     emoji = "[Emoji]",
	     zsh = "[ZSH]", }) }), },
	--[[ local custom_menu_icon = {
			   nvim_lsp = " ",
				 buffer = " ",
				 luasnip = " ",
				 treesitter = " ",
				 plugins = " ",
				 nvim_lua = " ",
				 fonts = " ",
				 nerdfont = " ",
				 emoji = " ",
				 zsh = " ", 

				 if entry.source.name == "" then
				   vim_item.kind = custom_menu_icon.calc
				 end

				 kind.menu = "   (" .. (strings[2] or "") .. ")"
				 return kind
			end,

 snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end, },

  completion = {
		completeopt = 'menu,menuone,noinsert', },

	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(), },
  
	mapping = cmp.mapping.preset.insert {
		['<C-j>'] = cmp.mapping.select_next_item(),  -- next suggestion
		['<C-k>'] = cmp.mapping.select_prev_item(),  -- previous suggestion
		['<C-b'] = cmp.mapping.scroll_docs(-4),      -- scroll backward
		['<C-f>'] = cmp.mapping.scroll_docs(4),      --  scroll forward
		['<C-Space>'] = cmp.mapping.complete(),      -- show completion suggestions
   	['<CR>'] = cmp.mapping({
			i = function(fallback)
			  if cmp.visible() and cmp.get_active_entry() then
			     cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
		    else
			    fallback()
	      end
	    end,
			s = cmp.mapping.confirm({ select = true }),
			c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }), }),
    ['<Tab>'] = cmp.mapping(function(fallback)
	 	  if cmp.visible() then
		    if #cmp.get_entries() == 1 then
		      cmp.confirm({ select = true })
        else
		      cmp.select_next_item()
		    end
		  elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
	    elseif has_words_before() then
		      cmp.complete()
        if #cmp.get_entries() == 1 then
		      cmp.confirm({ select = true })
		  end
		   else
		    fallback()
		   end
	   end, { "i", "s" }),
	['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
	      cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
	      luasnip.jump(-1)
      else
         fallback()
      end
    end, { "i", "s" }), },

	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'path' },
		{ name = 'buffer' },
		{ name = 'luasnip' },
		{ name = 'treesitter' },
		{ name = 'plugins' },
		{ name = 'nvim_lua' },
		{ name = 'fonts', option = { space_filter = "_" } },
	  { name = 'nerdfont' },
	  { name = 'emoji' },
	  { name = 'zsh' },
		{ name = 'spell' },
		{ name = 'cmdline_history' }, }) })

  for _, cmd_type in ipairs({':', '/', '?', '@'}) do
		cmp.setup.cmdline(cmd_type, {
			sources = { { name = 'cmdline_history' }, }, })
		end

  cmp.setup.cmdline('/', {
		view = { entries = {name = 'wildmenu', separator = '|'} },
		mapping = cmp.mapping.preset.cmdline(),
		sources = { { name = 'buffer' } } })

  cmp.setup.cmdline(':', {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({ { name = 'path' } },
		{ { name = 'cmdline' } }) })
--}),

	require'cmp_zsh'.setup { zshrc = true,
			filetypes = { "deoledit", "zsh" } }

 -- autopairs+

 local npairs = require('nvim-autopairs')
 local Rule = require('nvim-autopairs.rule')

 npairs.setup ({
	 check_ts = true,
	 ts_config = {
		 lua = {'string'},
		 javascript = {'template_string'},
		 java = false, }, })

 local ts_conds = require('nvim-autopairs.ts-conds')

 npairs.add_rules({
	 Rule("%", "%", "lua")
	   :with_pair(ts_conds.is_ts_node({'string','comment'})),
	 Rule("$", "$", "lua")
	   :with_pair(ts_conds.is_not_ts_node({'function'})) })
 local cond = require('nvim-autopairs.conds')

 local brackets = { { '(', ')' }, { '[', ']' }, { '{', '}' } }
 npairs.add_rules {
	 Rule(' ', ' ')
	  :with_pair(function(opts)
			local pair = opts.line:sub(opts.col - 1, opts.col)
			return vim.tbl_contains({
				brackets[1][1] .. brackets [1][2],
				brackets[2][1] .. brackets [2][2],
				brackets[3][1] .. brackets [3][2]
			 }, pair)
			end)
			:with_move(cond.none())
		  :with_cr(cond.none())
		  :with_del(function(opts)
			  local col = vim.api.nvim_win_get_cursor(0)[2]
			  local context = opts.line:sub(col -1, col + 2)
			  return vim.tbl_contains({
				  brackets[1][1] .. '  ' .. brackets[1][2],
				  brackets[2][1] .. '  ' .. brackets[2][2],
				  brackets[3][1] .. '  ' .. brackets[3][2]
				}, context)
				end) }
		 for _, bracket in pairs(brackets) do
	npairs.add_rules {
			Rule(bracket[1] .. ' ', ' ' .. bracket[2])
				  :with_pair(cond.none())
					:with_move(function(opts) return opts.char == bracket[2] end)
					:with_del(cond.none())
					:use_key(bracket[2])
					:replace_map_cr(function(_) return '<C-c>2xi<CR><C-c>0' end)
				} end

--[[	function rule2(a1,a2,lang)
		npairs.add_rule(
		  Rule(ins, ins, lang)
			  :with_pair(function(opts) return a1..a2 == opts.line:sub(opts.col - #a1, opts.col + #a2 - 1) end)
				:with_move(cond.none())
				:with_cr(cond.none())
				:with_del(function(opts)
					local col = vim.api.nvim_win_get_cursor(0)[2]
					return a1..ins..ins..a2 == opts.line:sub(col - #a1 - #ins + 1, col + #ins + #a2)
				end) 
				) end

			rule2('(','*',')','ocaml')
			rule2('(*',' ','*)','ocaml')
			rule2('(',' ',')') ]]

			--
			local g = vim.g

			g.lsp_zero_ui_float_border = 'rounded'

			-- EX
		-- :LspZeroViewConfigSource
		-- :LspZeroSetupServers
		-- :LspZeroFormat

