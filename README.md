# qinshueli的 Emacs 配置

转 spacemacs, 新的开始. 使用emacs默认快捷键.

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

```
C-; runs the command avy-goto-word-or-subword-1

C-= runs the command er/expand-region

C-+ runs the command mc/mark-next-like-this

M-Y runs the command browse-kill-ring

<M-up> runs the command md/move-lines-up

<M-down> runs the command md/move-lines-down

C-c d runs the command md/duplicate-down

C-c D runs the command md/duplicate-up

C-. runs the command set-mark-command

C-c j runs the command join-line

C-M-<backspace> runs the command kill-back-to-indentation

C-x t insert date

C-<left> windmove-left
C-<down> windmove-down
C-<up> windmove-up
C-<right> windmove-right

[C-f5]  bm-toggle
[f5]  bm-next
[f6]  bm-previous

[S-f5]  bm-show-all
[S-f6]  bm-remove-all-current-buffer
[C-f6]  bm-bookmark-annotate

# set-mark-command first , then in isearch mode.
M-z runs the command zap-to-isearch
C-o runs the command isearch-occur

# in camcorder-record
F9 stop record
shift-F9 pause record

```
