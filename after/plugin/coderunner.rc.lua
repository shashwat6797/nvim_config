require("code_runner").setup({
	mode = "float",
	float = {
		border = "rounded",
		blend = 0,
	},
	startinsert = true,
	-- put here the commands by filetype
	filetype = {
		java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
		python = "python3 $fileName ",
		typescript = "deno run",
		rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
		cpp = "g++ $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt",
		c = "gcc $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt",
		cs = "dotnet run",
	},
})
vim.keymap.set("n", "<leader>r", ":RunCode<CR>", { noremap = true, silent = false })
