(module config.plugins.treesitter
  {autoload {nvim       aniseed.nvim
             treesitter nvim-treesitter.configs}})

(treesitter.setup {:ensure_installed [:clojure :dart :elixir :fennel :lua]

                   :highlight        {:enable true
                                      :disable [:fennel]
                                      :custom_captures {"s/defn" "clojureTSKeywordFunction"}}

                   :indent           {:enable false}

                   :playground       {:enable          true
                                      :disable         {}
                                      :persist_queries false
                                      :updatetime      25
                                      :keybindings     {:toggle_query_editor :o
                                                        :toggle_hl_groups          :i
                                                        :toggle_injected_languages :t
                                                        :toggle_anonymous_nodes    :a
                                                        :toggle_language_display   :I
                                                        :focus_language            :f
                                                        :unfocus_language          :F
                                                        :update                    :R
                                                        :goto_node                 :<cr>
                                                        :show_help                 "?"}}})

;; Code Folding
(nvim.ex.autocmd "BufReadPost,FileReadPost * normal zR")
(set nvim.o.foldexpr "nvim_treesitter#foldexpr()")
(set nvim.o.foldmethod :expr)
