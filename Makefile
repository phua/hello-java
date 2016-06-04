# JAVAC=/usr/bin/javac
JASMIN=java -jar $(HOME)/local/jasmin-2.4/jasmin.jar
JAD=$(HOME)/local/bin/jad_static
CFR=java -jar $(HOME)/local/jars/cfr.jar

# SOURCES=$(wildcard src/main/java/**/*.java)
SOURCES=$(shell find src/main/java -name \*.java)

all: compile disassemble decompile

compile:
	mkdir -p target/main/classes
	javac -d target/main/classes $(SOURCES)

	mkdir -p target/jasmin/classes
	$(JASMIN) -d target/jasmin/classes src/main/jasmin/HelloWorld.j

dist: compile
	mkdir -p target
	jar cf target/HelloWorld-$(shell date +%Y%m%d).jar -C target/main/classes .

disassemble: compile
	javap -verbose target/jasmin/classes/HelloWorld.class > target/jasmin/HelloWorld.p

decompile: compile
	$(JAD) target/jasmin/classes/HelloWorld
	mv HelloWorld.jad target/jasmin/HelloWorld.jad
	$(CFR) target/jasmin/classes/HelloWorld > target/jasmin/HelloWorld.cfr

clean:
	rm -rf target
