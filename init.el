; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;============================================================================================
; 增强package系统
;(require 'cl)
; add whatever packages you want here
;(defvar zhangweiqian/packages '(
;			company
;) "Default packages")

;(defun zhangweiqian/packages-installed-p ()
;  (loop for pkg in zhangweiqian/packages
;	when (not (package-installed-p pkg)) do (return nil)
;	finally (return t)))

;(unless (zhangweiqian/packages-installed-p)
;  (message "%s" "Refreshing package databases...")
;  (package-refresh-contents)
;  (dolist (pkg zhangweiqian/packages)
;    (when (not (package-installed-p pkg))
;      (package-install pkg))))		     
;============================================================================================

; turn off tool-bar
(tool-bar-mode -1)
; turn off scroll-bar
(scroll-bar-mode -1)
(electric-indent-mode -1)
; 关闭默认Emacs的初始欢迎页面
(setq-default inhibit-splash-screen t)
; 打开行号
(global-linum-mode 1)
(setq linum-format "%-4d|")

(defun open-my-init-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
; 按F6直接编辑init.el
(global-set-key (kbd "<f5>") 'open-my-init-file)

; package
(require 'package)
(require 'json)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("elpy" . "http://jorgenschaefer.github.io/packages/"))
(package-initialize)

; 关闭自动备份
(setq make-backup-files nil)

; org模式中开启对SRC的高亮
(require 'org)
(setq org-src-fontify-natively t)

; 自动补全
(global-company-mode t)

; 修改光标样式
(setq-default cursor-type 'bar)

; recentf 最近更改的文件 配置
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files) ; C-x C-r 显示最近打开的文件

; 选中键入替换
(delete-selection-mode t)

; 高亮匹配的括号
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

; 全屏初始化
(setq initial-frame-alist (quote ((fullscreen . maximized))))

; 高亮当前行
(global-hl-line-mode t)

; theme
(load-theme 'monokai t)

; hungry delete
(require 'hungry-delete)
(global-hungry-delete-mode)

; smex - 增强M-x
; 没有counsel提供的M-x增强好用
; (global-set-key (kbd "M-x") 'smex)
;(global-set-key (kbd "M-x") 'smex-major-mode-commands)

; swiper 增强搜索
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key read-expression-map (kbd "C-r") 'counsel-expression-history)

(smartparens-global-mode t)

(setq auto-mode-alist
      (append 
       '(("\\.js\\'" . js2-mode))
	      auto-mode-alist)
)

; let emacs could find the exec
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

; org-mode agenda
(setq org-agenda-files '("~/org"))
(global-set-key (kbd "C-c a") 'org-agenda)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.05)
 '(company-minimum-prefix-length 1)
 '(company-tooltip-idle-delay 0.08)
 '(package-selected-packages
   (quote
    (exec-path-from-shell nodejs-repl js2-mode evil-smartparens counsel swiper smex ample-zen-theme ahungry-theme abyss-theme hungry-delete monokai-theme scala-mode ensime company auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
