# The name of the output binary
OUT = main

# Compiler to use
HC = ghc

# Compiler flags
HCFLAGS = -Wall -O2

# Source directory
SRC_DIR = app

# Output directory
OUT_DIR = bin

# Object directory
OBJ_DIR = obj

# Source files
SRC_FILES = $(wildcard $(SRC_DIR)/*.hs)

# Object files
OBJ_FILES = $(patsubst $(SRC_DIR)/%.hs,$(OBJ_DIR)/%.o,$(SRC_FILES))

# Ensure directories exist
DIRS = $(OUT_DIR) $(OBJ_DIR)

# Default target
all: $(DIRS) $(OUT_DIR)/$(OUT)

# Create directories if they don't exist
$(DIRS):
	mkdir -p $@

# Build the Haskell program
$(OUT_DIR)/$(OUT): $(SRC_FILES) | $(DIRS)
	$(HC) $(HCFLAGS) -outputdir $(OBJ_DIR) -o $@ $<

# Clean up build artifacts
clean:
	rm -f $(OBJ_DIR)/*.o $(OBJ_DIR)/*.hi

# Clean up build artifacts and the output binary
fclean: clean
	rm -f $(OUT_DIR)/$(OUT)

# Rebuild the project
re: fclean all

# Run the program
run: all
	$(OUT_DIR)/$(OUT)

.PHONY: all clean fclean re run
