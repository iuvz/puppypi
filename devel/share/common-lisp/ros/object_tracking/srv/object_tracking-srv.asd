
(cl:in-package :asdf)

(defsystem "object_tracking-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "SetTarget" :depends-on ("_package_SetTarget"))
    (:file "_package_SetTarget" :depends-on ("_package"))
  ))