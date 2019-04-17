#!/bin/sh -e

AUTHOR="$(git log -1 --pretty='format:%aN <%aE>')"
git log -1 --pretty=format:%B | grep "Signed-off-by: $AUTHOR"
if [ $? != 0 ]; then
    echo "The commit message does not contain author's signature (Signed-off-by: $AUTHOR)"
    return 1
fi
