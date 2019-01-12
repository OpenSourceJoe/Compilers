package org.morne;

import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.BaseErrorListener;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.RecognitionException;
import org.antlr.v4.runtime.Recognizer;
import org.morne.antlr_test1.grammer.*;
import org.morne.antlr_test1.grammer.FieldParser.FieldContext;

public class ParseTest {

	public static void main(String[] args) {
		try
		{
			FieldLexer l = new FieldLexer(new ANTLRInputStream((new ParseTest()).getClass().getResourceAsStream("/example.field")));
		    FieldParser p = new FieldParser(new CommonTokenStream(l));
		    
		    p.addErrorListener(new BaseErrorListener() {
			        @Override
			        public void syntaxError(Recognizer<?, ?> recognizer, Object offendingSymbol, int line, int charPositionInLine, String msg, RecognitionException e) {
			            throw new IllegalStateException("failed to parse at line " + line + " due to " + msg, e);
			        }
			    });
		    
		    FieldContext c = p.field();
		    
		    System.out.println(":PLD:" + c.getPayload().getClass().getTypeName());
	    	System.out.println(":PLD:" + c.getPayload());
	    	System.out.println(":Token:" + c.name.getText());
		    
		    c.children.forEach((x) -> {
		    	// System.out.println(":TXT:" + x.getText());
		    	System.out.println(":PLD:" + x.getPayload().getClass().getTypeName());
		    	System.out.println(":PLD:" + x.getPayload());
		    });
		    
		    p.setBuildParseTree(true);

		    System.out.println(c);
			}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}

}
