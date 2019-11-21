autocmd FileType ruby set list listchars=tab:»·,trail:·,nbsp:·

" Run spec in vagrant on current file
au FileType ruby nmap <leader>dr :!docker-compose run -e RAILS_ENV=test ssh -c 'bundle exec rspec %'<cr>
au FileType ruby nmap <leader>r :!bundle exec rspec %<cr>

" disable deoplete for ruby
autocmd FileType ruby let g:deoplete#enable_at_startup = 0
