# qinshueli的 Emacs 配置

转 spacemacs, 新的开始.

## 使用方法

```
git clone https://github.com/syl20bnr/spacemacs.git ~/.emacs.d
git clone https://github.com/qinshulei/spacemacs-private.git ~/.spacemacs.d/
```

## extra packages
+ groovy-mode
+ keyfreq
+ multiple-cursors
+ visual-regexp
+ anzu
+ dired+
+ move-dup
+ helm-dash
+ browse-kill-ring

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

# set-mark-command first , then in isearch mode.
M-z runs the command zap-to-isearch
C-o runs the command isearch-occur
```
