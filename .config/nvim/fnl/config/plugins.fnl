(module config.plugins
  {autoload {core        aniseed.core
             nvim        aniseed.nvim
             packer      packer
             packer-util packer.util}})

(defn- safe-require-plugin-config [name]
  (let [(ok? val-or-err) (pcall require (.. :config.plugins. name))]
    (when (not ok?)
      (print (.. "config error: " val-or-err)))))

(defn- use [...]
  "Iterates through the arguments as pairs and calls packer's use function for
  each of them. Works around Fennel not liking mixed associative and sequential
  tables as well."
  (let [pkgs [...]]
    (packer.startup
      (fn [use]
        (for [i 1 (core.count pkgs) 2]
          (let [name (. pkgs i)
                opts (. pkgs (+ i 1))]
            (-?> (. opts :mod) (safe-require-plugin-config))
            (use (core.assoc opts 1 name)))))))
  nil)

;; plugins managed by packer
;; :mod specifies namespace under plugins directory

(use
  ;; have packer manage itself
  :wbthomason/packer.nvim {:mod :packer}

  ;; nvim config and plugins in Fennel
  :Olical/aniseed {}

  ;; colorscheme
  :NLKNguyen/papercolor-theme  {:mod :colorscheme}
  :morhetz/gruvbox             {:mod :colorscheme}
  :projekt0n/github-nvim-theme {:mod :colorscheme}

  ;; text manipulation
  :junegunn/vim-easy-align {:mod :easy-align}
  :numToStr/Comment.nvim   {:mod :comment}

  :lewis6991/impatient.nvim {}
  )

;; autocommand that reloads neovim whenever you save the plugins.lua file
;; (nvim.ex.augroup :packer_user_config)
;; (nvim.ex.autocmd_)
;; (nvim.ex.augroup :END)
;; (nvim.ex.autocmd "BufWritePost plugins.fnl source plugins.lua | PackerSync")

