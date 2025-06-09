package br.csi.util;

public class ValidateInput {

    public static boolean isEmpty(String... campos) {
        for (String campo : campos) {
            if (campo == null || campo.isEmpty()) return true;
        }
        return false;
    }

}
