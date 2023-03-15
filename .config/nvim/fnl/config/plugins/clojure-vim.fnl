(module config.plugins.clojure-vim
  {autoload {nvim aniseed.nvim}})

(set nvim.g.clojure_syntax_keywords {:clojureMacro [:defproject :s/defn]})
