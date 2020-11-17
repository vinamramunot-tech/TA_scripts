/* File: indexPage.c */
/* Author: Britton Wolfe */
/* Date: September 3rd, 2010 */

/* This program indexes a web page, printing out the counts of words on that page */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <ctype.h>

#define MAX_CHIDREN 26 
#define MAX_CHAR 300000 

struct node 
{
  int count;
  struct node * children[MAX_CHIDREN];
};

struct node * indexPage(const char* url);

int addWordOccurrence(const char* word, const int wordLength, struct node * root);

void printTrieContents(struct node * root, char* word, const int wordLength);

void freeTrieMemory(struct node * root);

int getText(const char* srcAddr, char* buffer, const int bufSize);

struct node * createNode();

int main(int argc, char** argv){
  struct node * root = NULL;

  // get command line arguments
  if (argc != 2) {
    printf("Usage: %s url", argv[0]);
    return -1;
  }

  // get the words from url webpage and put the into the structure
  /* argv[1] will be the URL to index, if argc > 1 */
  root = indexPage(argv[1]);
  if (root == NULL) {
    fprintf(stderr, "Cannot index a page from %s\n", argv[1]);
    return -1;
  }

  char word[MAX_CHAR];
  printTrieContents(root, word, 0);

  freeTrieMemory(root);

  return 0;
}

struct node * createNode() {
  struct node * newNode = malloc(sizeof(struct node));
  if (newNode == NULL) 
    return NULL;

  newNode->count = 0;
  for (int i = 0; i < MAX_CHIDREN; i++)
    newNode->children[i] = NULL;

  return newNode; 
}

struct node * indexPage(const char* url){
  char buffer[MAX_CHAR];

  printf("%s\n", url);

  int bytesRead = getText(url, buffer, MAX_CHAR);
  if (bytesRead == 0) return NULL;

  struct node * root = createNode();
  if (root == NULL) return NULL;

  // find a word from bytesRead and then put it into the structure
  char * pos = buffer;
  int i = 0, isWord = 0;
  while (i < bytesRead) {
    buffer[i] = tolower(buffer[i]);
    if (isalpha(buffer[i])) {
      if (!isWord) {
        pos = buffer + i;
        isWord = 1;
      } 
    } else {
      if (isWord) {
        isWord = 0;
        buffer[i] = '\0';
        printf("\t%s\n",pos);
        int result = addWordOccurrence(pos, strlen(pos), root);
        if (result == 1) return NULL;
      }
    }

    i ++;
  }

  if (isWord) {
    printf("\t%s\n",pos);
    int result = addWordOccurrence(pos, strlen(pos), root);
    if (result == 1) return NULL;
  }

  return root;
}

int addWordOccurrence(const char* word, const int wordLength, struct node * root) {
  if (wordLength == 0)
    root->count ++;
  else {
    if (root->children[word[0] - 'a'] == NULL) {
      struct node * newNode = createNode();
      if (newNode == NULL) return 1;

      root->children[word[0] - 'a'] = newNode; 
    }

    return addWordOccurrence(word+1, wordLength-1, root->children[word[0] - 'a']);    
  }

  return 0;
}

void printTrieContents(struct node * root, char* word, const int wordLength) {
  if (root == NULL) return;

  if (root->count != 0) {
    word[wordLength] = '\0';
    printf("%s: %d\n", word, root->count);
  }

  for (int i = 0; i < MAX_CHIDREN; i++) {
    word[wordLength] = 'a' + i;
    printTrieContents(root->children[i], word, wordLength + 1);
  }
}

void freeTrieMemory(struct node * root) {
  if (root == NULL) return;

  for (int i = 0; i < MAX_CHIDREN; i++)
    freeTrieMemory(root->children[i]);

  free(root);
}

/* You should not need to modify this function */
int getText(const char* srcAddr, char* buffer, const int bufSize){
  FILE *pipe;
  int bytesRead;

  snprintf(buffer, bufSize, "curl -s \"%s\" | python getText.py", srcAddr);

  pipe = popen(buffer, "r");
  if(pipe == NULL){
    fprintf(stderr, "ERROR: could not open the pipe for command %s\n",
	    buffer);
    return 0;
  }

  bytesRead = fread(buffer, sizeof(char), bufSize-1, pipe);
  buffer[bytesRead] = '\0';

  pclose(pipe);

  return bytesRead;
}
