let b:ale_linters = ['flake8', 'pylint']
set list listchars=tab:»·,trail:·,nbsp:·

let b:ale_fixers = [
  'remove_trailing_lines',
  'trim_whitespace',
  'black',
  'isort',
]
