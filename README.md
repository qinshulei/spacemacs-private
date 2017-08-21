# qinshulei的 Emacs 配置

转 spacemacs, 新的开始. 使用emacs默认快捷键，不使用evil. 

快捷键习惯继承自 purcell/emacs.d 。平时主要方向是shell，python脚本， 以及html css js一些前端。

## 使用方法

```
git clone https://github.com/syl20bnr/spacemacs.git ~/.emacs.d
git clone https://github.com/qinshulei/spacemacs-private.git ~/.spacemacs.d/
```

## extra packages
+ camcorder 支持 gif 录制
+ keyfreq 记录按键频率
+ multiple-cursors 多行编辑
+ visual-regexp 实时显示正则的match结果
+ anzu 实时显示isearch的match结果
+ dired+ 目录的一些操作
+ move-dup 方便的行操作
+ helm-dash 查看dash文档
+ browse-kill-ring 浏览粘贴板
+ groovy-mode 支持groovy语言
+ helm-flx helm-fuzzier 更好的helm排序

## extra config
+ 支持org babel dot格式的图的显示

## special key bindings

Keybinding         | Description
-------------------|------------------------------------------------------------
<kbd>C-c o</kbd>         | Open the currently visited file with an external program.
<kbd>C-;</kbd>           | runs the command avy-goto-word-or-subword-1
<kbd>C-=</kbd>           | runs the command er/expand-region
<kbd>C-+</kbd>           | runs the command mc/mark-next-like-this
<kbd>M-Y</kbd>           | runs the command browse-kill-ring
<kbd>M-up</kbd>          | runs the command md/move-lines-up
<kbd>M-down</kbd>        | runs the command md/move-lines-down
<kbd>C-c d</kbd>         | runs the command md/duplicate-down
<kbd>C-c D</kbd>         | runs the command md/duplicate-up
<kbd>C-.</kbd>           | runs the command set-mark-command
<kbd>C-c j</kbd>         | runs the command join-line
<kbd>C-M-backspace</kbd> | runs the command kill-back-to-indentation
<kbd>C-x t</kbd>         | insert date
<kbd>C-left</kbd>        | windmove-left
<kbd>C-down</kbd>        | windmove-down
<kbd>C-up</kbd>          | windmove-up
<kbd>C-right</kbd>       | windmove-right
<kbd>C-f5</kbd>          | bm-toggle
<kbd>f5</kbd>            | bm-next
<kbd>f6</kbd>            | bm-previous
<kbd>S-f5</kbd>          | bm-show-all
<kbd>S-f6</kbd>          | bm-remove-all-current-buffer
<kbd>C-f6</kbd>          | bm-bookmark-annotate

# set-mark-command first , then in isearch mode.
Keybinding         | Description
-------------------|------------------------------------------------------------
<kbd>M-z</kbd> | runs the command zap-to-isearch
<kbd>C-o</kbd> | runs the command isearch-occur

# in camcorder-record
Keybinding         | Description
-------------------|------------------------------------------------------------
<kbd>F9</kbd>       | stop record
<kbd>shift-F9</kbd> | pause record



## for windows

config home , and path by bat.

layer chinese don't support windows, close it.

windows don't support empty file. init these file.

```
set OLDPATH=%PATH%
set PATH=%PATH%;C:\Program Files (x86)\Git\bin
set LANG=en
set HOME=C:\Users\ts
C:\Users\ts\Desktop\emacs-25.1\bin\runemacs --debug-init %*
```
