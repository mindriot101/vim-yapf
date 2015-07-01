========================
vim-yapf
========================

.. image:: https://badges.gitter.im/Join%20Chat.svg
   :alt: Join the chat at https://gitter.im/mindriot101/vim-yapf
   :target: https://gitter.im/mindriot101/vim-yapf?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge

**ATTENTION:** you probably don't need this plugin! See `Why you may not need this plugin`_.

``vim-yapf`` is a Vim plugin that applies yapf to your current file.
``yapf`` automatically formats Python code, based on improved syntax styles.


Required
=====================

* `yapf <https://pypi.python.org/pypi/yapf/>`_

``yapf`` can be installed either with ``pip``:

::

 pip install yapf

or by installing with conda (OSX and linux64 only) with my binstar channel:

::

 conda install -c https://conda.binstar.org/srwalker101 yapf

Installation
=====================

Either use a plugin manager and add ``Plug[in] 'mindriot101/vim-yapf'`` to your ``vimrc``, or use pathogen.

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

Why you may not need this plugin
================================

The plugin itself is very simple. It handles user options granted, but at its core it uses ex commands to perform its magic. ``yapf`` behaves like a good unix command: it takes text on ``stdin`` and spits the altered result to ``stdout``, which is exactly what vim expects.

At its core, this plugin runs the ex command:

::

 0,$!yapf

This pipes the range ``0,$`` i.e. the whole file through a shell command ``yapf`` and replaces the range with the altered result.

Instead of installing this plugin, one could add a mapping e.g.:

::

 autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr>

Alternatively yapf could be set as the ``formatprg`` for the python filetype, and reformatting can be performed with the `gq{motion}`_ operator (e.g. with visual selection) to reformat a part of the file. *On the other hand this really flies in the face of what ``yapf`` is designed for, that is an executable style guide for all Python code*.

.. _gq{motion}: https://github.com/vim/vim/blob/b182b40080a23ea1e1ffa28ea03b412174a236bb/runtime/doc/change.txt#L1299
