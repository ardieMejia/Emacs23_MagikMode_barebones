(set-face-attribute 'default nil :font "Consolas-12" :weight 'medium)






(require 'org)


(dolist (face '((org-level-1 . 200)
                (org-level-2 . 180)
                (org-level-3 . 160)
                (org-level-4 . 140)
                (org-level-5 . 1.1)
                (org-level-6 . 1.1)
                (org-level-7 . 1.1)
                (org-level-8 . 1.1)))
  (set-face-attribute (car face) nil :font "Courier New" :weight 'medium :height (cdr face)))


(global-hl-line-mode +1)

(visual-line-mode)
(add-hook 'org-mode-hook 'visual-line-mode)


(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)


(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)


(setq ido-decorations (quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))



(setq split-height-threshold nil)
(setq split-width-threshold 100)




;; ========== () for magik
    (defun electric-pair ()
      "If at end of line, insert character pair without surrounding spaces.
    Otherwise, just insert the typed character."
      (interactive)
      (if (eolp) (let (parens-require-spaces) (insert-pair)) (self-insert-command 1)))





    (add-hook 'org-mode-hook
              (lambda ()
                (define-key org-mode-map "\"" 'electric-pair)
                (define-key org-mode-map "\'" 'electric-pair)
                (define-key org-mode-map "(" 'electric-pair)
                (define-key org-mode-map "[" 'electric-pair)
                (define-key org-mode-map "{" 'electric-pair)))

    (add-hook 'gis-mode-hook
              (lambda ()
                (define-key gis-mode-map "\"" 'electric-pair)
                (define-key gis-mode-map "\'" 'electric-pair)
                (define-key gis-mode-map "(" 'electric-pair)
                (define-key gis-mode-map "[" 'electric-pair)
                (define-key gis-mode-map "{" 'electric-pair)))


(defun my-magik-session()
  "my magik session instead of magik-session"
  (interactive)
  (gis "*my-gis*" "runalias eo_open -login root")
  (set-window-dedicated-p (selected-window) t)
  )


(global-set-key (kbd "C-c m m") 'my-magik-session)







