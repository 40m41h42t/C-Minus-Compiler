#ifndef TOKENS_H
#define TOKENS_H

typedef enum {
    IF = 256, ELSE, INT, RETURN, VOID, WHILE,
    INT_NUM, PLUS, SUB, MUL, DIV, LTS, 
    LOE, GTS, GOE, EAE, NOE, ASSIGN, SEMI, 
    COMMA, LPAREN, RPAREN, LBRACKET, RBRACKET, 
    LBRACE, RBRACE, INPUT, OUTPUT, ID
} TokenType;

static void print_token(int token){
    static char *token_strs[] = {
        "IF", "ELSE", "INT", "RETURN", "VOID",
        "WHILE", "INT_NUM", "PLUS", "SUB",
        "MUL", "DIV", "LTS", "LOE", "GTS", "GOE",
        "EAE", "NOE", "ASSIGN", "SEMI", "COMMA",
        "LPAREN", "RPAREN", "LBRACKET", "RBRACKET",
        "LBRACE", "RBRACE", "INPUT", "OUTPUT", "ID"
    };
    printf("%-20s", token_strs[token-256]);
}

#endif