;;; -*- Mode: LISP; Syntax: COMMON-LISP; Package: CL-VAULT; Base: 10 -*-
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

;; Top level for cl-vault

(in-package :cl-vault)

(defun fetch-vault-secrets (url token)
  "Return an alist of secrets from hashicorp vault at URL using TOKEN"
  (check-type url (and string (not null)))
  (check-type token (and string (not null)))
  (cdr
   (assoc :data
	  (json:decode-json-from-string
	   (handler-case
	       (multiple-value-bind (body response-code)
		   (drakma:http-request url :additional-headers (list (cons "X-Vault-Token" token)))
		 (case response-code
		   (200 (flexi-streams:octets-to-string body))
		   (t (error "http response code ~A" response-code))))
	     (error (condition)
	       (error "error fetching secrets from '~A': ~A" url condition)))))))
