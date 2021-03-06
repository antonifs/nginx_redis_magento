echo "Install modman"

if [ ! -d "$HOME/bin" ] ; then
    mkdir $HOME/bin

    if [ -f $HOME/.profile ]; then
        tty -s && . $HOME/.profile

        if [[ ":$PATH:" != *":$HOME/bin:"* ]]; then
            echo -e '\nPATH="$HOME/bin:$PATH"' >> $HOME/.profile
        fi
    fi
fi

SRC="https://raw.githubusercontent.com/colinmollenhour/modman/master/modman"
DEST="$HOME/bin/modman"

# test if curl/wget is installed
if hash curl 2>&- ; then
    CMD="curl -s -L $SRC -o $DEST"
elif hash wget 2>&- ; then
    CMD="wget -q --no-check-certificate -O $DEST $SRC"
else
   echo "You need to have curl or wget installed."
   exit 1
fi

$CMD

chmod +x $DEST

echo "Done. Modman installed in $HOME/bin/modman"

sudo mv ~/bin/modman /usr/bin/modman
export PATH=/usr/bin/modman:$PATH

echo "Modman init"
cd /var/www/html
modman init
cd .modman
sudo echo magento > .basedir
cd ../magento

modman clone git://github.com/colinmollenhour/Cm_Cache_Backend_Redis.git

echo "Update config"
