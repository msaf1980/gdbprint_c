#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <wchar.h>
#include <stdlib.h>
#include <errno.h>
#include <sys/queue.h>

struct tNode {
        char Name[30];
        char Addr[50];
        struct tNode *next;
};
typedef struct tNode tNode;

struct tNode *append_tNode(tNode *head, tNode *item)
{
    if (head == NULL)
    {
                        head = item;
                        return head;
    }
    tNode *iter = head;
    while (iter->next)
                        iter = iter->next;
    iter->next = item;
    return item;
}

void free_tNode(tNode *head)
{
    if (head == NULL)
      return;
    tNode *iter = head;
    while (iter->next) {
                        tNode *node = iter;
                        iter = iter->next;
                        free(node);
    }
    return;
}

typedef struct msg {
    TAILQ_ENTRY(msg) next;
    ssize_t id;
    char name[20];
} msg;

typedef TAILQ_HEAD(msg_head, msg) msg_head;

int main(int argc, char* argv[]) { 
        tNode *tNode_item1 = (tNode *) malloc(sizeof(tNode));
        strcpy(tNode_item1->Name, "1");
        tNode *tNode_item2 = (tNode *) malloc(sizeof(tNode));
        strcpy(tNode_item2->Name, "2");

        tNode *tNode_head = append_tNode(NULL, tNode_item1);
        append_tNode(tNode_head, tNode_item2);

        msg *np;
        msg_head *msghead = (msg_head *) malloc(sizeof(msg_head));
        TAILQ_INIT(msghead);

        np = (msg *) malloc(sizeof(msg));
        np->id = 1;
        strcpy(np->name, "1");
        TAILQ_INSERT_TAIL(msghead, np, next);

        np = (msg *) malloc(sizeof(msg));
        np->id = 2;
        strcpy(np->name, "2");
        TAILQ_INSERT_TAIL(msghead, np, next);

	return 0;
}
