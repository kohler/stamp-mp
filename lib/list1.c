#include "tm.h"
#include "list.h"

TM_CALLABLE
list_node_t*
TMfindPrevious (TM_ARGDECL  list_t* listPtr, void* dataPtr)
{
    list_node_t* prevPtr = &(listPtr->head);
    list_node_t* nodePtr;

    for (nodePtr = (list_node_t*)TM_SHARED_READ_P(prevPtr->nextPtr);
         nodePtr != NULL;
         nodePtr = (list_node_t*)TM_SHARED_READ_P(nodePtr->nextPtr))
    {
        if (listPtr->compare(nodePtr->dataPtr, dataPtr) >= 0) {
            return prevPtr;
        }
        prevPtr = nodePtr;
    }

    return prevPtr;
}
