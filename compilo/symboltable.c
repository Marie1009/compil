#include <stdio.h>
#include <string.h>
#include "symboltable.h"

symbol table[100];

//int temp[300];
int point_temp = 0;


int global_depth = 0;
int index_table = 0;

// verifier affectation constante autorisée
// opérations asm

void init(){
	for(int i = 0; i<100; i++){
		table[i].id = "toto" ;
		table[i].is_constant = 0;
		table[i].is_init = 0;
		table[i].depth = 0;
	}
}

int check_init(int ad){
	if(ad == -1){
		return -1;
	}else{
		if(table[ad].is_constant == 1){
			return table[ad].is_init;
		}else{
			return 0;
		}
	}
}

int get_address(char *id){
	int x = ask_symbol(id);
	if (x!=-1){
		return x;
	}else{
		printf("ERREUR SYMBOLE %s INEXISTANT",id);
		return -1;
	}
}

int ask_symbol(char *id){
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

void add_symbol(char *id, int is_cons, int is_init ){

	if (ask_symbol(id) == -1){
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
	//supprimer les var qui existent avant
	for (int i = 0; i<index_table; i++){
		if (table[i].depth == global_depth){
			table[i].depth = -2; // on modifie la valeur de la profondeur en remontant pour "effacer" les variables 
		}
	}
	global_depth --;
}


int pop(){
	point_temp --;
	return point_temp + 1000;
}

int push(){
	point_temp ++;
	return point_temp + 1000;
}