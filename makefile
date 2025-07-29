SRC_DIR := src
OBJ_DIR := obj
BIN_DIR := bin
LIB_DIR := lib
INC_DIR := inc

all: $(BIN_DIR)/main.out

$(BIN_DIR)/main.out: $(OBJ_DIR)/main.o $(LIB_DIR)/libcesar.so
	g++ $(OBJ_DIR)/main.o -L$(LIB_DIR) -lcesar -Wl,-rpath=./$(LIB_DIR) -o $(BIN_DIR)/main.out

$(OBJ_DIR)/main.o: $(SRC_DIR)/main.cpp
	g++ -I$(INC_DIR) -c $(SRC_DIR)/main.cpp -o $(OBJ_DIR)/main.o

$(LIB_DIR)/libcesar.so: $(OBJ_DIR)/encoder.o $(OBJ_DIR)/decoder.o   
	g++ -shared $(OBJ_DIR)/encoder.o $(OBJ_DIR)/decoder.o -o $(LIB_DIR)/libcesar.so

$(OBJ_DIR)/decoder.o: $(SRC_DIR)/decoder.cpp 
	g++ -I$(INC_DIR) -fPIC -c $(SRC_DIR)/decoder.cpp -o $(OBJ_DIR)/decoder.o

$(OBJ_DIR)/encoder.o: $(SRC_DIR)/encoder.cpp
	g++ -I$(INC_DIR) -fPIC -c $(SRC_DIR)/encoder.cpp -o $(OBJ_DIR)/encoder.o

run:
	LD_LIBRARY_PATH=$(LIB_DIR) ./$(BIN_DIR)/main.out

clean:
	rm -rf $(OBJ_DIR)/*.o $(LIB_DIR)/*.so $(BIN_DIR)/*

