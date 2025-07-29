SRC_DIR := src
OBJ_DIR := obj
BIN_DIR := bin
LIB_DIR := lib
INC_DIR := inc

all: $(BIN_DIR)/main.out

$(BIN_DIR)/main.out: $(OBJ_DIR)/main.o $(OBJ_DIR)/unit_tester.o $(LIB_DIR)/libcesar.so
	g++ $(OBJ_DIR)/main.o $(OBJ_DIR)/unit_tester.o -L$(LIB_DIR) -lcesar -Wl,-rpath=./$(LIB_DIR) -o $(BIN_DIR)/main.out

$(OBJ_DIR)/main.o: $(SRC_DIR)/main.cpp
	g++ -I$(INC_DIR) -c $< -o $@

$(OBJ_DIR)/unit_tester.o: $(SRC_DIR)/unit_tester.cpp
	g++ -I$(INC_DIR) -c $< -o $@

$(LIB_DIR)/libcesar.so: $(OBJ_DIR)/encoder.o $(OBJ_DIR)/decoder.o
	g++ -shared $(OBJ_DIR)/encoder.o $(OBJ_DIR)/decoder.o -o $(LIB_DIR)/libcesar.so

$(OBJ_DIR)/encoder.o: $(SRC_DIR)/encoder.cpp
	g++ -I$(INC_DIR) -fPIC -c $< -o $@

$(OBJ_DIR)/decoder.o: $(SRC_DIR)/decoder.cpp
	g++ -I$(INC_DIR) -fPIC -c $< -o $@

run:
	LD_LIBRARY_PATH=$(LIB_DIR) ./$(BIN_DIR)/main.out

clean:
	rm -rf $(OBJ_DIR)/*.o $(LIB_DIR)/*.so $(BIN_DIR)/*

