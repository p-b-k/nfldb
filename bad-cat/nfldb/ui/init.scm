(define-module (bad-cat nfldb ui init)
  #:use-module (oop goops)
  #:use-module (g-golf)
  
  #:duplicates (merge-generics replace warn-override-core warn last)
)


(eval-when (expand load eval)
  (g-irepository-require "Gtk" #:version "4.0")

; (for-each (lambda (name) (gi-import-by-name "Gio" name))
;     '("SimpleActionGroup" "SimpleAction" "ActionMap"))

  (for-each (lambda (name) (gi-import-by-name "Gio" name))
            '("MenuModel"
              "Action"
              "Resource"))

  (for-each (lambda (name) (gi-import-by-name "Gdk" name))
            '("ModifierType"))

  (for-each (lambda (name) (gi-import-by-name "Gtk" name))
            '("Application"
              "ApplicationWindow"
              "Button"
              "CallbackAction"
              "CssProvider"
              "Box"
              "FlowBox"
              "Grid"
              "Image"
              "Label"
;             "KeyvalTrigger"
              "ListBox"
;             "NamedAction"
              "ScrolledWindow"
;             "Shortcut"
;             "ShortcutController"
;             "ShortcutScope"
              "SignalAction"
              "Text"
              "ToggleButton"
            )))

(g-resources-register (g-resource-load (format #f "~a/~a" (getenv "NFLDB_DIR") "nfldb.gresource")))

