#!/data/data/com.termux/files/usr/bin/bash

# ===============================
# CodeMaster-PRO
# Author: Dark Blood (qusay47)
# Version: 1.0
# Legal Use Only
# ===============================

RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

pause() {
  echo
  read -p "اضغط Enter للعودة للقائمة الرئيسية..."
}

banner() {
clear
echo -e "${RED}
 ██████╗ ██████╗ ██████╗ ███████╗
██╔════╝██╔═══██╗██╔══██╗██╔════╝
██║     ██║   ██║██║  ██║█████╗  
██║     ██║   ██║██║  ██║██╔══╝  
╚██████╗╚██████╔╝██████╔╝███████╗
 ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝
${NC}"
echo -e "${CYAN}CodeMaster‑PRO | by Dark Blood${NC}"
echo -e "${YELLOW}Educational & Legal Use Only${NC}"
echo
}

main_menu() {
banner
echo -e "${GREEN}1) Code Tools / أدوات الأكواد"
echo "2) System Tools / أدوات النظام"
echo "3) File Tools / أدوات الملفات"
echo "4) Crypto Tools / التشفير"
echo "5) Dev Utilities / أدوات برمجية"
echo "6) About"
echo "0) Exit${NC}"
echo
read -p "Choose / اختر: " choice

case $choice in
1) code_tools ;;
2) system_tools ;;
3) file_tools ;;
4) crypto_tools ;;
5) dev_tools ;;
6) about ;;
0) exit 0 ;;
*) main_menu ;;
esac
}

code_tools() {
banner
echo "1) Fix Bash Script Permissions"
echo "2) Check Syntax (bash)"
echo "3) Count Lines of Code"
echo "0) Back"
read -p "Choose: " c

case $c in
1)
read -p "File name: " f
chmod +x "$f" && echo "تم إعطاء صلاحية التنفيذ"
pause ;;
2)
read -p "File name: " f
bash -n "$f" && echo "الكود سليم" || echo "فيه خطأ"
pause ;;
3)
read -p "File name: " f
wc -l "$f"
pause ;;
0) main_menu ;;
esac
}

system_tools() {
banner
echo "1) System Info"
echo "2) Disk Usage"
echo "3) Memory Usage"
echo "4) Running Processes"
echo "0) Back"
read -p "Choose: " s

case $s in
1) uname -a; pause ;;
2) df -h; pause ;;
3) free -h; pause ;;
4) ps aux | head; pause ;;
0) main_menu ;;
esac
}

file_tools() {
banner
echo "1) Create File"
echo "2) Delete File"
echo "3) Compress File"
echo "4) Extract Archive"
echo "0) Back"
read -p "Choose: " f

case $f in
1) read -p "File name: " n; touch "$n"; pause ;;
2) read -p "File name: " n; rm -i "$n"; pause ;;
3) read -p "File: " n; tar -czf "$n.tar.gz" "$n"; pause ;;
4) read -p "Archive: " n; tar -xvf "$n"; pause ;;
0) main_menu ;;
esac
}

crypto_tools() {
banner
echo "1) MD5 Hash"
echo "2) SHA256 Hash"
echo "3) Base64 Encode"
echo "4) Base64 Decode"
echo "0) Back"
read -p "Choose: " c

case $c in
1) read -p "Text: " t; echo -n "$t" | md5sum; pause ;;
2) read -p "Text: " t; echo -n "$t" | sha256sum; pause ;;
3) read -p "Text: " t; echo "$t" | base64; pause ;;
4) read -p "Base64: " t; echo "$t" | base64 -d; pause ;;
0) main_menu ;;
esac
}

dev_tools() {
banner
echo "1) Create Bash Template"
echo "2) Git Status"
echo "3) Git Log"
echo "0) Back"
read -p "Choose: " d

case $d in
1)
read -p "File name: " f
echo -e "#!/bin/bash\n\n# Script by CodeMaster-PRO" > "$f"
chmod +x "$f"
pause ;;
2) git status; pause ;;
3) git log --oneline | head; pause ;;
0) main_menu ;;
esac
}

about() {
banner
echo "CodeMaster‑PRO"
echo "Author: Dark Blood (qusay47)"
echo "Version: 1.0"
echo "Purpose: Coding, System & Utility Toolkit"
pause
}

while true; do
main_menu
done
