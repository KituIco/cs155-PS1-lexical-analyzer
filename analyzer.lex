%option noyywrap
%{
    #pragma execution_character_set( "utf-8" )
    #include <Windows.h>
    #include<stdio.h>

    void display_token(char *type);
%}

%%
    /* =========== RESERVED WORDS =========== */
"go to"                 display_token("RSRVD_GOTO");
"exit"                  display_token("RSRVD_EXIT");
"else if"               display_token("RSRVD_ELSEIF");
"if"                    display_token("RSRVD_IF");
"then"                  display_token("RSRVD_THEN");
"else"                  display_token("RSRVD_ELSE");
"case"                  display_token("RSRVD_CASE");
"endcase"               display_token("RSRVD_ENDCASE");
"endwhile"              display_token("RSRVD_ENDWHILE");
"while"                 display_token("RSRVD_WHILE");
"do"                    display_token("RSRVD_DO");
"repeat"                display_token("RSRVD_REPEAT");
"until"                 display_token("RSRVD_UNTIL");
"loop"                  display_token("RSRVD_LOOP");
"forever"               display_token("RSRVD_FOREVER");
"endfor"                display_token("RSRVD_ENDFOR");
"for"                   display_token("RSRVD_FOR");
"to"                    display_token("RSRVD_TO");
"by"                    display_token("RSRVD_BY");
"input"                 display_token("RSRVD_INPUT");
"output"                display_token("RSRVD_OUTPUT");
"array"                 display_token("RSRVD_ARRAY"); 
"node"                  display_token("RSRVD_NODE");
"call"                  display_token("RSRVD_CALL");
"return"                display_token("RSRVD_RETURN");
"stop"                  display_token("RSRVD_STOP");
"end"                   display_token("RSRVD_END");
"procedure"             display_token("RSRVD_PROCEDURE");

    /* ============== Assignment Operator ============== */
"←"                     display_token("OP_ASSIGN");

    /* ============= Arithmetic Operators ============= */
"+"                     display_token("OP_ARITH_ADD");
"-"                     display_token("OP_ARITH_SUB");
"/"                     display_token("OP_ARITH_DIV");
"*"                     display_token("OP_ARITH_MULT");
"^"                     display_token("OP_ARITH_EXPO");

    /* =============== Logical Operators ============== */
"and"                   display_token("OP_LOG_AND");
"or"                    display_token("OP_LOG_OR");
"not"                   display_token("OP_LOG_NOT");

    /* ============= Relational Operators ============= */
"≤"                     display_token("OP_REL_LEQ");
"≥"                     display_token("OP_REL_GEQ");
"<"                     display_token("OP_REL_LESS");
">"                     display_token("OP_REL_GRTR");
"="                     display_token("OP_REL_EQ");
"≠"                     display_token("OP_REL_NEQ");

    /* ============= Mathematic Notations ============= */
"⌊"                     display_token("MATH_LFLOOR");
"⌋"                     display_token("MATH_RFLOOR");
"⌈"                     display_token("MATH_LCIEL");
"⌉"                     display_token("MATH_RCIEL");
"mod"                   display_token("MATH_MOD");
"log_"[0-9]+            display_token("MATH_LOG");

    /* ============== Identifier Symbols ============== */
"("                     display_token("IND_LPAREN");
")"                     display_token("IND_RPAREN");
"["                     display_token("IND_LBRACKET");
"]"                     display_token("IND_RBRACKET");
"{"                     display_token("IND_LBRACES"); 
"}"                     display_token("IND_RBRACES");
":"                     display_token("IND_COLON");
","                     display_token("IND_COMMA");
";"                     display_token("IND_SEMICOLON");

    /* ============ Identifier or Variables ============ */
[a-zA-Z_][a-zA-Z0-9_]*  display_token("IDEN_NAME");

    /* =========== Number or String Literals =========== */
[0-9]+[.][0-9]+         display_token("LIT_FLOAT");
[0-9]+                  display_token("LIT_INT");
[']{1}[^'.]*[']{1}      display_token("LIT_STR");
[\"]{1}[^\".]*[\"]{1}   display_token("LIT_STR");

    /* ============= Miscellaneous Tokens ============= */
"▷"[^\n.]*             display_token("COMMENT");
[ \t\n]                 /* ignore */
.                       display_token("UNIDENTIFIED");
%%

void display_token(char *type)
{
    printf("%s ", type);
    printf("%*c", 20-strlen(type), ' ');
    printf("%s\n", yytext);
}

int main(int argc, char *arguments[])
{
    SetConsoleOutputCP(65001);

    yyin = fopen(arguments[1], "r");
    yylex();

    fclose(yyin);
    return 0;
}
