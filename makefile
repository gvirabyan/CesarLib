all:
	g++ -Iinc -fPIC -c src/encoder.cpp -o obj/encoder.o
	g++ -Iinc -fPIC -c src/decoder.cpp -o obj/decoder.o
	g++ -Iinc -c src/main.cpp -o obj/main.o
	g++ -shared obj/encoder.o obj/decoder.o -o lib/libcesar.so
	g++ obj/main.o -Llib -lcesar -Wl,-rpath=./lib -o bin/main.out

run:
	LD_LIBRARY_PATH=lib ./bin/main.out

clean:
	rm -rf obj/*.o lib/*.so bin/*

