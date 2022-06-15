vim.cmd([[
  let g:projectionist_heuristics = {
    \ "artisan": {
    \   "*": {
    \     "start": "sail up",
    \     "console": "sail tinker",
    \   },
    \   "app/Http/Controllers/*Controller.php": {
    \     "type": "source",
    \     "alternate": "tests/Feature/Http/Controllers/{}ControllerTest.php",
    \   },
    \   "tests/Feature/Http/Controllers/*ControllerTest.php": {
    \     "type": "test",
    \     "alternate": "app/Http/Controllers/{}Controller.php",
    \   },
    \   "app/Models/*.php": {
    \     "type": "source",
    \     "alternate": "tests/Unit/Models/{}Test.php",
    \   },
    \   "tests/Unit/Models/*Test.php": {
    \     "type": "test",
    \     "alternate": "app/Models/{}.php",
    \   },
    \   "app/Console/Commands/*.php": {
    \     "type": "source",
    \     "alternate": "tests/Feature/Console/Commands/{}Test.php",
    \   },
    \   "tests/Feature/Console/Commands/*Test.php": {
    \     "type": "test",
    \     "alternate": "app/Console/Commands/{}.php",
    \   },
    \ }}
]])

