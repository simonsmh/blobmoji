ui_print "- Searching in fonts.xml"
[[ -d /sbin/.magisk/mirror ]] && MIRRORPATH=/sbin/.magisk/mirror || unset MIRRORPATH
FILE=/system/etc/fonts.xml
FILENAME=$(sed -ne '/<family lang="und-Zsye".*>/,/<\/family>/ {s/.*<font weight="400" style="normal">\(.*\)<\/font>.*/\1/p;}' $MIRRORPATH$FILE)
for i in $FILENAME
do
    ui_print "- Copying fonts files to $i"
    cp -f $MODPATH/system/fonts/Blobmoji.ttf $MODPATH/system/fonts/$i
done

rm $MODPATH/LICENSE* 2>/dev/null
