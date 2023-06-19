#!/bin/bash

output_log="forensics_log.txt"

while true; do
    clear
    echo "Disk Forensics Menu"
    echo "-------------------"
    echo "1. List all disks"
    echo "2. Analyze a disk"
    echo "3. Exit"
    echo
    read -p "Enter your choice (1-3): " choice

    case $choice in
        1)
            echo "Listing all disks..."
            echo "---------------------" >> "$output_log"
            date >> "$output_log"
            echo "Disk List:" >> "$output_log"
            lsblk >> "$output_log"
            echo "---------------------" >> "$output_log"
            echo "Disk list saved to $output_log"
            read -n 1 -s -r -p "Press any key to continue..."
            ;;
        2)
            read -p "Enter the disk name to analyze: " disk_name
            echo "Analyzing disk $disk_name..."
            echo "---------------------" >> "$output_log"
            date >> "$output_log"
            echo "Disk Analysis ($disk_name):" >> "$output_log"
            # Add your disk analysis commands here
            # For example, you can use 'dd' command to create a disk image
            # dd if=/dev/$disk_name of=disk_image.img bs=1M
            echo "Disk analysis completed. Output saved to $output_log"
            echo "---------------------" >> "$output_log"
            read -n 1 -s -r -p "Press any key to continue..."
            ;;
        3)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please enter a valid option (1-3)."
            read -n 1 -s -r -p "Press any key to continue..."
            ;;
    esac
done
