
;; NOTE: http://stackoverflow.com/questions/778716/how-can-i-make-emacs-start-up-faster/779145#779145
;; NOTE: see 'XXX' marks (and the NOTE marks, ofc).

;; XXX: cycle between buffers with opened files instead of all buffers?
;; XXX: Bind 'C-u M-|' to 'M-?'?  ; shell-command-on-region
;; XXX: Open same file in several buffers? (on binds)
;; XXX: rainbow-delimiters full region background color?

;; Might be needed, might be not needed:
;(add-to-list 'load-path (expand-file-name "~/.emacs.d/el-get/flymake"))

; Do this at the beginning just in case
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

;(defun mytst()
;  (interactive (let (string) (unless (mark) (error "The mark is not set now, so there is no region")) (setq string (read-shell-command "Shell command on region: ")) (list (region-beginning) (region-end) string current-prefix-arg current-prefix-arg shell-command-default-error-buffer t)))

;(define-ibuffer-op
;  "Replace the contents of marked buffers with output of pipe to COMMAND."
;  (:interactive "sPipe to shell command (replace): "
;   :opstring "Buffer contents replaced in"
;   :active-opstring "replace buffer contents in"
;   :dangerous t
;   :modifier-p t) 
;  (with-current-buffer buf
;    (shell-command-on-region (point-min) (point-max)
;                             command nil t)))



;; NOTE: Remove line-wrap (newline) character:
; M-: (set-display-table-slot standard-display-table 'wrap ?\ )
; M-: (set-display-table-slot standard-display-table 'wrap ?\b )

;; don't open the scratch buffer (I need a editor, not a console
;; environment).
(kill-buffer "*scratch*")

;; Directory with various extra files.
(add-to-list 'load-path "~/.emacs.d/lib/")


;; Various personal keybindings.
(defvar my-keys-minor-mode-map (make-keymap) "my-keys-minor-mode keymap.")
;; ...
(define-minor-mode my-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  t " my-keys" 'my-keys-minor-mode-map)
;; +enable
(my-keys-minor-mode 1)
;; -minibuffer
(defun my-minibuffer-setup-hook ()
  (my-keys-minor-mode 0))
(add-hook 'minibuffer-setup-hook 'my-minibuffer-setup-hook)
;; +priority
(defadvice load (after give-my-keybindings-priority)
  "Try to ensure that my keybindings always have priority."
  (if (not (eq (car (car minor-mode-map-alist)) 'my-keys-minor-mode))
      (let ((mykeys (assq 'my-keys-minor-mode minor-mode-map-alist)))
        (assq-delete-all 'my-keys-minor-mode minor-mode-map-alist)
        (add-to-list 'minor-mode-map-alist mykeys))))
(ad-activate 'load)


;; indentations
;(autoload 'my-unindent "indent")
;(autoload 'my-indent "indent")
;; (define-key global-map "\t" 'my-indent)
;(define-key global-map [S-tab] 'python-indent-shift-left)
;(define-key global-map [backtab] 'python-indent-shift-left)
(define-key my-keys-minor-mode-map [S-tab] 'python-indent-shift-left)
(define-key my-keys-minor-mode-map [backtab] 'python-indent-shift-left)
(define-key my-keys-minor-mode-map (kbd "M-]") 'python-indent-shift-right)
;(define-key my-keys-minor-mode-map "\t" 'python-indent-shift-right)

;; completions
(define-key my-keys-minor-mode-map [M-tab] 'jedi:complete)
(define-key my-keys-minor-mode-map (kbd "C-M-i") 'jedi:complete)

;; commenting
; Does not work, really:
;(define-key my-keys-minor-mode-map (kbd "C-/") 'comment-or-uncomment-region)
; "M-;" does pretty much that


(global-set-key "\M-[1;5A" 'previous-buffer); Ctrl+up => previous buffer
(global-set-key "\M-[1;5B" 'next-buffer)    ; Ctrl+down  => next buffer
(global-set-key [(control up)] 'previous-buffer); Ctrl+up => previous buffer
(global-set-key [(control down)] 'next-buffer)    ; Ctrl+down e => next buffer
(global-set-key "\M-[1;5C" 'forward-word)   ; Ctrl+right => forward word
(global-set-key "\M-[1;5D" 'backward-word)  ; Ctrl+left  => backward word
; (global-set-key (kbd "C-x TAB") 'indent-rigidly)  ;; default
(global-set-key (kbd "C-x TAB") 'other-window)
; 'fix' for xterm-like home/end in rxvt with TERM=xterm-256color
(global-set-key "\M-[H" 'move-beginning-of-line)
(global-set-key "\M-[F" 'move-end-of-line)
(global-set-key "\M-[1~" 'move-beginning-of-line)
(global-set-key "\M-[4~" 'move-end-of-line)
(global-set-key [select] 'move-end-of-line)  ;; dunno wtf.
; 'suspend-frame' is usually useless anyway.
(global-set-key (kbd "C-z") 'other-window)
;; hs-minor-mode  hide/show block
;; NOTE: see also: M-x helm-imenu
(define-key my-keys-minor-mode-map "\M-\r" 'hs-toggle-hiding)

;; Auto-indent possibilities:
;(define-key global-map (kbd "RET") 'newline-and-indent)
;(define-key global-map (kbd "C-j") 'newline)
;; or
; (defun set-newline-and-indent () (local-set-key (kbd "RET") 'newline-and-indent))
;; http://www.emacswiki.org/emacs/AutoIndentation
(setq py-return-key (quote newline))

;; Remembering positions in files
(setq save-place-file "~/.emacs.d/saveplace") ;; keep my ~/ clean
(setq-default save-place t)                   ;; activate it for all buffers
(require 'saveplace)                          ;; get the package


;; Don't show menu bar
(menu-bar-mode 0)

;; Aux.
(defun yank-and-indent ()
  "Yank and then indent the newly formed region according to mode."
  (interactive)
  (yank)
  (call-interactively 'indent-region))

;; ===== Set standard indent to 2 rather that 4 ====
; (setq standard-indent 2)


;; ===== Turn off tab character =====
;; Emacs normally uses both tabs and spaces to indent lines. If you
;; prefer, all indentation can be made from spaces only. To request this,
;; set `indent-tabs-mode' to `nil'. This is a per-buffer variable;
;; altering the variable affects only the current buffer, but it can be
;; disabled for all buffers.
;;
;; Use (setq ...) to set value locally to a buffer
;; Use (setq-default ...) to set value globally 
(setq-default indent-tabs-mode nil) 


;; ========== Prevent Emacs from making backup files ==========
; (setq make-backup-files nil)

;; ========== Place Backup Files in Specific Directory ==========
;; Enable backup files.
(setq make-backup-files t)
;; Enable versioning with default values (keep five last versions, I think!)
(setq version-control t)
;; Save all backup file in this directory.
(setq backup-directory-alist (quote ((".*" . "~/.tmp/emacs_backups/"))))
(setq delete-old-versions t)


;; ========== Enable Line and Column Numbering ==========
;; Show line-number in the mode line
(line-number-mode 1)
;; Show column-number in the mode line
(column-number-mode 1)


;; backwards-undo - probably obsolete
;(require 'redo)
;(global-set-key [(meta backspace)] 'undo)
;(global-set-key [(meta shift backspace)] 'redo)


;; ========== Set the fill column ==========
(setq-default fill-column 78)


;; ===== Turn on Auto Fill mode automatically in all modes =====
;;   Auto-fill-mode the the automatic wrapping of lines and insertion of
;; newlines when the cursor goes over the column limit.
;;   This should actually turn on auto-fill-mode by default in all major
;; modes. The other way to do this is to turn on the fill for specific modes
;; via hooks.
(setq auto-fill-mode 1)


;; Show trailing whitespace
(setq show-trailing-whitespace 1)


;; ...
; (define-globalized-minor-mode global-hs-minor-mode
;   hs-minor-mode hs-minor-mode)
; (global-hs-minor-mode 1)


;; ===== Make Text mode the default mode for new buffers =====
; (setq default-major-mode 'text-mode)


;; ========= Set colours ==========
;; Set cursor and mouse-pointer colours
;(set-cursor-color "red")
;(set-mouse-color "goldenrod")
;; Set region background colour
;(set-face-background 'region "blue")
;; Set emacs background colour
;(set-background-color "black")
;; Set comment color
;(set-face-foreground 'font-lock-comment-face "red")


;; nuke-line
;(require 'nuke-line)
;; (autoload function filename docstring interactive type)
(autoload 'nuke-line "nuke-line" "Kill an entire line, including the trailing newline character" t)
(global-set-key (kbd "M-K") 'nuke-line)
(global-set-key [f8] 'nuke-line)


;;;; Format-specific stuff. 
;;; python-mode
(setq py-shell-name "ipython")
;; XXX: do not start python shell on it?
;(autoload 'python-mode "python-mode" "Python Mode." t) 
;(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
;;; cython-mode
(autoload 'cython-mode "cython-mode" "Mode for editing Cython source files")
(add-to-list 'auto-mode-alist '("\\.pyx\\'" . cython-mode))
(add-to-list 'auto-mode-alist '("\\.pxd\\'" . cython-mode))
(add-to-list 'auto-mode-alist '("\\.pxi\\'" . cython-mode))
;;; lua-mode
(autoload 'lua-mode "lua-mode" "Mode for editing LUA source files")
(add-to-list 'auto-mode-alist '("\\.lua\\'" . lua-mode))
;;; Octave/matlab
(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))
;;; coffee
(autoload 'coffee-mode "coffee-mode" "Coffee Mode." t)
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))
;;; yaml
(autoload 'yaml-mode "yaml-mode" "YAML Mode." t)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))
;;;; NOTE: disable vc (Version Control) autodetect
(require 'vc)
(remove-hook 'find-file-hooks 'vc-find-file-hook)
(eval-after-load "vc" '(remove-hook 'find-file-hooks 'vc-find-file-hook))

(load (expand-file-name "jhamrick_emacs/.emacs" user-emacs-directory) nil t)
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(load (expand-file-name "submodules2.el" user-emacs-directory) nil t)

(byte-recompile-directory (expand-file-name "~/.emacs.d") 0)
