runtime! ftplugin/python_yapf.vim

describe 'Yapf'
    it "is loaded"
        Expect g:loaded_yapf == 1
    end

    it "reformats the example file"
        edit t/goodexample.py
        call Yapf()
        Expect getline(8) == "class foo(object):"
    end
end
