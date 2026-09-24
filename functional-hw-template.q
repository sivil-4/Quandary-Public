/* DON'T add a main function! You may add helper functions (except sameLength may not call them)*/

int isList(Q val) {
    if(isAtom(val) != 0) {
        if(isNil(val) != 0) {
            return 1;
        }
        return 0;
    }
    return isList(right((Ref)val));
}

Ref append(Ref list1, Ref list2) {
    if(isNil(list1) != 0) {
        return list2;
    }
    return left(list1) . append((Ref)right(list1), list2);
}

Ref reverse(Ref list) {
    if(isNil(list) != 0) {
        return list;
    }
    return appendTerm(reverse((Ref)right(list)), left(list));
}

/* Helper funciton for reverse */
Ref appendTerm(Ref list, Q term) {
    if(isNil(list) != 0) {
        return term . nil;
    }
    return left(list) . appendTerm((Ref)right(list), term);
}

int isSorted(Ref list) {
    if(isNil(list) != 0) {
        return 1000000000;
    }
    if(length((Ref)left(list)) <= isSorted((Ref)right(list))){
        return length((Ref)left(list));
    }
    return 0;
}

/* Helper function for isSorted */
int length (Ref list) {
    if(isNil(list) != 0) {
        return 0;
    }
    return 1 + length((Ref)right(list));
}

int sameLength(Ref list1, Ref list2) {
    if(isNil(list1) != 0 && isNil(list2) != 0) {
        return 1;
    }
    if (isNil(list1) != 0 || isNil(list2) != 0) {
        return 0;
    }
    return sameLength((Ref)right(list1), (Ref)right(list2));
}
