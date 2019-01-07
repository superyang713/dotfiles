;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(package-initialize)

(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://melpa.org/packages/"))

(elpy-enable)

;; No splash screen
(setq inhibit-startup-message t)

;; insert Parenthesis by pair.
(electric-pair-mode 1)

;; line number customization
(global-linum-mode t)
(setq linum-format "%2d\u2502")

;; show column number in the mode line
(setq column-number-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;Choose A Theme;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load-theme 'spacemacs-dark t)


;; place auto-saves and backups in the temp dir in both windows and linux
;; Save all tempfiles in $TMPDIR/emacs$UID/                                                        
(defconst emacs-tmp-dir (expand-file-name (format "emacs%d" (user-uid)) temporary-file-directory))
(setq backup-directory-alist
      `((".*" . ,emacs-tmp-dir)))
(setq auto-save-file-name-transforms
      `((".*" ,emacs-tmp-dir t)))
(setq auto-save-list-file-prefix
      emacs-tmp-dir)

;;;;;;;;;;;;;;;;;;;;;;;;Elpy config;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq python-shell-interpreter "jupyter"
      python-shell-interpreter-args "console --simple-prompt"
      python-shell-prompt-detect-failure-warning nil)
(add-to-list 'python-shell-completion-native-disabled-interpreters
             "jupyter")

;;;;;;;;;;;;;;;;;;;;;;;;key bindings;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "M-p") 'ace-window)

;;;;;;;;;;;;;;;;;;;;;;;;Company Auto-completion;;;;;;;;;;;;;;;;;
(add-hook 'after-init-hook 'global-company-mode)
(with-eval-after-load 'company
  (add-to-list 'company-backends 'company-flow))
