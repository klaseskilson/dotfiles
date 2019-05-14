autocmd FileType ruby set list listchars=tab:»·,trail:·,nbsp:·

" Run spec in vagrant on current file
au FileType ruby nmap <leader>r :!docker-compose run -e RAILS_ENV=test ssh -c 'bundle exec rspec %'<cr>
