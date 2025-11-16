#!/bin/bash

xml_file=$1
csv_file=$2
temp_file="${csv_file}.tmp"

# Check if the XML file contains students data
if ggrep -q "<students>" "$xml_file"; then
    echo "student_name,student_id,student_email,programme,year,address,contact,module_id,module_name,module_leader,lecturer1,lecturer2,faculty,building,room,exam_mark,coursework1,coursework2,coursework3" > "$temp_file"
    
    # Use perl to handle multiline matching
    perl -0777 -ne 'while (/<student>(.*?)<\/student>/sg) { print "$1\n---RECORD---\n" }' "$xml_file" | while IFS= read -r student; do
        # Skip the separator line
        if [ "$student" = "---RECORD---" ]; then
            continue
        fi
        
        # Read until we hit the separator
        full_record="$student"
        while IFS= read -r line && [ "$line" != "---RECORD---" ]; do
            full_record="$full_record"$'\n'"$line"
        done
        student="$full_record"
        
        student_name=$(echo "$student" | perl -nle 'print $1 if /<student_name>(.*?)<\/student_name>/')
        student_id=$(echo "$student" | perl -nle 'print $1 if /<student_id>(.*?)<\/student_id>/')
        student_email=$(echo "$student" | perl -nle 'print $1 if /<student_email>(.*?)<\/student_email>/')
        programme=$(echo "$student" | perl -nle 'print $1 if /<programme>(.*?)<\/programme>/')
        year=$(echo "$student" | perl -nle 'print $1 if /<year>(.*?)<\/year>/')
        address=$(echo "$student" | perl -0777 -ne 'print $1 if /<address>(.*?)<\/address>/s' | tr '\n' ' ' | sed 's/,/ /g' | sed 's/  */ /g')
        contact=$(echo "$student" | perl -nle 'print $1 if /<contact>(.*?)<\/contact>/')
        module_id=$(echo "$student" | perl -nle 'print $1 if /<module_id>(.*?)<\/module_id>/')
        module_name=$(echo "$student" | perl -nle 'print $1 if /<module_name>(.*?)<\/module_name>/')
        module_leader=$(echo "$student" | perl -nle 'print $1 if /<module_leader>(.*?)<\/module_leader>/')
        lecturer1=$(echo "$student" | perl -nle 'print $1 if /<lecturer1>(.*?)<\/lecturer1>/')
        lecturer2=$(echo "$student" | perl -nle 'print $1 if /<lecturer2>(.*?)<\/lecturer2>/')
        faculty=$(echo "$student" | perl -nle 'print $1 if /<faculty>(.*?)<\/faculty>/')
        building=$(echo "$student" | perl -nle 'print $1 if /<building>(.*?)<\/building>/')
        room=$(echo "$student" | perl -nle 'print $1 if /<room>(.*?)<\/room>/')
        exam_mark=$(echo "$student" | perl -nle 'print $1 if /<exam_mark>(.*?)<\/exam_mark>/')
        coursework1=$(echo "$student" | perl -nle 'print $1 if /<coursework1>(.*?)<\/coursework1>/')
        coursework2=$(echo "$student" | perl -nle 'print $1 if /<coursework2>(.*?)<\/coursework2>/')
        coursework3=$(echo "$student" | perl -nle 'print $1 if /<coursework3>(.*?)<\/coursework3>/')
        
        echo "$student_name,$student_id,$student_email,$programme,$year,$address,$contact,$module_id,$module_name,$module_leader,$lecturer1,$lecturer2,$faculty,$building,$room,$exam_mark,$coursework1,$coursework2,$coursework3" >> "$temp_file"
    done
    
    # Remove duplicates while preserving header, then save to final file
    head -n 1 "$temp_file" > "$csv_file"
    tail -n +2 "$temp_file" | sort -u >> "$csv_file"
    rm "$temp_file"

else
    echo "faculty,building,room,capacity" > "$temp_file"
    
    # Use perl to handle multiline matching for faculty records
    perl -0777 -ne 'while (/<faculty>(.*?)<\/faculty>/sg) { print "$1\n---RECORD---\n" }' "$xml_file" | while IFS= read -r faculty_block; do
        # Skip the separator line
        if [ "$faculty_block" = "---RECORD---" ]; then
            continue
        fi
        
        # Read until we hit the separator
        full_record="$faculty_block"
        while IFS= read -r line && [ "$line" != "---RECORD---" ]; do
            full_record="$full_record"$'\n'"$line"
        done
        faculty_block="$full_record"
        
        faculty_name=$(echo "$faculty_block" | perl -nle 'print $1 if /<faculty>(.*?)<\/faculty>/')
        building=$(echo "$faculty_block" | perl -nle 'print $1 if /<building>(.*?)<\/building>/')
        room=$(echo "$faculty_block" | perl -nle 'print $1 if /<room>(.*?)<\/room>/')
        capacity=$(echo "$faculty_block" | perl -nle 'print $1 if /<capacity>(.*?)<\/capacity>/')
        
        echo "$faculty_name,$building,$room,$capacity" >> "$temp_file"
    done
    
    # Remove duplicates while preserving header, then save to final file
    head -n 1 "$temp_file" > "$csv_file"
    tail -n +2 "$temp_file" | sort -u >> "$csv_file"
    rm "$temp_file"
fi