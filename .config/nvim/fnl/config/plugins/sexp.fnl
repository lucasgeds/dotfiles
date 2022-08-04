(module config.plugins.sexp
  {autoload {nvim aniseed.nvim}})

(set nvim.g.sexp_filetypes "clojure,edn,fennel,janet,lisp,scheme,timl")

;; 0 disables going into insert mode after wrapping something
(set nvim.g.sexp_insert_after_wrap 0)

;; 0 disables automatically creating closing brackets and quotes
(set nvim.g.sexp_enable_insert_mode_mappings 1)
