# Makefile for SHA-256 Hash Calculator

# Compiler and Linker
CXX := g++
# Compiler Flags
CXXFLAGS := -std=c++20 -Wall -Wextra
# Include Directory for OpenSSL
INCLUDES := -I/usr/include/openssl
# Linker Flags
LDFLAGS := -L/usr/lib
# Libraries to Link Against
LDLIBS := -lssl -lcrypto

# Source Files
SOURCES := main.cpp
# Object Files
OBJECTS := $(SOURCES:.cpp=.o)
# Executable Name
EXECUTABLE := sha256calculator.exe

# Default target
all: $(EXECUTABLE)

# Link the target executable
$(EXECUTABLE): $(OBJECTS)
	$(CXX) $(LDFLAGS) $^ -o $@ $(LDLIBS)

# Compile the source files into object files
%.o: %.cpp
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $< -o $@

# Clean Target
clean:
	rm -f $(OBJECTS) $(EXECUTABLE)

# Phony Targets
.PHONY: all clean

