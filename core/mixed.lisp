(in-package :cl)
(defpackage :lime/core/mixed
  (:use :cl)
  (:import-from :lime/core/dictionary dictionary convert)
  (:export mixed-dictionary))
(in-package :lime/core/mixed)

(defclass mixed-dictionary (dictionary)
  ((dictionaries :initarg :dictionaries :reader dictionaries)))

(defmethod convert append ((d mixed-dictionary) (s string))
  (apply #'append (mapcar (lambda (d) (convert d s)) (dictionaries d))))
