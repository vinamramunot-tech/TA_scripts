#include <stdlib.h>
#include <stdio.h>
#include <string.h>

void theBomb(void);

const char* explodeSendCommand = "mail -s \"(CS232) Bomb Failure from $(whoami)\" $(whoami)@pfw.edu munov01@pfw.edu chenz@pfw.edu  < /dev/null";

int explode(const int code)
{
  int res;
  
  res = system(explodeSendCommand);
  printf("tick...tick...tick...BOOM!\n");
  exit(-10);
}

int checkIt(const char *execName){
/*
  const int bufSize = 2000;
  char buf[bufSize];
  int res;

  snprintf(buf, bufSize, "grep '%s' %s > /dev/null 2>&1", explodeSendCommand, execName);
  res = system(buf);

  if(res != 0){
    printf("It seems like someone has been tampering with my bomb!\n");
    explode(-1000);
  }
*/

  theBomb();
  return 0;
}
