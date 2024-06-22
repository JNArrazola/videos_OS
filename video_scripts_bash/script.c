#include <stdio.h>
#include <stdlib.h>

int main() {
    // Define el script a ejecutar
    const char *scriptName = "script.sh";
    char command[256];
    snprintf(command, sizeof(command), "bash %s", scriptName);

    // Ejecuta el script y abre una terminal para leer su salida
    FILE *fp = popen(command, "r");
    if (fp == NULL) {
        perror("popen");
        return 1;
    }

    // Lee la salida del script
    char line[256];
    while (fgets(line, sizeof(line), fp) != NULL) {
        printf("%s", line);
    }

    // Espera a que el proceso termine
    int exitCode = pclose(fp);
    if (exitCode == -1) {
        perror("pclose");
        return 1;
    }

    // Imprime el código de salida del script
    printf("Exited with code: %d\n", WEXITSTATUS(exitCode));

    return 0;
}
