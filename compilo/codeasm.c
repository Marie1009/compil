#include <stdio.h>
#include <string.h>
#include "codeasm.h"

asm_struct table_op[100];
int line =0 ;

int get_line(){
	return line;
}

void modifyjmf(int l, int newl){
	table_op[l-1].op2 = newl;
}

void modifyjmp(int l, int newl){
	table_op[l-1].op1 = newl;
}

int add_op3(char * code, int op1, int op2, int op3 ){
	
	table_op[line].code = strdup(code);
	table_op[line].op1 = op1;
	table_op[line].op2 = op2;
	table_op[line].op3 = op3;

	line ++;
	return line;
}

int add_op2(char * code, int op1, int op2 ){
	
	return add_op3(code,op1,op2,0);

}

int add_op1(char * code, int op1 ){
	
	return add_op3(code,op1,0,0);
}

void write_file(){
	FILE *fp;

   fp = fopen("instructions.txt", "w");

  
   for(int l =0; l< line; l++){
   	if(strcmp(table_op[l].code,"PRI") ==0 || strcmp(table_op[l].code,"JMP") ==0){

   		fprintf(fp, "%s %d \n",table_op[l].code, table_op[l].op1);

   	}else if(strcmp(table_op[l].code,"AFC") ==0 || strcmp(table_op[l].code,"COP") ==0 || strcmp(table_op[l].code,"JMF") ==0) {
   		
   		fprintf(fp, "%s %d %d \n",table_op[l].code, table_op[l].op1,table_op[l].op2);

   	}else{
   		fprintf(fp, "%s %d %d %d \n",table_op[l].code, table_op[l].op1,table_op[l].op2,table_op[l].op3);
   	}
   }


   fclose(fp);
}