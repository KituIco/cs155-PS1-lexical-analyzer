# TUICO - CS 155 Lexical Analyzer 

This is a Lexical Analyzer. To compile the analyzer.lex source file, run

```
lex analyzer.lex
```

This would create lex.yy.c file. Then, compile lex.yy.c file by running

```
gcc lex.yy.c
```

After compiling the C program, it would either give a.exe or a.out. 
To test this executable file using the samples in this repo, run any of the following:

```
./a.exe sample.txt
./a.exe examples/bin_search.easy
./a.exe examples/hanoi.easy
./a.exe examples/insertion_sort.easy
./a.exe examples/list_invert.easy
./a.exe examples/reserved_test.easy
```