# Ubuild
Recursively building a source tree.

This demo implements a __very__ simplified Kbuild system.
It allows the programmer to govern the source build using Kbuild
makefiles in different source directories much like that of the Linux kernel's
Kbuild system.

Though the Ubuild system creates two lists obj-m and obj-y as in the case of
Kbuild, it essentially treats them both as Y configs.

CONFIG_XXX=[y|m] entries are set in file: config.

The following source directory tree is used to demonstrate Ubuild:

```
.
├── a
│   ├── Kbuild
│   └── test_a.c
├── b
│   ├── c
│   │   ├── Kbuild
│   │   └── test_c.c
│   ├── d
│   │   ├── Kbuild
│   │   ├── test_d1.c
│   │   └── test_d2.c
│   ├── Kbuild
│   └── test_b.c
├── config
├── Kbuild
├── Makefile
├── Makefile.build
└── test.c
```

##Build
- The Kbuild in directory a adds test_a.o to the obj-y list.
- The Kbuild in directory b adds test_b.o to the obj-y list and
  points Ubuild to descend down directories c and d and build them too.
- The Kbuild in directory b/c adds test_c.o to the obj-m list.
- The Kbuild in directory b/d adds test_d.o to the obj-y list, where
  test_d.o is a composite object file created from test_d1.o and test_d2.o.

##Clean
There are recursive clean and cleanall targets for cleaning all object files
and other muck.

