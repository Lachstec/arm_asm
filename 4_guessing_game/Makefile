
game: guessing_game.o
	ld -o game guessing_game.o -lSystem -lc -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64

guessing_game.o: guessing_game.s
	as -arch arm64 -o guessing_game.o guessing_game.s

.PHONY: clean
clean:
	rm game guessing_game.o
