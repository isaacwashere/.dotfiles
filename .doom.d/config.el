;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-material)
;; (setq doom-theme 'one-dark)
;; (setq doom-theme 'atom-one-dark)
(setq echo-keystrokes 0.01)

(if (display-graphic-p)
    (setq doom-theme 'atom-one-dark)
    ;; (setq doom-theme 'doom-gruvbox)
  (setq doom-theme 'doom-gruvbox))

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;;

(use-package wakatime-mode)

(setq confirm-kill-emacs nil)

(global-wakatime-mode)

(setq indent-tabs-mode nil)
(setq tab-width 2)

(setq lsp-ui-sideline-enable nil)

(use-package golden-ratio
  :after-call pre-command-hook
  :config
  (golden-ratio-mode +1)
  (remove-hook 'window-configuration-change-hook #'golden-ratio)
  (add-hook 'doom-switch-window-hook #'golden-ratio))

(use-package lsp-mode
  :hook (rjsx-mode . lsp)
  :custom
  (lsp-clients-typescript-server-args '("--stdio" "--tsserver-log-file" "/dev/stderr"))
)


;; (global-whitespace-mode 1)
;; (setq whitespace-display-mappings
;;   '(
;;     (space-mark   ?\     [?·] [?.])
;;     (newline-mark ?\n    [?$ ?\n])
;;     (tab-mark     ?\t    [?\u00BB ?\t] [?\\ ?\t])
;;     ))
;; (setq whitespace-style (quote (face spaces tabs newline space-mark tab-mark newline-mark)))
;; (set-face-attribute 'whitespace-space nil :background nil :foreground "#2e3138") 
;;   ;;gray30, atom comment color: #5C6370, #40454e
;;   ;;  for setting this color in future:
;;   ;;    1st - Get the hex color code used as the comment
;;   ;;    2nd - go https://www.color-hex.com/color/{colorCode}
;;   ;;    3rd - Move 5 colors to the right, and use that code
;; (set-face-attribute 'whitespace-tab nil :background nil :foreground "#2e3138")
;; (set-face-attribute 'whitespace-newline nil :background nil :foreground "#2e3138")

;; (after! typescript-mode
;;   (setq lsp-clients-typescript-server "/usr/bin/typescript-language-server"))