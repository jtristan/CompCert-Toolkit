FILES=Axioms.v Coqlib.v Errors.v Integers.v \
      Floats.v AST.v Intv.v Values.v Memdata.v \
      Memtype.v  Memory.v  Maps.v Parmov.v \
      Globalenvs.v Events.v Smallstep.v UnionFind.v 

all: $(FILES:.v=.vo)

doc: $(FILES:.v=.glob)
	coqdoc --light --glob-from doc/ -d doc $(FILES)

clean: 
	rm *.vo
	rm doc/*

.SUFFIXES: .v .vo 

.v.vo:
	coqc -I . -dump-glob doc/$(*F).glob $*.v 

depend:
	coqdep -I . $(FILES) > .depend

include .depend