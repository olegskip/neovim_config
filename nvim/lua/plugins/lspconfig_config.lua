local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
	return
end

vim.diagnostic.config {
	virtual_text = true,
	virtual_lines = true,
	update_in_insert = true
}

-- default
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap=true, silent=true, buffer=bufnr }
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set('n', '<space>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
	vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
	vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end
--

-- Always show the signcolumn, otherwise it would shift the text each time diagnostics appear/become resolved.
vim.opt.signcolumn = "yes"

local capabilities = nil
local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if ok then
	local capabilities = require('cmp_nvim_lsp').default_capabilities()
end

if executable('ccls') then
	lspconfig.ccls.setup({
        capabilities = (function()
            -- It fixes duplicates like subprocess imported but not used from Ruff and "subprocess" is not accessed by removing Pyright's ones while still benefiting from its type diagnostics.
            -- https://github.com/astral-sh/ruff-lsp/issues/384
            local local_capabilities = vim.lsp.protocol.make_client_capabilities()
            local_capabilities.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }
            return local_capabilities
        end)(),
		on_attach = on_attach
	})
end

if executable('pyright') then
	lspconfig.pyright.setup({
		capabilities = capabilities,
		on_attach = on_attach,
        settings = {
            python = {
                analysis = {
                    -- Ignore all files for analysis to exclusively use Ruff for linting
                    ignore = { '*' },
                }
            }
        }
	})
end

if executable('ruff') then
	lspconfig.ruff_lsp.setup({
		capabilities = capabilities,
		on_attach = on_attach,
        init_options = {
            settings = {
                preview=True
            }
        }
	})
end

if executable('rust-analyzer') then
	lspconfig.rust_analyzer.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		checkOnSave = {
			command = "clippy",
		},
	})
end
if executable('haskell-language-server') then
	lspconfig.hls.setup{
		capabilities = capabilities,
		on_attach = on_attach
	}
end

-- Disable lsp-lines in insert mode for some languages(rust)
local lsp_lines_helper = vim.api.nvim_create_augroup('LspLinesHelper', {})
local lsp_virtual_text_status = vim.diagnostic.config().virtual_text
local lsp_virtual_lines_status = vim.diagnostic.config().virtual_lines
local lsp_lines_helper_pattern = {"*.rs"} 
vim.api.nvim_create_autocmd('InsertEnter', {
	group = lsp_lines_helper,
	pattern = lsp_lines_helper_pattern,
	callback = function()
		vim.diagnostic.config {
			virtual_text = false,
			virtual_lines = false,
		}
		-- To update cursor position
		vim.cmd [[ normal "hl" ]]
	end
})
vim.api.nvim_create_autocmd('InsertLeave', {
	group = lsp_lines_helper,
	pattern = lsp_lines_helper_pattern,
	callback = function()
		vim.diagnostic.config {
			virtual_text = lsp_virtual_text_status,
			virtual_lines = lsp_virtual_lines_status,
		}
	end
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
})
