#!/usr/bin/env ruby
# Source: http://tammersaleh.com/posts/the-modern-vim-config-with-pathogen

git_bundles = [ 
  "https://github.com/vim-scripts/gnupg.vim.git",
  "https://github.com/vim-scripts/nginx.vim.git",
  "https://github.com/msanders/snipmate.vim.git",
  "https://github.com/scrooloose/syntastic.git",
  "https://github.com/godlygeek/tabular.git",
  "https://github.com/tpope/vim-fugitive.git",
  "https://github.com/mv/mv-vim-puppet.git",
  "https://github.com/tsaleh/vim-tmux.git",
  "https://github.com/nelstrom/vim-blackboard.git",
  "https://github.com/elzr/vim-json.git",
  "https://github.com/tomasr/molokai.git",
  "https://github.com/altercation/vim-colors-solarized.git",
  "https://github.com/nanotech/jellybeans.vim.git",
  "https://github.com/mattn/gist-vim.git",
]

vim_org_scripts = [
  ["darkdot", "6097", "colors"],
  ["spamassassin", "15948", "syntax"],
]

require 'fileutils'
require 'open-uri'

bundles_dir = File.join(File.dirname(__FILE__), "bundle")

FileUtils.cd(bundles_dir)

puts "trashing everything (lookout!)"
Dir["*"].each {|d| FileUtils.rm_rf d }

FileUtils.rm_rf(bundles_dir)
FileUtils.mkdir(bundles_dir)

git_bundles.each do |url|
  dir = url.split('/').last.sub(/\.git$/, '')
  puts "unpacking #{url} into #{dir}"
  `git clone #{url} #{dir}`
  FileUtils.rm_rf(File.join(dir, ".git"))
end

vim_org_scripts.each do |name, script_id, script_type|
  puts "downloading #{name}"
  local_file = File.join(name, script_type, "#{name}.vim")
  FileUtils.mkdir_p(File.dirname(local_file))
  File.open(local_file, "w") do |file|
    file << open("http://www.vim.org/scripts/download_script.php?src_id=#{script_id}").read
  end
end
