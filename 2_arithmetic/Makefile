CFLAGS := -Wall -g -Werror
CC := clang
BUILD_DIR := ./build
SRC_DIR := ./src

main: main.o square.o
	$(CC) $(CFLAGS) -o $(BUILD_DIR)/main $(BUILD_DIR)/main.o $(BUILD_DIR)/hello.o

main.o: $(SRC_DIR)/main.c
	mkdir -p $(BUILD_DIR)
	$(CC) $(CFLAGS) -c $(SRC_DIR)/main.c -o $(BUILD_DIR)/main.o

square.o: $(SRC_DIR)/square.s
	mkdir -p $(BUILD_DIR)
	$(CC) $(CFLAGS) -c $(SRC_DIR)/square.s -o $(BUILD_DIR)/hello.o

.PHONY: clean
clean:
	rm -r $(BUILD_DIR)
