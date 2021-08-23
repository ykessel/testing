#!/bin/bash
limit=100000000

main() {
    for file in *.mp4
    do
        if [[ -f $file ]]; then
            zip -P yk15.EL+TIGRE $file.zip $file
            rm $file
        fi
    done
}

dividir() {
    for comprimido in *.zip
    do
        if [[ -f $comprimido ]]; then
            filesize=`wc -c "$comprimido" | awk '{print $1}'`
            if(("$filesize">"$limit")); then
                split -d -b 95m $comprimido
                rm $comprimido
            fi
        fi
    done
}

main
dividir
