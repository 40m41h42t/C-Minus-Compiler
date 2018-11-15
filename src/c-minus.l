%{
    #include "tokens.h"
    int CurLineNum = 1;
    void init_scanner();
    void lex_error(char *msg, int line);
%}
/* token分析 */

digit       [0-9]
int_num     {digit}+
letter      [a-zA-Z]
identifier  {letter}+

%%

"if"        {return IF;}
"else"      {return ELSE;}
"int"       {return INT;}
"return"    {return RETURN;}
"void"      {return VOID;}
"while"     {return WHILE;}

{int_num}       {return INT_NUM;}

"+"     {return PLUS;}
"-"     {return SUB;}
"*"     {return MUL;}
"/"     {return DIV;}
"<"     {return LTS;} // less than sign
"<="    {return LOE;} // less or equal
">"     {return GTS;} // greater than sign
">="    {return GOE;} // greater or equal
"=="    {return EAE;} // equal and equal
"!="    {return NOE;} // not equal

"="     {return ASSIGN;}
";"     {return SEMI;}
","     {return COMMA;}
"("     {return LPAREN;}
")"     {return RPAREN;}
"["     {return LBRACKET;}
"]"     {return RBRACKET;}
"{"     {return LBRACE;}
"}"     {return RBRACE;}

"input"     {return INPUT;}
"output"    {return OUTPUT;}

{identifier}    {return ID;}

[\n]        {CurLineNum++;}
[ \t\r\a]+  { }

"/*"    {
            char c;
            int flag = 1;
            do
            {
                c = input();
                entry1:
                if(c == EOF) break;
                if(c == '\n') CurLineNum++;
                if(c == '*')
                {
                    c = input();
                    if(c == '/')
                        flag = 0;
                    else
                        goto entry1;
                }
            } while(flag);
        }
%%

int main(int argc, char *argv[]){
    int token;
    init_scanner();
    while(token = yylex()){
        print_token(token);
        puts(yytext);
    }
    return 0;
}

void init_scanner(){
    printf("%-20s%s\n", "TOKEN-TYPE", "TOKEN-VALUE");
    printf("------------------------------------------\n");
}

void lex_error(char* msg, int line) {
    printf("\nError at line %-3d: %s\n\n", line, msg);
}

int yywrap(void){
    return 1;
}