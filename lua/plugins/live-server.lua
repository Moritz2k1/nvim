return {
	"barrettruth/live-server.nvim",
	-- Lazy load until one of these commands is used
	cmd = { "LiveServerStart", "LiveServerToggle", "LiveServerStop" },
	init = function()
		vim.g.live_server = {
			port = 8080,
			browser = false,
		}
	end,
}
