(module config.plugins.telescope
  {autoload {nvim      aniseed.nvim
             telescope telescope
             actions   telescope.actions}})

(telescope.setup
  {:defaults {:file_ignore_patterns ["node_modules"]
              :path_display         ["smart"]
              :prompt_prefix        " "
              :selection_caret      " "

              :history    {:path  "~/.local/share/nvim/databases/telescope_history.sqlite3"
                           :limit 100}

              :mappings   {:i {:<C-c>   actions.close

                               :<CR>    actions.select_default
                               :<C-x>   actions.select_horizontal
                               :<C-v>   actions.select_vertical
                               :<C-t>   actions.select_tab

                               :<C-n>   actions.cycle_history_next
                               :<C-p>   actions.cycle_history_prev

                               :<Down>  actions.move_selection_next
                               :<Up>    actions.move_selection_previous
                               :<C-j>   actions.move_selection_next
                               :<C-k>   actions.move_selection_previous

                               :<C-u>   actions.preview_scrolling_up
                               :<C-d>   actions.preview_scrolling_down

                               :<Tab>   (+ actions.toggle_selection        actions.move_selection_worse)
                               :<S-Tab> (+ actions.toggle_selection        actions.move_selection_better)
                               :<C-w>   (+ actions.send_to_qflist          actions.open_qflist)
                               :<C-q>   (+ actions.send_selected_to_qflist actions.open_qflist)

                               :<C-l>   actions.complete_tag
                               :<C-/>   actions.which_key}

                           :n {:<Esc>   actions.close

                               :<CR>    actions.select_default
                               :x       actions.select_horizontal
                               :v       actions.select_vertical
                               :t       actions.select_tab

                               :n       actions.cycle_history_next
                               :p       actions.cycle_history_prev

                               :<Down>  actions.move_selection_next
                               :<Up>    actions.move_selection_previous
                               :j       actions.move_selection_next
                               :k       actions.move_selection_previous

                               :<C-u>   actions.preview_scrolling_up
                               :<C-d>   actions.preview_scrolling_down

                               :<C-j>   actions.results_scrolling_up
                               :<C-k>   actions.results_scrolling_down

                               :<Tab>   (+ actions.toggle_selection        actions.move_selection_worse)
                               :<S-Tab> (+ actions.toggle_selection        actions.move_selection_better)
                               :<C-w>   (+ actions.send_to_qflist          actions.open_qflist)
                               :<C-q>   (+ actions.send_selected_to_qflist actions.open_qflist)

                               :H       actions.move_to_top
                               :M       actions.move_to_middle
                               :L       actions.move_to_bottom

                               :gg      actions.move_to_top
                               :G       actions.move_to_bottom

                               :?       actions.which_key}}}

   :extensions {:file_browser {:hidden       true
                               :hijack_netrw false      ; disables netrw and use telescope-file-browser in its place
                               :path         "%:p:h"
                               :mappings     {["i"] {}  ; your custom insert mode mappings
                                              ["n"] {}} ; your custom normal mode mappings
                               :theme        :ivy}

                :project      {:base_dirs    ["~/dev/nu/" "~/Projects/"]
                               :display_type :full
                               :hidden_files true
                               :theme        :ivy}}

   :pickers    {:buffers    {:mappings {:i {:<A-d> actions.delete_buffer}
                                        :n {:bd     actions.delete_buffer}}
                             :theme :ivy}
                :find_files {:find_command ["rg" "--files" "--iglob" "!.git" "--hidden"]
                             :theme :ivy}
                :help_tags  {:theme :ivy}
                :live_grep  {:theme :ivy}}})

(nvim.set_keymap :n :<leader>fb ":lua require('telescope.builtin').buffers()<CR>"                      {:noremap true})
(nvim.set_keymap :n :<leader>ff ":lua require('telescope.builtin').find_files()<CR>"                   {:noremap true})
(nvim.set_keymap :n :<leader>fg ":lua require('telescope.builtin').live_grep()<CR>"                    {:noremap true})
(nvim.set_keymap :n :<leader>fh ":lua require('telescope.builtin').help_tags()<CR>"                    {:noremap true})
(nvim.set_keymap :n :<leader>fp ":lua require('telescope').extensions.project.project()<CR>"           {:noremap true})
(nvim.set_keymap :n :<leader>ft ":lua require('telescope').extensions.file_browser.file_browser()<CR>" {:noremap true})
