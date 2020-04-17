#include <stdio.h>
#include <string.h>
#include "symboltable.h"

symbol table[100];

int temp[300];


int global_depth = 0;
int index_table = 0;

//fonction qui retourne l'adresse a ajouter \\ 

int get_address(char * id){
	x = ask_symbol(id);
	if (x!=-1){
		return x;
	}else{
		printf("ERREUR SYMBOLE %s INEXISTANT",id);
		return -1;
	}
}

int ask_symbol(char * id){
	int i=0;
	while ((strcmp(table[i].id,id)!=0 || table[i].depth != global_depth) && i< index_table ){
		i ++;
	}
	if (i == index_table){
		return -1;
	}else{
		return i;
	}
}

void add_symbol(char * id, int is_cons, int is_init ){

	if (ask_symbol(id)== -1){

		table[index_table].id = id;
		table[index_table].is_constant = is_cons;
		table[index_table].is_init = is_init;
		table[index_table].depth = global_depth;

		index_table ++;
	}else{
		printf("ERREUR SYMBOLE DEJA EXISTANT");
	}
}

void plus_depth(){
	global_depth ++;
}

void minus_depth(){
	global_depth --;
}


void pop_temp(){

}

void push_temp(){

}