
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flymake-info-line-regexp "^\\([Ii]nfo\\|refactor\\|F[0-9]+\\)")
 '(frame-background-mode (quote dark)))

; color theme
;(add-to-list 'custom-theme-load-path (make-plugin-path "color-theme-solarized"))
;(load-theme 'solarized-dark 1)
;(setq solarized-termcolors 256)

(require 'faces)
(if (system-is-mac)
    (set-face-attribute 'default nil
			:foundry "apple" 
			:family "DejaVu_Sans_Mono"))

; '(flymake-errline ((t (:background "color-90"))))
; '(flymake-warnline ((t (:background "color-237"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ein:cell-input-area ((t (:background "#042028"))))
 '(ein:cell-input-prompt ((t (:inherit header-line :background "#002b35" :foreground "#859900" :inverse-video nil :weight bold))))
 '(ein:cell-output-prompt ((t (:inherit header-line :background "#002b35" :foreground "#dc322f" :inverse-video nil :weight bold))))
 '(flymake-infoline ((t (:inherit info :foreground "color-184"))))
 '(font-lock-builtin-face ((((class color) (min-colors 88) (background dark)) (:foreground "#ffbb30" :weight bold))))
 '(font-lock-comment-face ((t (:foreground "green"))))
 '(font-lock-function-name-face ((((class color) (min-colors 88) (background dark)) (:foreground "#99ff99" :weight bold))))
 '(font-lock-keyword-face ((((class color) (min-colors 88) (background dark)) (:foreground "white" :weight bold))))
 '(font-lock-string-face ((((class color) (min-colors 88) (background dark)) (:foreground "cyan"))))
 '(font-lock-type-face ((t (:foreground "#d33682" :inverse-video nil :underline nil :slant normal :weight normal))))
 '(fringe ((t (:background "#002b35" :foreground "#465a61"))))
 '(magit-item-highlight ((t (:background "white" :foreground "black"))))
 '(markdown-header-face-1 ((t (:inherit markdown-header-face :height 210))))
 '(markdown-header-face-2 ((t (:inherit markdown-header-face :height 190))))
 '(markdown-header-face-3 ((t (:inherit markdown-header-face :height 170))))
 '(markdown-header-face-4 ((t (:inherit markdown-header-face :height 150))))
 '(markdown-header-face-5 ((t (:inherit markdown-header-face :slant italic :weight bold))))
 '(markdown-header-face-6 ((t (:inherit markdown-header-face :slant italic :weight normal))))
 '(markdown-math-face ((t (:inherit font-lock-string-face :foreground "#cb4b16" :slant italic))))
 '(mumamo-background-chunk-major ((t (:background "#002b36"))))
 '(py-variable-name-face ((t (:inherit default :foreground "LightGoldenrod"))))
 '(rainbow-delimiters-depth-1-face ((((background dark)) (:background "#262626"))))
 '(rainbow-delimiters-depth-2-face ((((background dark)) (:background "#444444"))))
 '(rainbow-delimiters-depth-3-face ((((background dark)) (:background "#626262"))))
 '(rainbow-delimiters-depth-4-face ((((background dark)) (:background "#808080"))))
 '(rainbow-delimiters-depth-5-face ((((background dark)) (:background "#87005f"))))
 '(rainbow-delimiters-depth-6-face ((((background dark)) (:background "#875f5f"))))
 '(rainbow-delimiters-depth-7-face ((((background dark)) (:background "#8700d7"))))
 '(rainbow-delimiters-depth-8-face ((((background dark)) (:background "#875fff"))))
 '(rainbow-delimiters-unmatched-face ((((background dark)) (:foreground "#ee1122" :weight bold)))))
