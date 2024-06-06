(when (modulep! :ui hydra +childframe)
  (package! hydra-posframe
    :recipe (:host github :repo "Ladicle/hydra-posframe")))

(when (modulep! :ui hydra +pretty)
  (package! pretty-hydra
    :recipe (:host github :repo "jerrypnz/major-mode-hydra.el" :files ("pretty-hydra.el"))))

(when (modulep! :lang web +lipsum)
  (package! lorem-ipsum))

(package! lsp-tailwindcss :recipe (:host github :repo "merrickluo/lsp-tailwindcss"))

(when (modulep! :ui hydra +childframe)
  (package! hydra-posframe
    :recipe (:host github :repo "Ladicle/hydra-posframe")))

(when (modulep! :ui hydra +pretty)
  (package! pretty-hydra
    :recipe (:host github :repo "jerrypnz/major-mode-hydra.el" :files ("pretty-hydra.el"))))

(package! org-reveal)

(package! org-super-agenda)
(package! doct)
(package! org-ql)
(package! org-recur)
(package! org-trello)

(package! om-dash
  :recipe (:host github :repo "gavv/om-dash" :files ("om-dash.el")))

(when (modulep! :lang org +roam2)
  (package! vulpea)
  (package! org-roam-ui))

(package! denote)

(package! binder)

(package! astro-ts-mode
  :recipe ( :host github :repo "Sorixelle/astro-ts-mode"))

(package! esxml)
(package! simple-httpd)

(package! decide)

(package! org-chef)

(when (modulep! :lang org +moderncv)
  (package! ox-moderncv
    :recipe (:host gitlab :repo "jhilker98/org-cv")))

(package! magit-delta)

(package! wakatime-mode)

(package! virtualenvwrapper)

(package! lorem-ipsum)

(when (modulep! :emacs dired +casual)

(package! casual-dired
    :recipe (:host github :repo "kickingvegas/casual-dired")))

(when (modulep! :tools biblio)
  (package! ebib))

(when (modulep! :app rss)
  (package! elfeed-summary
    :recipe (:host github :repo "SqrtMinusOne/elfeed-summary")))
