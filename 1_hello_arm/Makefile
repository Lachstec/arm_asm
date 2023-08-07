CFLAGS := -Wall -g -Werror
CC := clang
BUILD_DIR := ./build
SRC_DIR := ./src

main: main.o hello.o
	$(CC) $(CFLAGS) -o $(BUILD_DIR)/main $(BUILD_DIR)/main.o $(BUILD_DIR)/hello.o

main.o: $(SRC_DIR)/main.c
	$(CC) $(CFLAGS) -c $(SRC_DIR)/main.c -o $(BUILD_DIR)/main.o

hello.o: $(SRC_DIR)/hello.s
	$(CC) $(CFLAGS) -c $(SRC_DIR)/hello.s -o $(BUILD_DIR)/hello.o

.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)/*.o $(BUILD_DIR)/main
