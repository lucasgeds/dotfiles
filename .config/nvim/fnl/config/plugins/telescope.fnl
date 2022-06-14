(module config.plugins.telescope
  {autoload {nvim      aniseed.nvim
             telescope telescope}})

(telescope.setup
  {:defaults {:file_ignore_patterns ["node_modules"]}
   :pickers  {:buffers     {:theme :ivy}
              :find_files  {:find_command ["rg" "--files" "--iglob" "!.git" "--hidden"]
                            :theme :ivy}
              :help_tags   {:theme :ivy}
              :live_grep   {:theme :ivy}}})

(nvim.set_keymap :n :<leader>fb ":lua require('telescope.builtin').buffers()<CR>"    {:noremap true})
(nvim.set_keymap :n :<leader>ff ":lua require('telescope.builtin').find_files()<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>fg ":lua require('telescope.builtin').live_grep()<CR>"  {:noremap true})
(nvim.set_keymap :n :<leader>fh ":lua require('telescope.builtin').help_tags()<CR>"  {:noremap true})
