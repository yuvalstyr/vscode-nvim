local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- remap leader key
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- yank to system clipboard
keymap({ "n", "v" }, "<leader>y", '"+y', opts)

-- paste from system clipboard
keymap({ "n", "v" }, "<leader>p", '"+p', opts)

-- paste preserves primal yanked piece
keymap("v", "p", '"_dP', opts)

-- move text up and down
keymap("v", "J", ":m .+1<CR>==", opts)
keymap("v", "K", ":m .-2<CR>==", opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- removes highlighting after escaping vim search
keymap("n", "<Esc>", "<Esc>:noh<CR>", opts)

-- call vscode commands from neovim
-- general keymaps
keymap({ "n", "v" }, "[e", "<cmd>lua require('vscode').action('editor.action.marker.prev')<CR>")
keymap({ "n", "v" }, "]e", "<cmd>lua require('vscode').action('editor.action.marker.next')<CR>")
keymap({ "n", "v" }, "gr", "<cmd>lua require('vscode').action('editor.action.goToReferences')<CR>")
keymap({ "n", "v" }, "ft", "<cmd>lua require('vscode').action('workbench.action.terminal.toggleTerminal')<CR>")
keymap({ "n", "v" }, "<leader>e", "<cmd>lua require('vscode').action('workbench.view.explorer')<CR>")
keymap({ "n", "v" }, "<leader>ca", "<cmd>lua require('vscode').action('editor.action.quickFix')<CR>")
keymap({ "n", "v" }, "<leader>cp", "<cmd>lua require('vscode').action('workbench.actions.view.problems')<CR>")
keymap({ "n", "v" }, "<leader>cn", "<cmd>lua require('vscode').action('notifications.clearAll')<CR>")
keymap({ "n", "v" }, "<leader><leader>", "<cmd>lua require('vscode').action('workbench.action.quickOpen')<CR>")
keymap({ "n", "v" }, "<leader>co", "<cmd>lua require('vscode').action('workbench.action.showCommands')<CR>")
keymap({ "n", "v" }, "<leader>ss", "<cmd>lua require('vscode').action('workbench.action.gotoSymbol')<CR>")
keymap({ "n", "v" }, "<leader>db", "<cmd>lua require('vscode').action('editor.debug.action.toggleBreakpoint')<CR>")
keymap({ "n", "v" }, "<leader>dr", "<cmd>lua require('vscode').action('code-runner.run')<CR>")

-- tabs
keymap({ "n", "v" }, "<leader>bs",
    "<cmd>lua require('vscode').action('workbench.action.quickOpenLeastRecentlyUsedEditorInGroup')<CR>")
keymap({ "n", "v" }, "<leader>bo", "<cmd>lua require('vscode').action('workbench.action.closeOtherEditors')<CR>")
keymap({ "n", "v" }, "<leader>bl", "<cmd>lua require('vscode').action('workbench.action.closeEditorsToTheRight')<CR>")
keymap({ "n", "v" }, "<leader>bd", "<cmd>lua require('vscode').action('workbench.action.closeActiveEditor')<CR>")
keymap({ "n", "v" }, "L", "<cmd>lua require('vscode').action('workbench.action.nextEditor')<CR>")
keymap({ "n", "v" }, "H", "<cmd>lua require('vscode').action('workbench.action.previousEditor')<CR>")

-- harpoon keymaps
keymap({ "n", "v" }, "<leader>hm", "<cmd>lua require('vscode').action('vscode-harpoon.addEditor')<CR>")
keymap({ "n", "v" }, "<leader>ha", "<cmd>lua require('vscode').action('vscode-harpoon.editorQuickPick')<CR>")
keymap({ "n", "v" }, "<leader>h1", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor1')<CR>")
keymap({ "n", "v" }, "<leader>h2", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor2')<CR>")
keymap({ "n", "v" }, "<leader>h3", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor3')<CR>")
keymap({ "n", "v" }, "<leader>h4", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor4')<CR>")

-- project manager keymaps
keymap({ "n", "v" }, "<leader>pa", "<cmd>lua require('vscode').action('projectManager.saveProject')<CR>")
keymap({ "n", "v" }, "<leader>fp", "<cmd>lua require('vscode').action('projectManager.listProjectsNewWindow')<CR>")
keymap({ "n", "v" }, "<leader>fo", "<cmd>lua require('vscode').action('workbench.action.quickSwitchWindow')<CR>")
keymap({ "n", "v" }, "<leader>pe", "<cmd>lua require('vscode').action('projectManager.editProjects')<CR>")

-- git keymaps
keymap({ "n", "v" }, "<leader>gg", "<cmd>lua require('vscode').action('lazygit-vscode.toggle')<CR>")
keymap({ "n", "v" }, "<leader>gh", "<cmd>lua require('vscode').action('git.revertSelectedRanges')<CR>")

local vscode = require('vscode')

local function hideSidebarAndPanel()
    vscode.call('workbench.action.closePanel')
    vscode.call('workbench.action.minimizeOtherEditorsHideSidebar')
end

vim.keymap.set({ "n", "x" }, "<C-h>", function()
    vscode.action("_ping", {
        callback = hideSidebarAndPanel })
end)
