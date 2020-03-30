#include <stdio.h>
#include <string.h>

typedef struct {
	char * id;
	bool is_constant;
	bool is_init;
	int depth;
}symbol;



symbol table[100];

int global_depth = 0;
int index = 0;

void add_symbol(char * id, bool is_cons){

}

