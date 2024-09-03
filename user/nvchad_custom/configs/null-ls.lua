local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")

local sources = {
	null_ls.builtins.formatting.stylua,
	null_ls.builtins.formatting.black,
	null_ls.builtins.formatting.prettier,
	null_ls.builtins.formatting.shfmt,
	null_ls.builtins.diagnostics.mypy,
	null_ls.builtins.diagnostics.ruff,
	null_ls.builtins.diagnostics.shellcheck,
	null_ls.builtins.diagnostics.zsh,
  null_ls.builtins.diagnostics.statix,
  null_ls.builtins.diagnostics.deadnix,
}

null_ls.setup({
	debug = true,
	sources = sources,
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({
				group = augroup,
				buffer = bufnr,
			})
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						bufnr = bufnr,
					})
				end,
			})
		end
	end,
})
