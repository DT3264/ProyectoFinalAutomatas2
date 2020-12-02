/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DanielC_EXA_U6;

import java.util.HashMap;

/**
 *
 * @author Dani
 */
public class Elemento {

    static int nextID = 1;
    static HashMap<String, Integer> mapa = new HashMap<String, Integer>();
    String id;
    String token;
    String lexema;

    public Elemento(String token, String lexema) {
        this.token = token;
        this.lexema = lexema;
        id = "";
        if (token.equals("ID")) {
            if (!mapa.containsKey(lexema)) {
                mapa.put(lexema, nextID++);
            }
            id = mapa.get(lexema).toString();
        }
    }
    
    public Object[] toObjectArray(){
        return new Object[]{id, token, lexema};
    }
}
