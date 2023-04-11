#include <stdio.h>
#include <string.h>

#define BUFFER_SIZE 10

int main() {
  printf("Hello world!\n");

  char buf[BUFFER_SIZE];
  fgets(buf, BUFFER_SIZE, stdin);
  if (strncmp(buf, "ABCDEF", 6) == 0) {
    printf("You win!\n");
  }

  return 0;
}
