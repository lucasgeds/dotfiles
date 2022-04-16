(module config.plugin.easy-align
        {autoload {nvim aniseed.nvim}})

;; Start interactive EasyAlign in visual mode (e.g. vipga)
;; xmap ga <Plug>(EasyAlign)
(nvim.set_keymap :x :ga "<Plug>(EasyAlign)" {})

;; Start interactive EasyAlign for a motion/text object (e.g. gaip)
;; nmap ga <Plug>(EasyAlign)
(nvim.set_keymap :n :ga "<Plug>(EasyAlign)" {})
