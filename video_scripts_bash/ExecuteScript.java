package video_scripts_bash;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;

/**
 * Código java para ejecutar un bash-script
  */
public class ExecuteScript {
    private static String scriptName = "script.sh"; // * Cambiar para ejecutar otro script
    private static String path = new File("").getAbsolutePath() + "/video_scripts_bash/";
    public static void main(String[] args) {
        try {
            //! Define el script a ejecutar
            String scriptPath = path + scriptName;

            //! Ejecuta el script
            ProcessBuilder processBuilder = new ProcessBuilder("bash", scriptPath);
            Process process = processBuilder.start();

            //! Lee la salida del script
            BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
            String line;
            while ((line = reader.readLine()) != null) {
                System.out.println(line);
            }

            //! Espera a que el proceso termine
            int exitCode = process.waitFor();
            System.out.println("Exited with code: " + exitCode);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}