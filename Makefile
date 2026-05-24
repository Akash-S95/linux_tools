CC = gcc

DEBUG_FLAGS = -Wall -g
RELEASE_FLAGS = -Wall -O2

BUILD_DIR = build
BIN_DIR = bin
INSTALL_DIR = bin/installed

all: directories myls mycat mycp

directories:
	mkdir -p $(BUILD_DIR)
	mkdir -p $(BIN_DIR)
	mkdir -p $(INSTALL_DIR)

myls:
	$(CC) $(DEBUG_FLAGS) \
	src/myls.c \
	-o $(BIN_DIR)/myls

mycat:
	$(CC) $(DEBUG_FLAGS) \
	src/mycat.c \
	src/utils.c \
	-Iinclude \
	-o $(BIN_DIR)/mycat

mycp:
	$(CC) $(DEBUG_FLAGS) \
	src/mycp.c \
	src/utils.c \
	-Iinclude \
	-o $(BIN_DIR)/mycp

debug:
	$(CC) $(DEBUG_FLAGS) \
	src/myls.c \
	-o $(BIN_DIR)/myls

	$(CC) $(DEBUG_FLAGS) \
	src/mycat.c src/utils.c \
	-Iinclude \
	-o $(BIN_DIR)/mycat

	$(CC) $(DEBUG_FLAGS) \
	src/mycp.c src/utils.c \
	-Iinclude \
	-o $(BIN_DIR)/mycp

release:
	$(CC) $(RELEASE_FLAGS) \
	src/myls.c \
	-o $(BIN_DIR)/myls

	$(CC) $(RELEASE_FLAGS) \
	src/mycat.c src/utils.c \
	-Iinclude \
	-o $(BIN_DIR)/mycat

	$(CC) $(RELEASE_FLAGS) \
	src/mycp.c src/utils.c \
	-Iinclude \
	-o $(BIN_DIR)/mycp

install:
	cp $(BIN_DIR)/myls $(INSTALL_DIR)
	cp $(BIN_DIR)/mycat $(INSTALL_DIR)
	cp $(BIN_DIR)/mycp $(INSTALL_DIR)

uninstall:
	rm -f $(INSTALL_DIR)/myls
	rm -f $(INSTALL_DIR)/mycat
	rm -f $(INSTALL_DIR)/mycp

clean:
	rm -rf build
	rm -rf bin

.PHONY: all clean install uninstall debug release directories
