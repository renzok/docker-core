(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(column-number-mode t)
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-mode t nil (cua-base))
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(current-language-environment "UTF-8")
 '(custom-enabled-themes (quote (deeper-blue)))
 '(custom-safe-themes
   (quote
    ("a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(fci-rule-color "#eee8d5")
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#fdf6e3" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#586e75")
 '(highlight-tail-colors
   (quote
    (("#eee8d5" . 0)
     ("#B4C342" . 20)
     ("#69CABF" . 30)
     ("#69B7F0" . 50)
     ("#DEB542" . 60)
     ("#F2804F" . 70)
     ("#F771AC" . 85)
     ("#eee8d5" . 100))))
 '(hl-bg-colors
   (quote
    ("#DEB542" "#F2804F" "#FF6E64" "#F771AC" "#9EA0E5" "#69B7F0" "#69CABF" "#B4C342")))
 '(hl-fg-colors
   (quote
    ("#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3")))
 '(inhibit-startup-screen t)
 '(magit-diff-use-overlays nil)
 '(nxml-slash-auto-complete-flag t)
 '(pos-tip-background-color "#eee8d5")
 '(pos-tip-foreground-color "#586e75")
 '(save-place t nil (saveplace))
 '(show-paren-mode t)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify)))
 '(uniquify-buffer-name-style (quote forward) nil (uniquify))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#c85d17")
     (60 . "#be730b")
     (80 . "#b58900")
     (100 . "#a58e00")
     (120 . "#9d9100")
     (140 . "#959300")
     (160 . "#8d9600")
     (180 . "#859900")
     (200 . "#669b32")
     (220 . "#579d4c")
     (240 . "#489e65")
     (260 . "#399f7e")
     (280 . "#2aa198")
     (300 . "#2898af")
     (320 . "#2793ba")
     (340 . "#268fc6")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#fdf6e3" "#eee8d5" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#657b83" "#839496"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

 (setq inhibit-startup-message   t)   ; Don't want any startup message
;;(setq make-backup-files         nil) ; Don't want any backup files
(setq auto-save-list-file-name  nil) ; Don't want any .saves files
;;(setq auto-save-default         nil) ; Don't want any auto saving

(setq search-highlight           t) ; Highlight search object
(setq query-replace-highlight    t) ; Highlight query object
(setq mouse-sel-retain-highlight t) ; Keep mouse high-lightening

;;(set-face-background 'region "yellow") ; Set region background color
;;(set-background-color        "wheat2") ; Set emacs bg color 




;; To go to a specific line can be useful, especially when Emacs is
;; used for programming. This common function can be bound to Ctrl-L
;; by:
(global-set-key "\C-l" 'goto-line) ; [Ctrl]-[L] 


;; save backup files and auo-save in tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))


;; now all about skeleton
(require 'skeleton)
  (define-skeleton skel-hello-world
      "Write a greeting"
      "Type name of user: "
      "hello, " str "!")

  (define-skeleton sql-sql-table-comment
      "Write a table comment"
      "Type name of table: "
      "COMMENT ON TABLE " str " IS '"
       ("ENTER comment: " str )
       "';" 
      \n >
  )

  (define-skeleton sql-sql-column-comment
      "Write a table comment"
      "Type name of table: "
      "COMMENT ON COLUMN " str 
      "."
      (skeleton-read "Column name : " ) 
      " IS '"
      (skeleton-read "Comment: " )
       "';" 
      \n >
  )

  (define-skeleton skel-sql-curation-trigger
      "Create a curation trigger"
      "Type name of column: "
      "COMMENT ON COLUMN " str 
      "."
      (skeleton-read "Column name : " ) 
      " IS '"
      (skeleton-read "Comment: " )
       "';" 
      \n >
  )


;;; example fo reading sevearl vars
  (define-skeleton read-two-vars
      "Prompt the user for two variables, and use them in a skeleton."
      ""
      > "variable A is " (setq v1 (skeleton-read "Variable A? ")) \n
      > "variable B is " (setq v2 (skeleton-read "Variable B? ")) \n
      > "A: " v1 "    B: " v2 \n
      variable A is avl
      variable B is bvl
      A: avl    B: bvl

      )

  (define-skeleton skel-curation-destination-table
      "Prompt the user for two variables, and use them in a skeleton."
      ""
     "-- Trigger on column: " (setq v1 (skeleton-read "Column Name? "))
     "-- for update on table: " (setq v2 (skeleton-read "Destination Table B? "))
     " column " (setq v3 (skeleton-read "Destination Column B? ")) \n
      > "CREATE TRIGGER "v1"_u" \n
      > "   BEFORE UPDATE OF "v1 \n
      > "   ON osdregistry.curation_submissions" \n
      > "   FOR EACH ROW" \n
      > "   WHEN (NEW."v1" <> OLD."v1")" \n
      > "   EXECUTE PROCEDURE " \n
      > "   generic_curation_submissions_col_update_trg('"v1"','"v2"','"v3"');"
      )

(setq el-get-github-default-url-type 'https)
(setq url-http-attempt-keepalives nil)


;; taken from https://melpa.org/#/getting-started
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line
