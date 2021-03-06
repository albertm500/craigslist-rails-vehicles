#!/bin/bash
# <troydwill@gmail.com> October 2010

source ./rrp-lib.sh

for SCRIPT in 010_controller_welcome.sh \
    020_scaffold_post.sh \
    030_scaffold_model.sh \
    040_scaffold_make.sh \
    050_scaffold_city.sh; do
    ${EDITOR} ${SCRIPT}
    echo "=> Run /bin/bash ${SCRIPT}?: <any key to continue>";
    read $answer
    /bin/bash ${SCRIPT}
done
