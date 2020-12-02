/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DanielC_EXA_U6;

/**
 *
 * @author Dani
 */
public class Deteccion {
    String token;
    String lexema;
    int linea;

    Deteccion(String token, String lexema, int linea) {
        this.token=token;
        this.lexema=lexema;
        this.linea=linea;
    }
    @Override
    public String toString(){
        return String.format("Se encontró %s '%s' en la linea %d", token, lexema, linea);
    }
}
