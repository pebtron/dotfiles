#!/usr/bin/env ruby
# Source: http://tammersaleh.com/posts/the-modern-vim-config-with-pathogen

git_bundles = [ 
  "https://github.com/jamessan/vim-gnupg",
  "https://github.com/scrooloose/syntastic.git",
  "https://github.com/godlygeek/tabular.git",
  "https://github.com/tpope/vim-fugitive.git",
  "https://github.com/rodjek/vim-puppet",
  "https://github.com/tsaleh/vim-tmux.git",
  "https://github.com/elzr/vim-json.git",
  "https://github.com/tomasr/molokai.git",
  "https://github.com/nanotech/jellybeans.vim.git",
  "https://github.com/mattn/gist-vim.git",
  "https://github.com/mattn/webapi-vim.git",
  "https://github.com/plasticboy/vim-markdown.git",
  "https://github.com/sjl/gundo.vim.git",
  "https://github.com/bling/vim-airline.git",
  "https://github.com/scrooloose/nerdtree.git",
  "https://github.com/vim-scripts/VisIncr.git",
  "https://github.com/tpope/vim-surround.git",
  "https://github.com/cocopon/iceberg.vim",
  "https://github.com/dracula/vim.git",
]

vim_org_scripts = [
  ["darkdot", "6097", "colors"],
  ["spamassassin", "15948", "syntax"],
]

require 'fileutils'
require 'open-uri'

bundles_dir = File.join(File.dirname(__FILE__), "bundle")
FileUtils.mkdir_p(bundles_dir)
FileUtils.cd(bundles_dir)

puts "trashing everything (lookout!)"
Dir["*"].each {|d| FileUtils.rm_rf d }

FileUtils.rm_rf(bundles_dir)
FileUtils.mkdir(bundles_dir)

git_bundles.each do |url|
  dir = url.split('/').last.sub(/\.git$/, '')
  # Dracula.vim hack
  if dir == 'vim'
    dir = 'dracula.vim'
  end
  puts "unpacking #{url} into #{dir}"
  `git clone #{url} #{dir}`
  FileUtils.rm_rf(File.join(dir, ".git"))
end

vim_org_scripts.each do |name, script_id, script_type|
  puts "downloading #{name}"
  local_file = File.join(name, script_type, "#{name}.vim")
  FileUtils.mkdir_p(File.dirname(local_file))
  File.open(local_file, "w") do |file|
    file << open("https://www.vim.org/scripts/download_script.php?src_id=#{script_id}").read
  end
end
