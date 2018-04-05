#### 打开端口
> 以8000端口为例
1. iptables -I INPUT -p tcp --dport 8000 -j ACCEPT
2. iptables save
3. iptables status
4. iptables restart