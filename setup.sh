THIS_DIR=$(cd $(dirname $0); pwd)

# rosetta
sudo softwareupdate --install-rosetta --agree-to-license

# MacOS defaults
echo "run defaults.sh ..."
/bin/zsh "${THIS_DIR}/defaults.sh"

# Homebrew
if !(type "brew" >/dev/null 2>&1); then
    echo "installing Homebrew ..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo "run brew doctor ..."
brew doctor

echo "run brew update ..."
brew update

echo "run brew upgrade ..."
brew upgrade

echo "run brew bundle ..."
brew bundle --file=${THIS_DIR}/Brewfile

echo "run brew cleanup ..."
brew cleanup

# dotfiles
echo "setup dotfiles ..."
for dotfile in $(ls -a ${THIS_DIR}/dotfiles | grep -v ".??*"); do
    ln -snfv "${THIS_DIR}/dotfiles/$dotfile" "$HOME/$dotfile"
done

# 各種CLIのインストール
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /

# シェルの再起動
exec $SHELL -l