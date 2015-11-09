;;; packages.el --- ygmisc Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; List of all packages to install and/or initialize. Built-in packages
;; which require an initialization must be listed explicitly in the list.
(setq ygmisc-packages
    '(
      auto-capitalize
      beacon
      ;; relative-line-numbers
      ;; bbdb-china
      cal-china-x
      ;; smartparens
      ;; smartparens-config
      ;; evil-cleverparens
      sr-speedbar
      bbyac
      youdao-dictionary
      evil-quickscope
      ;; calfw-cal
      ;; calfw-ical
      ;; calfw-org
      ;; ob-gnuplot
      ;; ob-dot
      ;; ob-ditaa
      ;; ob-plantuml
      ;; ob-ipython
      ;; ox-revel
      ;; ox-publish
      ;; ox-latex
      chinese-fonts-setup
      ob-ipython
      ;; package names go here
      helm-fuzzier
      quickrun
      moe-theme
      org-autolist
      helm-zhihu-daily
      
      ))
(add-hook 'org-mode-hook 'evil-org-mode)
;; List of packages to exclude.
(setq ygmisc-excluded-packages '())


;; For each package, define a function ygmisc/init-<package-name>
;;
(defun ygmisc/init-chinese-fonts-setup ()
  (use-package chinese-fonts-setup
:config
(progn
(define-key global-map (kbd "C-=") 'cfs-increase-fontsize)
(define-key global-map (kbd "C--") 'cfs-decrease-fontsize)
))
   ) 
(defun ygmisc/init-helm-fuzzier ()
  (use-package helm-fuzzier
    :config
    (progn
      (setq helm-M-x-fuzzy-match t)
      (setq helm-mode-fuzzy-match t)
      (helm-fuzzier-mode 1)
      ))
  )
(defun ygmisc/init-beacon ()
  (use-package beacon 
    :config
    (progn
      (beacon-mode 1)
      ))
  )


(defun ygmisc/init-evil-quickscope ()
  (use-package evil-quickscope 
    :config
    (progn

      (add-hook 'prog-mode-hook 'evil-quickscope-mode)
      (add-hook 'text-mode-hook 'evil-quickscope-mode)
      ))
  )
(defun ygmisc/init-helm-zhihu-daily ()
  (use-package helm-zhihu-daily
      )
  )

(defun ygmisc/init-cal-china-x ()
  (use-package cal-china-x
    :config
    (progn

      (setq mark-holidays-in-calendar t)
      (setq cal-china-x-important-holidays cal-china-x-chinese-holidays)
      (setq calendar-holidays cal-china-x-important-holidays)
      ))
  )

(defun ygmisc/init-youdao-dictionary ()
  (use-package youdao-dictionary
    :config
    (progn
      (setq youdao-dictionary-use-chinese-word-segmentation t)
      (setq url-automatic-caching t)
      (evil-leader/set-key "oc" 'youdao-dictionary-search-at-point+)

      ))
  )
(defun ygmisc/init-sr-speedbar ()
  (use-package sr-speedbar
    :config
    (progn

      (setq speedbar-use-images nil)
      (setq speedbar-update-flag nil)
      (setq sr-speedbar-right-side nil)  
      (setq speedbar-show-unknown-files t) 
      )
    )
   ) 
(defun ygmisc/init-auto-capitalize ()
  (use-package auto-capitalize)
  )
(defun ygmisc/init-ob-ipython ()
  (use-package ob-ipython)
  )
(defun ygmisc/init-bbyac ()
  (use-package bbyac
    :config
    (progn
      (evil-define-key 'insert bbyac-mode-map
        "\C-w" 'bbyac-expand-symbols
        "\C-s" 'bbyac-expand-partial-lines
        "\C-e" 'ac-complete-ispell
        "\C-l" 'bbyac-expand-lines)
      (bbyac-global-mode t)
      ))
  )
(defun ygmisc/init-moe-theme ()
  (use-package moe-theme
:config
(progn
 (moe-theme-set-color 'green)
;;(moe-dark)
;;(set-background-color "#000000")
;;(powerline-moe-theme)

))
  )
(defun ygmisc/init-quickrun ()
  (use-package quickrun
    :config
    (evil-leader/set-key "or" 'quickrun)
    )
  )
(defun ygmisc/init-org-autolist ()
  (use-package org-autolist
    :config
    (progn
      (evil-define-key 'normal evil-org-mode-map "T" 'org-toggle-checkbox)
      ))
  )
;;
;; often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
