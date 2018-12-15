(package-initialize)

(require 'package)
(elpy-enable)
(add-to-list 'package-archives
             '("melpa-stable" . "https://melpa.org/packages/"))

;; choose a theme
(load-theme 'spacemacs-dark)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; show column number in the mode line
(setq column-number-mode t)

;; line number customization
(global-linum-mode t)
(setq linum-format "%2d\u2502")

;; insert Parenthesis by pair.
(electric-pair-mode 1)

;; hide menu bar
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

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
