runtime! ftplugin/python_yapf.vim

describe 'Yapf'
    it "is loaded"
        Expect g:loaded_yapf == 1
    end
end
