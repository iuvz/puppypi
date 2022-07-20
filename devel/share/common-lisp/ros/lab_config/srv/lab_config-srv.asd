
(cl:in-package :asdf)

(defsystem "lab_config-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "ChangeRange" :depends-on ("_package_ChangeRange"))
    (:file "_package_ChangeRange" :depends-on ("_package"))
    (:file "GetAllColorName" :depends-on ("_package_GetAllColorName"))
    (:file "_package_GetAllColorName" :depends-on ("_package"))
    (:file "GetRange" :depends-on ("_package_GetRange"))
    (:file "_package_GetRange" :depends-on ("_package"))
    (:file "StashRange" :depends-on ("_package_StashRange"))
    (:file "_package_StashRange" :depends-on ("_package"))
  ))