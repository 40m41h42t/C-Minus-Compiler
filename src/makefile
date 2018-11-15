out: scanner

scanner: lex.yy.c tokens.h
	gcc -o $@ $<

lex.yy.c: c-minus.l
	flex $<

clean:
	rm scanner *.c