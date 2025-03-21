OUT = main

HC = ghc

HCFLAGS = -Wall -O2

SRC_DIR = app

OUT_DIR = bin

OBJ_DIR = obj

SRC_FILES = $(wildcard $(SRC_DIR)/*.hs)

OBJ_FILES = $(patsubst $(SRC_DIR)/%.hs,$(OBJ_DIR)/%.o,$(SRC_FILES))

DIRS = $(OUT_DIR) $(OBJ_DIR)

all: $(DIRS) $(OUT_DIR)/$(OUT)

$(DIRS):
	mkdir -p $@

$(OUT_DIR)/$(OUT): $(SRC_FILES) | $(DIRS)
	$(HC) $(HCFLAGS) -outputdir $(OBJ_DIR) -o $@ $<

clean:
	rm -f $(OBJ_DIR)/*.o $(OBJ_DIR)/*.hi

fclean: clean
	rm -f $(OUT_DIR)/$(OUT)

re: fclean all

run: all
	$(OUT_DIR)/$(OUT)

.PHONY: all clean fclean re run
