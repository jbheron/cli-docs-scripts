LOCALE=$1
if [ -z "$1" ]
  then
    LOCALE=en-US
fi

TARGET_DIR=public/$LOCALE/cf
mkdir -p $TARGET_DIR

cp header.txt $TARGET_DIR/index.html

# set page language in <html> tag
sed -i -e "s/LOCALE/$LOCALE/i" $TARGET_DIR/index.html

# make current locale the language menu title
sed -i -e "s,\(li\)\(..a href.*%LOCALE%\),\1 id=\"current-lang\"\2,i" %TARGET_DIR%\index.html

LANG=$LOCALE cf -h >> $TARGET_DIR/index.html

sed -i -f cf-cmd-list.sed $TARGET_DIR/index.html

sed -i -e "s/CF_VERSION/`cat cf-version.txt`/i" $TARGET_DIR/index.html
