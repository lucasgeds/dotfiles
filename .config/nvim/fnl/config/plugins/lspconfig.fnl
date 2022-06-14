(module config.plugins.lspconfig
  {autoload {nvim   aniseed.nvim
             lsp    lspconfig
             cmplsp cmp_nvim_lsp}})

;; Symbols to show for lsp diagnostics
(defn define-signs
  [prefix]
  (let [error (.. prefix "SignError")
        warn  (.. prefix "SignWarn")
        info  (.. prefix "SignInfo")
        hint  (.. prefix "SignHint")]
    (vim.fn.sign_define error {:text "x" :texthl error})
    (vim.fn.sign_define warn  {:text "!" :texthl warn})
    (vim.fn.sign_define info  {:text "i" :texthl info})
    (vim.fn.sign_define hint  {:text "?" :texthl hint})))

(if (= (nvim.fn.has "nvim-0.6") 1)
  (define-signs "Diagnostic")
  (define-signs "LspDiagnostics"))

;; Server features
(let [capabilities (cmplsp.update_capabilities (vim.lsp.protocol.make_client_capabilities))

      handlers     {"textDocument/publishDiagnostics"
                    (vim.lsp.with vim.lsp.diagnostic.on_publish_diagnostics
                                  {:underline true
                                   :update_in_insert false
                                   :virtual_text false
                                   :severity_sort true})

                    "textDocument/hover"
                    (vim.lsp.with vim.lsp.handlers.hover
                                  {:border "single"})

                    "textDocument/signatureHelp"
                    (vim.lsp.with vim.lsp.handlers.signature_help
                                  {:border "single"})}

      on_attach    (fn [client bufnr]
                     (do
                       (let [opts {:noremap true :silent true}]
                         (nvim.buf_set_keymap bufnr :n :gd         ":lua vim.lsp.buf.definition()<CR>"                                 opts)
                         (nvim.buf_set_keymap bufnr :n :K          ":lua vim.lsp.buf.hover()<CR>"                                      opts)
                         (nvim.buf_set_keymap bufnr :n :<leader>la ":lua vim.lsp.buf.code_action()<CR>"                                opts)
                         (nvim.buf_set_keymap bufnr :n :<leader>ld ":lua vim.lsp.buf.declaration()<CR>"                                opts)
                         (nvim.buf_set_keymap bufnr :n :<leader>le ":lua vim.diagnostic.open_float()<CR>"                              opts)
                         (nvim.buf_set_keymap bufnr :n :<leader>lf ":lua vim.lsp.buf.formatting()<CR>"                                 opts)
                         (nvim.buf_set_keymap bufnr :n :<leader>lh ":lua vim.lsp.buf.signature_help()<CR>"                             opts)
                         (nvim.buf_set_keymap bufnr :n :<leader>lj ":lua vim.diagnostic.goto_next()<CR>"                               opts)
                         (nvim.buf_set_keymap bufnr :n :<leader>lk ":lua vim.diagnostic.goto_prev()<CR>"                               opts)
                         (nvim.buf_set_keymap bufnr :n :<leader>ln ":lua vim.lsp.buf.rename()<CR>"                                     opts)
                         (nvim.buf_set_keymap bufnr :n :<leader>lq ":lua vim.diagnostic.setloclist()<CR>"                              opts)
                         (nvim.buf_set_keymap bufnr :n :<leader>lt ":lua vim.lsp.buf.type_definition()<CR>"                            opts)
                         (nvim.buf_set_keymap bufnr :v :<leader>la ":lua vim.lsp.buf.range_code_action()<CR>"                          opts)
                         ;; Telescope
                         (nvim.buf_set_keymap bufnr :n :<leader>li ":lua require('telescope.builtin').lsp_implementations()<CR>"       opts)
                         (nvim.buf_set_keymap bufnr :n :<leader>lr ":lua require('telescope.builtin').lsp_references()<CR>"            opts)
                         (nvim.buf_set_keymap bufnr :n :<leader>lw ":lua require('telescope.builtin').lsp_workspace_diagnostics()<CR>" opts))))]

  ;; Clojure
  (lsp.clojure_lsp.setup {:capabilities capabilities
                          :handlers     handlers
                          :on_attach    on_attach}))

