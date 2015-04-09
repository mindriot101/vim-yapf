========================
vim-yapf
========================

vim-yapf is a Vim plugin that applies yapf to your current file.
yapf automatically formats Python code, based on improved syntax styles.

Required
=====================

* `yapf <https://pypi.python.org/pypi/yapf/>`_

Installation
=====================

Simply put the contents of this repository in your ~/.vim/bundle directory.

Bindings
=====================

The plugin does not create any bindings by default, this is left up to the user. An example could be:


::

 :nnoremap <leader>y :call Yapf()<cr>

or

::

 :nnoremap <leader>y :Yapf<cr>



Usage
=====================

call function

::

 :Yapf

with arguments

::

 :Yapf --style google

or

::

 :call Yapf(" --style pep8")

Customization
=====================

The yapf style can be globally set, in your vimrc:

::

 let g:yapf_style = "google"

or

::

 let g:yapf_style = "pep8"
