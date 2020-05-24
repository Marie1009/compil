
typedef struct {
	char * code;
	int op1;
	int op2;
	int op3;
}asm_struct;

void modifyjmf(int l, int newl);
void modifyjmp(int l, int newl);
int get_line();

int add_op3(char * code, int op1, int op2, int op3 );
int add_op2(char * code, int op1, int op2 );
int add_op1(char * code, int op1 );

void write_file();