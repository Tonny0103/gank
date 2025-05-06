import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;

public class TestParser {
    public static void main(String[] args) {
        String input = new ReadFile("src/main/examples/example.gank").fileContent();

        GankLexer lexer = new GankLexer(CharStreams.fromString(input));
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        GankParser parser = new GankParser(tokens);

        ParseTree tree = parser.programa();

        System.out.println("Árvore de análise gerada: ");
        System.out.println(tree.toStringTree(parser));

    }
}
