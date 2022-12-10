local utils = require 'mp.utils'

function find_and_add_entries()
	local default_subtitle_paths = {""}
	local path = mp.get_property("path", "")
	local dir, filename = utils.split_path(path)
	local subtitle_filename = string.gsub(filename, "%.%w+$", ".srt")

	if not string.match(dir, "https://gajah.adityaphra.com") then
		return
	end

	for i = 1,#default_subtitle_paths do
		local subtitle_url = dir .. default_subtitle_paths[i] .. subtitle_filename
	 	mp.commandv("sub-add", subtitle_url)
	end
end

mp.register_event("start-file", find_and_add_entries)

