#### 基本的Linux文件系统
Linux采用了一种标准格式来为硬盘分配设备名称. 对于老式的IDE驱动器, Linux使用的是/dev/hdx, 其中x表示一个字母. 对于较新的SATA驱动器和SCSI驱动器, Linux使用/dev/sdx.
分区采用fdisk  
##### 创建文件系统
在存储数据之前, 需要用某种文件系统对分区格式化. 主要有以下几种格式化分区工具
1. mkefs: 创建一个ext文件系统
2. mke2fs: 创建一个ext2文件系统
3. mkfs.ext3: 创建一个ext3文件系统
4. mkfs.ext4: 创建一个ext4文件系统
5. mkreiserfs: 创建一个ReiserFS文件系统
6. jfs_mkfs: 创建一个JFS文件系统
7. mkfs.xfs: 创建一个XFS文件系统
8. mkfs.zfs: 创建一个ZFS文件系统
9. mkfs.btrfs: 创建一个Btrfs文件系统

#### 文件系统的检查与修复
fsck命令能够检查和修复大部分类型的Linux文件系统.
```
fsck options filesystem
```
> 只能在未挂载的文件系统上运行fsck命令