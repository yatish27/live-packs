;; User pack init file
;;
;; Use this file to initiate the pack configuration.
;; See README for more information.

;; Load bindings config
(live-load-config-file "bindings.el")
(live-load-config-file "go-autocomplete.el")
(live-set-default-font "monaco 12")
(global-font-lock-mode 1)

;; Glabal settings
;; Themes
;; (load-theme 'cyberpunk t)
;;Need to Change this for debian
(setq default-directory "/Users/yatish")

;;(set-default-font "monaco 12")
(setq default-tab-width 2)

(require 'textmate)

(require 'rvm)
(rvm-use-default)

(require 'yasnippet)
(yas-global-mode 1)

(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

(require 'scss-mode)
(setq scss-indent-offset 2)

(require 'auto-complete)
(global-auto-complete-mode t)
(require 'auto-complete-config)
;;(add-to-list 'ac-dictionary-directories "/.emacs.d//ac-dict")
(ac-config-default)

;; splash screentext
(setq inhibit-splash-screen t)

(auto-complete 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(setq ido-show-dot-for-dired t)
(ido-vertical-mode)

(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;; stop creating ~ files
(setq make-backup-files nil)

;; Open in full size
;;(require 'maxframe)
;;(add-hook 'window-setup-hook 'maximize-frame t)

;; switch between windows key bindings#TODO need proper keybindings
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)

;; Project Explorer(vendor)
(require 'dirtree)

;;Projectile Configs
(require 'projectile)
(require 'grizzl)
(projectile-global-mode)
;;(setq projectile-enable-caching t)
(setq projectile-completion-system 'grizzl)
;; Press Command-p for fuzzy find in project
(global-set-key (kbd "s-p") 'projectile-find-file)
;; Press Command-b for fuzzy switch buffer
(global-set-key (kbd "s-b") 'projectile-switch-to-buffer)


(require 'go-mode-load)
(require 'go-mode)

(setenv "GOPATH" "~/Development/gocode")
(require 'go-autocomplete)

(require 'auto-complete-config)
(setq exec-path (cons "/usr/local/go/bin" exec-path))
(add-to-list 'exec-path "~/Development/gocode/bin")

(defun my-go-mode-hook ()
  ;; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
  ;; Customize compile command to run go build
  ;; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump))
(add-hook 'go-mode-hook 'my-go-mode-hook)



(require 'rubocop)
;;(global-linum-mode t)
