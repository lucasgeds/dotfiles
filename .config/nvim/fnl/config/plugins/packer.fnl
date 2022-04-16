(module config.plugins.packer
  {autoload {packer packer
             util   packer.util}})

;; have packer use a popup window
(packer.init
  {:display
   {:open_fn (fn [] (util.float {:border "rounded"}))}})

