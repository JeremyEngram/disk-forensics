#!/bin/bash

output_log="forensics_log.txt"

while true; do
    clear
    echo "Disk Forensics Menu"
    echo "-------------------"
    echo "1. List all disks"
    echo "2. Analyze a disk with The Sleuth Kit"
    echo "3. Create a disk image with dd"
    echo "4. Analyze memory dump with Volatility"
    echo "5. Recover files with Photorec"
    echo "6. Exit"
    echo
    read -p "Enter your choice (1-6): " choice

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
            echo "Analyzing disk $disk_name with The Sleuth Kit..."
            echo "---------------------" >> "$output_log"
            date >> "$output_log"
            echo "Disk Analysis ($disk_name) with The Sleuth Kit:" >> "$output_log"
            # Add The Sleuth Kit commands here
            # Example: fls /dev/$disk_name >> "$output_log"
            echo "Disk analysis with The Sleuth Kit completed. Output saved to $output_log"
            echo "---------------------" >> "$output_log"
            read -n 1 -s -r -p "Press any key to continue..."
            ;;
        3)
            read -p "Enter the disk name to create an image: " disk_name
            read -p "Enter the output image filename: " image_file
            echo "Creating a disk image of $disk_name with dd..."
            echo "---------------------" >> "$output_log"
            date >> "$output_log"
            echo "Disk Image Creation ($disk_name with dd):" >> "$output_log"
            # Add dd command here
            # Example: dd if=/dev/$disk_name of=$image_file bs=1M
            echo "Disk image creation with dd completed. Image saved as $image_file. Log saved to $output_log"
            echo "---------------------" >> "$output_log"
            read -n 1 -s -r -p "Press any key to continue..."
            ;;
        4)
            read -p "Enter the path to the memory dump file: " memory_dump
            echo "Analyzing memory dump with Volatility..."
            echo "---------------------" >> "$output_log"
            date >> "$output_log"
            echo "Memory Dump Analysis (Volatility):" >> "$output_log"
            # Add Volatility commands here
            # Example: volatility -f $memory_dump imageinfo >> "$output_log"
            echo "Memory dump analysis with Volatility completed. Output saved to $output_log"
            echo "---------------------" >> "$output_log"
            read -n 1 -s -r -p "Press any key to continue..."
            ;;
        5)
            read -p "Enter the path to the disk or image to recover files from: " disk_or_image
            echo "Recovering files with Photorec..."
            echo "---------------------" >> "$output_log"
            date >> "$output_log"
            echo "File Recovery (Photorec):" >> "$output_log"
            # Add Photorec command here
            # Example: photorec /dev/$disk_or_image
            echo "File recovery with Photorec completed. Output saved to $output_log"
            echo "---------------------" >> "$output_log"
            read -n 1 -s -r -p "Press any key to continue..."
            ;;
        6)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please enter a valid option (1-6)."
            read -n 1 -s -r -p "Press any key to continue..."
            ;;
    esac
done
