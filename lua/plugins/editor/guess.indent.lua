return {
	{
		"NMAC427/guess-indent.nvim",
		opts = {},
		config = function(_, opts)
			require("guess-indent").setup(opts)
		end,
		event = "BufReadPre",
	},
}