
(cl:in-package :asdf)

(defsystem "puppy_control-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "SetRunActionName" :depends-on ("_package_SetRunActionName"))
    (:file "_package_SetRunActionName" :depends-on ("_package"))
  ))