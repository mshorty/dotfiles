local M = {}

local wiki_opts = {
  search_dirs = {
    [1] = "~/vimwiki"
  }
}

M.find_wiki = function()
  require'telescope.builtin'.find_files(wiki_opts)
end

M.grep_wiki = function()
  require'telescope.builtin'.live_grep(wiki_opts)
end

return M
