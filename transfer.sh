#!/bin/bash

origin_dir="/root/scripts/bash_scripts"
dest_dir="/media/admin1/SSD/scripts"

cd "$origin_dir"

######################################
######################################
function transfer() {
        wk_dir=$(pwd)
        chars2=$(echo "${wk_dir}" | awk -F"/" '{print NF-1}')
        chars2=$((chars2+1))
        var2=$(echo "$wk_dir" | cut -d "/" -f"$chars2")
        cd "$dest_dir"
        [ -d "$var2" ] || mkdir "$var2"
        dest_dir="$dest_dir/""$var2"
        cd "$origin_dir"


        ls > listb
        [ -f "file_list" ] && rm "file_list"
        touch "file_list"

        ##here we add new count
        count_dir=1
        count_dir=$((count_dir+1))
        [ -f "dir_list" ] && rm "dir_list""_$count_dir"
        touch "dir_list""_$count_dir"


        while IFW= read -r line
        do
                var="$(pwd)""/$line"
                if [ -f "$var" ];
                 then
                        echo "$var" >> "file_list"
                else
                        echo "$var" >> "dir_list""_$count_dir"
                fi
                echo "$var"
        done < listb

        cd "$origin_list"
        while IFW= read -r line
        do
                chars=$(echo "${line}" | awk -F"/" '{print NF-1}')
                chars=$((chars+1))
                var=$(echo "$line" | cut -d "/" -f"$chars")
                cd "$dest_dir"
                touch "$var"
                cd "$origin_list"
                echo "$var"
                echo "$dest_dir/""$var"
                cat "$line" > "$dest_dir""/""$var"
        done < "file_list"
}
########################################
########################################





transfer

count=0
while IFM= read -r line
do
        count=$((coun+1))
done < "dir_list""_$count_dir"

if [[ "$count" == 0 ]]
then
        pass
else
        line=$(head -n 1 "dir_list")
        echo "HEEERE IS THE FIRSTTT"
        echo "$line"
        chars=$(echo "${line}" | awk -F"/" '{print NF-1}')
        chars=$((chars+1))
        line=$(echo "$line" | cut -d "/" -f"$chars")
        sed -i '1d' "dir_list"
        cd "$origin_dir/""$line"
fi
##repeat function here insert"













