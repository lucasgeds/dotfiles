(module config.plugins.treesitter
  {autoload {nvim       aniseed.nvim
             treesitter nvim-treesitter.configs}})

(nvim.ex.syntax      :off)

(treesitter.setup {; :additional_vim_regex_highlighting true

                   :ensure_installed [:bash :clojure :dart :elixir :fennel :javascript :lua :scala :sql]

                   :highlight        {; :custom_captures {"s/defn" "clojureTSKeywordFunction"}
                                      :enable true
                                      :disable []}

                   :indent           {:enable true}

                   :playground       {:enable          false
                                      :disable         {}
                                      :persist_queries false
                                      :updatetime      25
                                      :keybindings     {:toggle_query_editor       :o
                                                        :toggle_hl_groups          :i
                                                        :toggle_injected_languages :t
                                                        :toggle_anonymous_nodes    :a
                                                        :toggle_language_display   :I
                                                        :focus_language            :f
                                                        :unfocus_language          :F
                                                        :update                    :R
                                                        :goto_node                 :<cr>
                                                        :show_help                 "?"}}

                   :sync_install     true})

;; Code Folding
; (set nvim.o.foldexpr "nvim_treesitter#foldexpr()")
; (set nvim.o.foldmethod :expr)
;; Auto open all folds
; (nvim.ex.autocmd "BufReadPost,FileReadPost * normal zR")
