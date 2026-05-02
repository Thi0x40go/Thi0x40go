local config = {
	name = "Tray Upload",
	priority = 2,
	builder = function()
		local current_file = vim.fn.expand("%:p:h")

		-- Encontra raiz do projeto (package.json) para o Gulp
		local function find_root(filename)
			local r = vim.fs.find(filename, { path = current_file, upward = true, stop = vim.env.HOME })
			if r and #r > 0 then
				return vim.fs.dirname(r[1])
			end
			return nil end

		local gulp_root = find_root("package.json") or vim.fn.getcwd()
		local tray_root = find_root("config.json") or gulp_root

		-- Detectar task do Gulp
		local function detect_gulp_task()
			local gulpfile = gulp_root .. "/gulpfile.js"
			local f = io.open(gulpfile, "r")

			if not f then
				return "default"
			end

			local content = f:read("*a")
			f:close()

			local priorities = { "build", "once" ,"sass", "css", "scss" }
			for _, task in ipairs(priorities) do
				if content:find("task%s*%(%s*['\"]" .. task .. "['\"]") or content:find("exports%." .. task .. "%s*=") then
					return task
				end
			end
			return "default"
		end

		local function detect_theme_name()
			local package_path = gulp_root .. "/package.json"
			local f = io.open(package_path, "r")

			if not f then
				return nil
			end

			local content = f:read("*a")
			f:close()

			local ok, json = pcall(vim.json.decode, content)
			if not ok or type(json) ~= "table" then
				return nil
			end

			return json.name
		end

		local theme_name = detect_theme_name()

		local mise_cmd
		if theme_name and theme_name:lower():find("aurora", 1, true) then
			mise_cmd = "mise use node"
		else
			mise_cmd = "mise x node@14.17.0 --"
		end

		local gulp_task = detect_gulp_task()

		local script = string.format(
			"cd %s && %s gulp %s && cd %s && tray upload 'js/min/* js/* css/*'",
			vim.fn.shellescape(gulp_root),
			mise_cmd,
			gulp_task,
			vim.fn.shellescape(tray_root)
		)

		return {
			name = "Gulp " .. gulp_task .. " + Tray",
			cmd = { "sh", "-c", script },
			components = {
				"on_exit_set_status",
				"on_complete_notify",
				"on_complete_dispose",
			},
			params = {
				task = { type = "string", default = gulp_task, optional = true },
			},
		}
	end,
	condition = {
		callback = function()
			local root = vim.fs.find("config.json", { path = vim.fn.expand("%:p:h"), upward = true })
			return #root > 0
		end,
	},
}

return config
