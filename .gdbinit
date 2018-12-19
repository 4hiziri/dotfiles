set disassembly-flavor intel
set follow-fork-mode child
set history save on
set history filename ~/.gdb_history
set history size 32768
set history expansion on



define init-peda
  source /home/tkgsy/src/peda/peda.py
end
document init-peda
  Initializes the PEDA (Python Exploit Development Assistant for GDB) framework
end

define init-pwndbg
  source /home/tkgsy/src/pwndbg/gdbinit.py
end
document init-pwndbg
  Initializes the PwnDBG
end
