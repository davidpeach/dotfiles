"===================================
"
"    Turning things on and off.
"===================================

runtime settings-flags.vim


"===================================
"
"    Bolting things on.
"
"===================================

runtime ./plugins.vim


"===================================
"
"    Key Mappings
"
"===================================

runtime mappings.vim


"===================================
"
"    Keeping our ears open
"
"===================================

runtime listeners.vim


"===================================
"
"    Lick o' paint
"
"===================================

runtime styles.vim




" SCRATCHPAD

" Plugin config
runtime plug-config/start-screen.vim


" Docker permissions Faff
nnoremap <space>jdf :! sudo chown -R david:david $HOME/Jump24/Code

nnoremap <space>da :!$HOME/.config/i3/scripts/docker-artisan.sh 
