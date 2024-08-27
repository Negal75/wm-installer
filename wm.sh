#!/bin/bash

# Function to check and install WM
install_wm() {
    # Detect the distribution
    if [ -f /etc/debian_version ]; then
        # Debian/Ubuntu
        echo "Detected Debian/Ubuntu system. Installing $wm..."
        sudo apt update
        case $wm in
            XFCE)
                sudo apt install -y xfce4
                ;;
            LXDE)
                sudo apt install -y lxde
                ;;
            LXQT)
                sudo apt install -y lxqt
                ;;
            i3WM)
                sudo apt install -y i3
                ;;
            IceWM)
                sudo apt install -y icewm
                ;;
        esac
    elif [ -f /etc/fedora-release ]; then
        # Fedora
        echo "Detected Fedora system. Installing $wm..."
        sudo dnf install -y $wm
    elif [ -f /etc/SuSE-release ]; then
        # openSUSE
        echo "Detected openSUSE system. Installing $wm..."
        sudo zypper install -y $wm
    elif [ -f /etc/arch-release ]; then
        # Arch Linux
        echo "Detected Arch Linux system. Installing $wm..."
        sudo pacman -S --noconfirm $wm
    else
        echo "Unsupported Linux distribution. Please install WM manually."
        exit 1
    fi
}

# Function to display the main menu
main_menu() {
    clear
    echo "WM Installer"
    echo "---------------"
    echo "1. XFCE"
    echo "2. LXDE"
    echo "3. LXQT"
    echo "4. i3WM"
    echo "5. IceWM"
    echo "6. Exit"
    echo "Ver.: 0.1Test"
    echo -n "Enter your choice: "
    read choice

    case $choice in
        1)
            wm="xfce4"
            install_wm
            echo "XFCE installation completed. Press Enter to continue..."
            read
            main_menu
            ;;
        2)
            wm="lxde"
            install_wm
            echo "LXDE installation completed. Press Enter to continue..."
            read
            main_menu
            ;;
        3)
            wm="lxqt"
            install_wm
            echo "LXQT installation completed. Press Enter to continue..."
            read
            main_menu
            ;;
        4)
            wm="i3"
            install_wm
            echo "i3WM installation completed. Press Enter to continue..."
            read
            main_menu
            ;;
        5)
            wm="icewm"
            install_wm
            echo "IceWM installation completed. Press Enter to continue..."
            read
            main_menu
            ;;
        6)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please try again."
            sleep 2
            main_menu
            ;;
    esac
}

# Start the main menu
main_menu
