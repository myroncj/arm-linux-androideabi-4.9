/* Default linker script, for normal executables */
/* Modified for Android.  */
/* Copyright (C) 2014 Free Software Foundation, Inc.
   Copying and distribution of this script, with or without modification,
   are permitted in any medium without royalty provided the copyright
   notice and this notice are preserved.  */
OUTPUT_FORMAT("coff-m88kbcs")
OUTPUT_ARCH(m88k)
ENTRY (__start)
SECTIONS
{
  .text  (0x20007 + SIZEOF_HEADERS) &~ 7 :
    {
       __.text.start = .;
       __.init.start = .;
       *(.init)
       __.init.end = .;
      *(.text)
       __.tdesc_start = .;
       *(.tdesc)
       __.text_end = .	;
       __.initp.start = .;
       __.initp.end = .;
       __.fini_start = .;
       *(.fini)
       __.fini_end = .;
      _etext = .;
    }
  .data  NEXT (0x400000) + ((SIZEOF(.text) + ADDR(.text)) % 0x2000) :
    {
      *(.data)
      _edata  =  .;
    }
  .bss  SIZEOF(.data) + ADDR(.data) :
    {
      *(.bss)
      *(COMMON)
       _end = .;
       __end = .;
    }
  .comment  0 (NOLOAD) :
  {
    *(.comment)
  }
}
