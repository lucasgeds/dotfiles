(module config.plugins.packer
  {autoload {packer packer
             util   packer.util}})

;; have packer use a popup window
(packer.init
  {:display
   {:open_fn (fn [] (util.float {:border "rounded"}))}})

;; autocommand that reloads neovim whenever you save the plugins.lua file
;; (nvim.ex.augroup :packer_user_config)
;; (nvim.ex.autocmd_)
;; (nvim.ex.augroup :END)
;; (nvim.ex.autocmd "BufWritePost plugins.fnl source plugins.lua | PackerSync")
