import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;

public class TestParser {
    public static void main(String[] args) {
        String input = new ReadFile("src/main/examples/example.txt").fileContent();

        GankGrammarLexer lexer = new GankGrammarLexer(CharStreams.fromString(input));
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        GankGrammarParser parser = new GankGrammarParser(tokens);

        ParseTree tree = parser.program();

        System.out.println("Árvore de análise gerada: ");
        System.out.println(tree.toStringTree(parser));

    }
}
