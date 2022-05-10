(module config.plugins.lualine)

(def- config
  {:options           {:icons_enabled true :theme :auto
                       :component_separators {:left "" :right ""}
                       :section_separators {:left "" :right ""}
                       :disabled_filetypes {}
                       :always_divide_middle true
                       :globalstatus false}

   :sections          {:lualine_a {1 :mode}
                       :lualine_b {1 :branch 2 :diff 3 :diagnostics}
                       :lualine_c {1 :filename}
                       :lualine_x {1 :encoding 2 :fileformat 3 :filetype}
                       :lualine_y {1 :progress}
                       :lualine_z {1 :location}}

   :inactive_sections {:lualine_a {}
                       :lualine_b {}
                       :lualine_c {1 :filename}
                       :lualine_x {1 :location}
                       :lualine_y {}
                       :lualine_z {}}

   :tabline           {}

   :extensions        {}})

(def- branch  {1 :branch :icons_enabled true :icon ""})

(def- buffers {1 :buffers :show_filename_only true :mode 2})

(def- diagnostics
  {1                 :diagnostics
   :sources          {1 :nvim_diagnostic 2 :coc}
   :sections         {1 :error 2 :warn}
   :symbols          {:error " " :warn " "}
   :colored          true
   :update_in_insert false
   :always_visible   true})

(def- diff
  {1        :diff
   :colored true
   :symbols {:added " " :modified " " :removed " "}
   :cond    (fn hide-in-width [] (> (vim.fn.winwidth 0) 80))})

(def- filename {1 :filename :path 1})

(def- filetype {1 :filetype :icons_enabled false :icon nil})

(def- location {1 :location :padding 0})

(def- mode     {1 :mode :fmt (fn [str] (.. "-- " str " --"))})

(def- tabs     {1 :tabs :mode 2})

(defn- progress []
  (let [current-line (vim.fn.line ".")
        total-lines  (vim.fn.line "$")
        chars        {1 "__" 2 "▁▁" 3 "▂▂" 4 "▃▃" 5 "▄▄" 6 "▅▅" 7 "▆▆" 8 "▇▇" 9 "██"}
        line-ratio   (/ current-line total-lines)
        index        (math.ceil (* line-ratio (length chars)))]

    (. chars index)))

(defn- spaces [] (.. "spaces: " (vim.api.nvim_buf_get_option 0 :shiftwidth)))

(let [(ok? lualine) (pcall require :lualine)]
  (when ok?
    (tset config :options  :component_separators {:left "" :right ""})
    (tset config :options  :section_separators   {:left "" :right ""})

    (tset config :sections :lualine_a            {1 filename})
    (tset config :sections :lualine_b            {1 diagnostics})
    (tset config :sections :lualine_c            {})
    (tset config :sections :lualine_x            {1 :filetype })
    (tset config :sections :lualine_y            {1 progress 2 location})
    (tset config :sections :lualine_z            {1 mode})

    (tset config :tabline  :lualine_b            {1 buffers})
    (tset config :tabline  :lualine_x            {1 diff 2 :branch})
    (tset config :tabline  :lualine_y            {1 tabs})

    (lualine.setup config)))

