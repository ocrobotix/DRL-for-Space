
../../jbook_template/Scripts/activate   
rm -rf _build
#jb clean .
#jupyter cache clear
jb build .
start _build/html/intro.html    