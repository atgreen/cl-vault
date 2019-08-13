;;; -*- Mode: LISP; Syntax: COMMON-LISP; Package: CL; Base: 10 -*-
;;;
;;; Copyright (C) 2019  Anthony Green <green@moxielogic.com>
;;;                         
;;; This program is free software: you can redistribute it and/or
;;; modify it under the terms of the GNU Affero General Public License
;;; as published by the Free Software Foundation, either version 3 of
;;; the License, or (at your option) any later version.
;;;
;;; This program is distributed in the hope that it will be useful,
;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;;; Affero General Public License for more details.
;;;
;;; You should have received a copy of the GNU Affero General Public
;;; License along with this program.  If not, see
;;; <http://www.gnu.org/licenses/>.

(asdf:defsystem #:cl-vault
  :description "Convenience routines for accessing hashicorp vault"
  :author "Anthony Green <green@moxielogic.com>"
  :license "AGPL"
  :depends-on (#:drakma #:cl-json #:flexi-streams)
  :serial t
  :components ((:file "package")
               (:file "vault")))

