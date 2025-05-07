import org.antlr.v4.gui.TreeViewer;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;

import javax.swing.*;
import java.util.Arrays;

public class TestParser {
    public static void main(String[] args) {
        String input = new ReadFile("src/main/examples/example.gank").fileContent();

        GankLexer lexer = new GankLexer(CharStreams.fromString(input));
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        GankParser parser = new GankParser(tokens);

        ParseTree tree = parser.programa();

        JFrame frame = new JFrame("Árvore de Análise");
        TreeViewer viewer = new TreeViewer(
                Arrays.asList(parser.getRuleNames()),
                tree);
        viewer.setScale(1.0);
        frame.add(new JScrollPane(viewer));
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(800, 600);
        frame.setVisible(true);
    }
}
