
typedef struct {
	char * id;
	int is_constant;
	int is_init;
	int depth;
}symbol;

int ask_symbol(char * id);

void add_symbol(char * id, int is_cons, int is_init );

void plus_depth();
void minus_depth();