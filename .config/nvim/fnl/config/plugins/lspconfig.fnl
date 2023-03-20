(module config.plugin.lspconfig
  {autoload {nvim aniseed.nvim
             lsp lspconfig
             cmplsp cmp_nvim_lsp}})

;; symbols to show for lsp diagnostics
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

;; server features
(let [handlers {"textDocument/publishDiagnostics"
                (vim.lsp.with
                  vim.lsp.diagnostic.on_publish_diagnostics
                  {:severity_sort    true
                   :update_in_insert false
                   :underline        true
                   :virtual_text     false})
                "textDocument/hover"
                (vim.lsp.with
                  vim.lsp.handlers.hover
                  {:border "single"})
                "textDocument/signatureHelp"
                (vim.lsp.with
                  vim.lsp.handlers.signature_help
                  {:border "single"})}
      capabilities (cmplsp.default_capabilities)
      on_attach (fn [client bufnr]
                  (do
                    (nvim.buf_set_keymap bufnr :n :<leader>le ":lua vim.diagnostic.open_float()<cr>"          {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>lj ":lua vim.diagnostic.goto_next()<cr>"           {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>lk ":lua vim.diagnostic.goto_prev()<cr>"           {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>lq ":lua vim.diagnostic.setloclist()<cr>"          {:noremap true})

                    (nvim.buf_set_keymap bufnr :n :<leader>k  ":lua vim.lsp.buf.hover()<cr>"                  {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>ld ":lua vim.lsp.buf.declaration()<cr>"            {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>lf ":lua vim.lsp.buf.format({ async = true })<cr>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>lh ":lua vim.lsp.buf.signature_help()<cr>"         {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>ln ":lua vim.lsp.buf.rename()<cr>"                 {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>lt ":lua vim.lsp.buf.type_definition()<cr>"        {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :gd         ":lua vim.lsp.buf.definition()<cr>"             {:noremap true})

                    (nvim.buf_set_keymap bufnr :n :<leader>la ":lua vim.lsp.buf.code_action()<cr>"            {:noremap true})
                    (nvim.buf_set_keymap bufnr :v :<leader>la ":lua vim.lsp.buf.range_code_action()<cr>"      {:noremap true})

                    ;; telescope
                    (nvim.buf_set_keymap bufnr :n :<leader>lw ":lua require('telescope.builtin').diagnostics()<cr>"         {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>lr ":lua require('telescope.builtin').lsp_references()<cr>"      {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>li ":lua require('telescope.builtin').lsp_implementations()<cr>" {:noremap true})
                    
                    (if client.server_capabilities.documentFormattingProvider
                      (nvim.ex.autocmd :BufWritePre :<buffer> ":lua vim.lsp.buf.format()"))
                    
                    (print "LSP Client Attached.")))]

  ;; To add support to more language servers check:
  ;; https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

  ;; Clojure
  (lsp.clojure_lsp.setup {:on_attach    on_attach
                          :handlers     handlers
                          :capabilities capabilities}))
