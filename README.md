# dotfiles(for AppleSilicon Mac)

## セットアップ

- AppStore にサインイン
- 以下のコードをターミナルで実行

```sh
$ cd
$ xcode-select --install
$ git clone https://github.com/m-yoshihiro/dotfiles.git
$ chmod u+x ./dotfiles/setup.sh
$ ./dotfiles/setup.sh
```

## `setup.sh`がやること

- Rosetta2 をインストール
- `defaults.sh`でMacOSの設定
- `Brewfile`で`brew bundle`
- `dotfiles`内のファイルのシンボリックリンク作成

## その他
### 手動インストール
- Karabiner-Elements
- Karabiner-ElementViewer
- BuhoCleaner

### VSCodeの拡張・設定の移行

[Settings Sync](https://code.visualstudio.com/docs/editor/settings-sync)を使用