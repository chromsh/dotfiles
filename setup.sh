# fzf
if [ ! -e ~/.fzf ] ; then 
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install
fi

# anyenv
if [ ! -e ~/.anyenv ] ; then 
	git clone https://github.com/anyenv/anyenv ~/.anyenv
	echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.bash_profile
	~/.anyenv/bin/anyenv init
	~/.anyenv/bin/anyenv install --init
	echo "do : exec $SHELL -l"
fi


# ないもの追加
find . -type f | grep -v .git | grep -v setup.sh | while read line; do
    if [ -e ~/$line ]; then
        continue
    fi
    # echo $line
done

