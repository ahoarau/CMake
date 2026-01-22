#include <stdio.h>
int main(int argc, char* argv[]) {
    printf("Hello from runtest\n");
    for (int i = 1; i < argc; ++i) {
        printf("Arg: %s\n", argv[i]);
    }
    return 0;
}
