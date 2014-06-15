;;load-path add 
(defun add-to-load-path(&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
	      (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
	(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
	    (normal-top-level-add-subdirs-to-load-path))))))

(add-to-load-path "elisp" "conf" "public_repos")

;;cl package load
(require 'cl)

;;php-mode load
(when (require 'php-mode nil t)
  (add-to-list 'auto-mode-alist '("\\.ctp\\'" . php-mode))
  (setq php-serch-url "http://jp.php.net/ja/")
  (setq php-serch-url "http://jp.php.net/manual/ja/"))

;;php-mode indent
(defun php-indent-hook ()
  (setq indent-tabs-mode nil)
  (setq c-bassic-offset 4)
  
;; (c-set-offset 'case-label '+) ;
(c-set-offset 'arglist-intro '+) ;
(c-set-offset 'arglist-close '+)) ;

(add-hook 'php-mode-hook 'phpindent-hook)


;;auto-install 
(when (require 'auto-install nil t)
;;install-directory
  (setq auto-install-directory "~/.emacs.d/elisp/")
;;Emacs-wiki
  (auto-install-update-emacswiki-package-name t)
;;instakk-elisp
  (auto-install-compatibility-setup))


;;auto-complete init
(when (require 'auto-complete-config nil t)
  (add-to-list 'ac-dictionary-directories
	       "~/.emacs/elisp/ac/dict")
  (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
  (ac-config-default))

;;twittering mode
(add-to-list 'load-path (expand-file-name "~/.emacs.d/elisp"))
(require 'twittering-mode)
(setq twittering-status-format "%i @%s %S %p: n %T
[%@]%r %R %f%Ln--------------------------------------")

(setq twittering-icon-mode t)
(setq twittering-convert-fix-size 40)
(setq twittering-timer-interval 40)

(setq twittering-account-authorization 'authorized)
(setq twittering-oauth-access-token-alist
      '(("oauth_token" . "288785464-jiCFbNG8aas7YrrMSEcygnwZFbeJuQZGpzDxiiKi")
	("oauth_token_secret" . "PzVip8tuUlIIXsgCyXEFVtCCt23NsP5axIEsJ6MmirnrR")
	("user_id" . "288785464")
	("screen_name" . "fran_vell")))


;;color-moccur config
(when (require 'color-moccur nil t)

;;M-o is occur-by-moccur
(define-key global-map (kbd "M-o") 'occur-by-moccur)
;;SPC AND serch
(setq moccur-split-word t)
;;directory serch
(add-to-list 'dmoccur-exclusion-mask "\\.DS_Store")
(add-to-list 'dmoccur-exclusion-mask "^#.+#$")
;;Migemo use
(when (and (executable-find "cmigemo")
	   (require 'migemo nil t))
  (setq moccur-use-migemo t)))

;;Moccure-edit conf
(require 'moccur-edit nil t)
