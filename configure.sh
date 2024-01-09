#!/bin/bash

unamestr=$(uname)

if [ "$unamestr" = 'Linux' ]; then
    COMPONENTS_INSTALL="sudo apt install ffmpeg yt-dlp"
elif [ "$unamestr" = 'Darwin' ]; then
    COMPONENTS_INSTALL="brew install ffmpeg yt-dlp"
fi

echo "#!/bin/bash" >> run.sh
echo $COMPONENTS_INSTALL >> run.sh
echo "" >> run.sh
echo "sudo mv svd mvd mvd-mp4 svd-mp4 /usr/local/bin/" >> run.sh


echo "#!/bin/bash" >> svd
echo "" >> svd
echo "yt-dlp --write-description --write-subs --write-thumbnail -f 'bv+ba' -o \"%(title)s\" \"\$@\"" >> svd

echo "#!/bin/bash" >> mvd
echo "" >> mvd
echo "yt-dlp --write-description --write-subs --write-thumbnail -f 'bv+ba' -o \"%(playlist_index)s-%(title)s\" \"\$@\"" >> mvd

echo "#!/bin/bash" >> svd-mp4
echo "" >> svd-mp4
echo "yt-dlp --write-description --write-subs --write-thumbnail -f 'bv[ext=mp4]+ba[ext=m4a]' -o \"%(title)s\" \"\$@\"" >> svd-mp4

echo "#!/bin/bash" >> mvd-mp4
echo "" >> mvd-mp4
echo "yt-dlp --write-description --write-subs --write-thumbnail -f 'bv[ext=mp4]+ba[ext=m4a]' -o \"%(playlist_index)s-%(title)s\" \"\$@\"" >> mvd-mp4

echo "#!/bin/bash" >> svd-mp4t
echo "" >> svd-mp4t
echo "yt-dlp --write-description --write-subs --write-thumbnail -f 'bv*[vcodec^=avc]+ba[ext=m4a]/b[ext=mp4]/b' -o \"%(title)s\" \"\$@\"" >> svd-mp4t

echo "#!/bin/bash" >> mvd-mp4t
echo "" >> mvd-mp4t
echo "yt-dlp --write-description --write-subs --write-thumbnail -f 'bv*[vcodec^=avc]+ba[ext=m4a]/b[ext=mp4]/b' -o \"%(playlist_index)s-%(title)s\" \"\$@\"" >> mvd-mp4t


chmod +x svd mvd mvd-mp4 svd-mp4 run.sh

bash ./run.sh

echo "For using youtube downloder you need to copy the link from browser" >> README.txt
echo "the open terminal in the folder where you want to save YouTube video" >> README.txt
echo "the type svd in terminal for single video download and mvd for multiple videos then paste the link" >> README.txt
