;; Configuration for additional submodules


;; enhancements for displaying flymake errors
(require 'flymake-cursor)
;;(setq flymake-log-level 3)
(setq-default flymake-no-changes-timeout '1)  ;; '3)
;; (setq-default flymake-info-line-regexp "^([Ii]nfo|refactor)")
;; (setq flymake-warn-line-regexp "^not [wW]arning")


;; undo-tree
(include-elget-plugin "undo-tree")
(global-undo-tree-mode)


;; Highlight parentheses
(include-elget-plugin "highlight-parentheses")
;; (require 'rainbow-delimiters) ;;;; XXX: tends to hang stuff
;; (global-rainbow-delimiters-mode)
;(add-hook 'highlight-parentheses-mode-hook
;          '(lambda ()
;             (setq autopair-handle-action-fns
;                   (append
;                    (if autopair-handle-action-fns
;                        autopair-handle-action-fns
;                        '(autopair-default-handle-action))
;                    '((lambda (action pair pos-before)
;                        (hl-paren-color-update)))))))
;(define-globalized-minor-mode global-highlight-parentheses-mode
;  highlight-parentheses-mode
;  (lambda ()
;    (highlight-parentheses-mode t)))
;(global-highlight-parentheses-mode t)
(setq hl-paren-colors
      '(;"#8f8f8f" ; this comes from Zenburn
                   ; and I guess I'll try to make the far-outer parens look like this
        "orange1" "yellow1" "greenyellow" "green1"
        "springgreen1" "cyan1" "slateblue1" "magenta1" "purple"))
(show-paren-mode t)
(setq show-paren-style 'expression)
