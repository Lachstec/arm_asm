CFLAGS := -Wall -g -Werror
CC := clang
BUILD_DIR := ./build
SRC_DIR := ./src

main: main.o shell.o
	$(CC) $(CFLAGS) -o $(BUILD_DIR)/main $(BUILD_DIR)/main.o $(BUILD_DIR)/shell.o

main.o: $(SRC_DIR)/main.c
	mkdir -p $(BUILD_DIR)
	$(CC) $(CFLAGS) -c $(SRC_DIR)/main.c -o $(BUILD_DIR)/main.o

shell.o: $(SRC_DIR)/shell.s
	mkdir -p $(BUILD_DIR)
	$(CC) $(CFLAGS) -c $(SRC_DIR)/shell.s -o $(BUILD_DIR)/shell.o

.PHONY: clean
clean:
	rm -r $(BUILD_DIR)
