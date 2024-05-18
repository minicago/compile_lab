#include <iostream>

#include "antlr4-runtime.h"
#include "SysyLexer.h"
#include "SysyParser.h"
#include "main.h"

using namespace antlr4;

int main(int argc, const char* argv[]) {
    std::ifstream stream;
    stream.open(argv[1]);
    ANTLRInputStream input(stream);
    //ANTLRInputStream input(std::cin);
    SysyLexer lexer(&input);
    CommonTokenStream tokens(&lexer);

    tokens.fill();
    
    for (auto token : tokens.getTokens()) {

        //简单粗暴的输出token信息并不符合题目要求
        if (token->getText() == "<EOF>" | tokenTypeName[token->getType()] == "" ) continue;
        if (tokenTypeName[token->getType()] == "LEX_ERR") std::cout << "Lexical error - line " << token->getLine() << " : " << token->getText() << std::endl;
        else std::cout << token->getText() << " : " << tokenTypeName[token->getType()] << std::endl;
    }

    /* 语法分析 

    SysyParser parser(&tokens);
    tree::ParseTree* tree = parser.compUnit();

    std::cout << tree->toStringTree(&parser) << std::endl << std::endl;
    */

    return 0;
}    