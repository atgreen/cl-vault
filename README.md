<img src="images/rlgl.svg.png" align="right" />

# cl-vault
> Simple Common Lisp convenience functions for accessing hashicorp vault.

cl-vault currently consists of a single convenience function for
extracting secrets from [hashicorp vault](https://www.vaultproject.io/): `FETCH-VAULT-SECRETS`.  Use it
like so:

    * (cl-vault:fetch-vault-secrets "https://vault.example.com:8200/v1/secret/my-secret"
                                    "mytoken0-0000-0000-0000-000000000000")
    ((:+MY-USERNAME+ . "myusername")
     (:+MY-PASSWORD+ . "Bond007"))


`FETCH-VAULT-SECRETS` returns an alist of [cl-json](https://common-lisp.net/project/cl-json/cl-json.html) parsed secrets.

Author and License
-------------------

cl-vault was written by [Anthony
Green](https://github.com/atgreen), and is distributed under the terms
of the GNU Affero General Public License, Version 3.  See
[COPYING](https://raw.githubusercontent.com/atgreen/cl-vault/master/COPYING)
for details.
