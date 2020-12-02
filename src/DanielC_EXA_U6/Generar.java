/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DanielC_EXA_U6;

import java.io.IOException;
import jflex.exceptions.SilentExit;

/**
 *
 * @author doc_sistemas_2
 */
public class Generar {
    public static void main(String[] args) throws SilentExit, IOException, Exception {
        //generaChiquito();
        generaExtendido(); 
   }
    private static void generaChiquito() throws SilentExit, IOException, Exception{
        String rutaPrincipal = "pathToThisFile";
        String flexChiquito = rutaPrincipal + "\\javaChiquito.flex";
        String cupChiquito = rutaPrincipal + "\\javaChiquito.cup";
        jflex.Main.generate(new String[]{flexChiquito});
        java_cup.Main.main(new String[]{"-destdir", rutaPrincipal, cupChiquito});
    }
    private static void generaExtendido() throws SilentExit, IOException, IOException, Exception, Exception{
        
        String rutaPrincipal = "pathToThisFile";
        String flexExtendido = rutaPrincipal + "\\javaExtendido.flex";
        String cupExtendido = rutaPrincipal + "\\javaExtendido.cup";
        jflex.Main.generate(new String[]{flexExtendido});
        java_cup.Main.main(new String[]{"-destdir", rutaPrincipal, cupExtendido});
    }
    
}
