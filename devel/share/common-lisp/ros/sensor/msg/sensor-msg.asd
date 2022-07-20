
(cl:in-package :asdf)

(defsystem "sensor-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Led" :depends-on ("_package_Led"))
    (:file "_package_Led" :depends-on ("_package"))
    (:file "Motor" :depends-on ("_package_Motor"))
    (:file "_package_Motor" :depends-on ("_package"))
    (:file "RGB" :depends-on ("_package_RGB"))
    (:file "_package_RGB" :depends-on ("_package"))
    (:file "Servo" :depends-on ("_package_Servo"))
    (:file "_package_Servo" :depends-on ("_package"))
  ))