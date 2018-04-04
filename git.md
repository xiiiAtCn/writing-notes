#### git改变默认换行符
git config --global core.autocrlf false

#### 创建分支
1. 创建分支: git branch branchName
2. 切换分支: git checkout branchName
3. 创建并切换到新分支: git checkout -b branchName
4. 查看所有分支(本地和远程分支): git branch -a

#### 删除远程分支和tag
1. 删除远程分支: git push server --delete branchName
2. 删除tag: git push server --delete tag tagName
3. 推送空分支以删除远程分支: git push server :branchName
4. 推送空标签以删除远程标签: git push server :refs/tag/tagName

#### 查看commit改动
git show commit 或 git diff COMMIT^!

#### 添加和移除某文件的追踪
移除对文件的追踪: git update-index --assume-unchanged filePath  
取消对文件的移除: git update-index --no-assume-unchanged filePath

#### 远程仓库
1. 查看远程仓库: git remote -v
2. 添加远程仓库: git remote add server-name uri
3. 从远程仓库抓取数据: git fetch [remote-name] (抓取数据并不合并)
4. 推送数据到远程仓库: git push [remote-name] [branch]
5. 查看远程仓库信息: git remote show [remote-name]
6. 仓库的重命名: git remote rename [remote-name] [new-name]
7. 远程仓库的删除: git remote rm [remote-name]

#### 解决refusing to merge unrelated histories问题
在合并时添加 --allow-unrelated-histories 选项


#### 查看历史
1. git status: 查看未传送提交的次数
2. git cherry -v: 查看未推送的提交的描述/说明
3. git log master ^origin/master: 查看未推送的提交的详细说明
4. git log origin/master ^master: 查看未更新的提交的详细说明(执行之前需要执行git fetch获取提交的日志信息)


#### git仓库推送更新到指定位置
git --work-tree=/path/to/destination --git-dir=/path/to/source checkout -f

#### git保存密码到本地
git config credential.helper store

#### 撤回
1. 退回更改之前: git reset HEAD
```
    git -c core.quotepath=false -c log.showSignature=false checkout HEAD -- microservices/petri-end/src/main/resources/application.properties
```
撤销更改到当前版本
2. 退回到上一次提交: git reset HEAD~

#### 查看文件详细历史
git blame: 查询每一行代码的commitId, 提交者和提交日期

#### 查看所有分支
git reflog: 记录git某个分支的每次操作

#### 合并分支
git cheery-pick: 从其他分支中抓取commit合入当前分支中, 常用于从upstream合入patch


#### 提交规范
<关键字>#<问题编号><提交说明> 关键字可以有但不限于以下:
1. 已解决问题: finish, fix, fixed
2. 进行中: progress
3. 关闭问题: close, closed
4. 引用问题: refs, issueId
