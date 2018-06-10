SRC = $(shell find . -maxdepth 1 -name "*.md" | sort)
plots = $(shell find ./gnuplots)


OUT = Out

all : $(OUT).pdf

$(OUT).pdf : $(SRC) 
	pandoc -o$@ --pdf-engine=xelatex  $(SRC)
	
$(OUT).docx : $(SRC)
	pandoc -o$@ $(SRC)

view : $(OUT)
	rifle $(OUT).pdf
