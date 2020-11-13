#include <stdio.h>

int checkIt(const char *execName);

int main(int argc, char* argv[]){

  /* I was having some issues where the program would behave differently
     when I redirected stdout from the shell.
     This is intended to fix that, since these streams are unbuffered UNLESS redirected.
     See http://www.cplusplus.com/reference/clibrary/cstdio/setvbuf/
  */
  setvbuf(stdout, NULL, _IONBF, -1);
  setvbuf(stderr, NULL, _IONBF, -1);
  setvbuf(stdin, NULL, _IONBF, -1);

  return checkIt(argv[0]);
}
