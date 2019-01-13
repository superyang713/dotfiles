;;;;;;;;;;;;;;;;;;;;;;;;;;;;;initialization;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(package-initialize)
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://melpa.org/packages/"))

;; Save all tempfiles in $TMPDIR/emacs$UID/
(defconst emacs-tmp-dir
  (expand-file-name (format "emacs%d" (user-uid)) temporary-file-directory))
(setq backup-directory-alist `((".*" . ,emacs-tmp-dir)))
(setq auto-save-file-name-transforms `((".*" ,emacs-tmp-dir t)))
(setq auto-save-list-file-prefix emacs-tmp-dir)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;key bindings;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "M-p") 'ace-window)
(define-key global-map (kbd "C-,") 'ace-jump-mode)
(define-key global-map (kbd "C-.") 'ace-jump-char-mode)
(define-key global-map (kbd "C-m") 'ace-jump-line-mode)
(global-set-key (kbd "C-s") 'swiper)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Personalization;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq js-indent-level 2)    ;; indentation
(electric-pair-mode 1)      ;; insert Parenthesis by pair.
(add-hook 'text-mode-hook   ;; auto-paragraph-fill at length 80
	  '(lambda() (turn-on-auto-fill) (set-fill-column 80)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;Theme Customization;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load-theme 'spacemacs-dark t)               ;; Choose a theme
(set-face-attribute 'default nil :height 160);; set font size
(global-linum-mode t)                        ;; line number customization
(setq linum-format "%2d\u2502")
(setq column-number-mode t)        ;; show column number in the mode line
(setq inhibit-startup-message t)   ;; No splash screen

;; rainbow-delimiters that highlights delimiters
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; powerline mode line
(add-to-list 'load-path "~/.emacs.d/elpa/powerline")
(require 'powerline)
(powerline-default-theme)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Ivy customization;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Elpy config;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(elpy-enable)
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")
(setq python-indent-guess-indent-offset t)  
(setq python-indent-guess-indent-offset-verbose nil)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;Company Auto-completion;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'after-init-hook 'global-company-mode)
(with-eval-after-load 'company
  (add-to-list 'company-backends 'company-flow))
(setq company-idle-delay 0)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;Yasnippets config;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(yas-global-mode 1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Emmet mode;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
(add-hook 'emmet-mode-hook
	  (lambda () (setq emmet-indent-after-insert nil)))
(add-hook 'emmet-mode-hook
	  (lambda () (setq emmet-indentation 2))) ;; indent 2 spaces.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Projectile;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
