vim.cmd([[
  let wiki_1 = {}
  let wiki_1.path = '~/vimwiki/commonplace/'
  let wiki_1.html_template = '~/vimwiki/commonplace_html/'
  let wiki_1.syntax = 'markdown'
  let wiki_1.ext = '.md'
  let wiki_2 = {}
  let wiki_2.path = '~/vimwiki/davidpeach.me/'
  let wiki_2.html_template = '~/vimwiki/davidpeach.me_html/'
  let wiki_2.template_default = 'default'
  let wiki_2.template_path = '~/vimwiki/templates/'
  let wiki_2.template_ext = '.html'
  let wiki_2.css_name = '/css/main.css'
  let wiki_3 = {}
  let wiki_3.path = '~/vimwiki/private/'
  let wiki_3.html_template = '~/vimwiki/private_html/'
  let g:vimwiki_list = [wiki_1, wiki_2, wiki_3]
  let g:vimwiki_folding = 'custom'
  call vimwiki#vars#init()
]])

vim.keymap.set("n", "<C-l>", ":VimwikiToggleListItem<cr>", { noremap = true, silent = true })
