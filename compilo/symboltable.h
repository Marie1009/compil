
typedef struct {
	char * id;
	int is_constant;
	int is_init;
	int depth;
}symbol;

int check_init(int ad);
int get_address(char * id);

int ask_symbol(char * id);

void add_symbol(char * id, int is_cons, int is_init );

void plus_depth();
void minus_depth();

int pop();
int push();
