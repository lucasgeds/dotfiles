(module config.plugins.conjure
  {autoload {nvim aniseed.nvim}})

(set nvim.g.conjure#client#clojure#nrepl#connection#auto_repl#enabled false)
(set nvim.g.conjure#client#clojure#nrepl#eval#auto_require false)
(set nvim.g.conjure#client#clojure#nrepl#test#current_form_names ["deftest" "defflow"])
(set nvim.g.conjure#log#strip_ansi_escape_sequences_line_limit 0)
(set nvim.g.conjure#mapping#doc_word "K")
