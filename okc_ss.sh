#!/bin/sh

install() {
    pip install https://github.com/shadowsocks/shadowsocks/archive/master.zip -U
}

cfg () {
    echo '{' > /etc/shadowsocks.json   
    echo '  "server":"0.0.0.0",' >> /etc/shadowsocks.json   
    echo '  "server_port":51986,' >> /etc/shadowsocks.json   
    echo '  "local_port":1080,' >> /etc/shadowsocks.json   
    echo '  "password":"vps@2020",' >> /etc/shadowsocks.json   
    echo '  "timeout":600,' >> /etc/shadowsocks.json   
    echo '  "method":"chacha20-ietf-poly1305"' >> /etc/shadowsocks.json   
    echo '}' >> /etc/shadowsocks.json   
}

cfg_service() {
    touch /etc/systemd/system/shadowsocks.service
    echo '[Unit]' > /etc/systemd/system/shadowsocks.service
    echo 'Description=Shadowsocks' >> /etc/systemd/system/shadowsocks.service
    echo '[Service]' >> /etc/systemd/system/shadowsocks.service
    echo 'ExecStart=/usr/bin/ssserver -c /etc/shadowsocks.json' >> /etc/systemd/system/shadowsocks.service
    echo '[Install]' >> /etc/systemd/system/shadowsocks.service
    echo 'WantedBy=multi-user.target' >> /etc/systemd/system/shadowsocks.service
    systemctl enable shadowsocks
}

start_ss() {
    #启动
    systemctl start shadowsocks
}

status_ss() {
    #查看状态
    systemctl status shadowsocks
}

stop_ss() {
    #关闭服务
    systemctl stop shadowsocks
}

if [ $# != 1 ];then
    echo [0] 安装
    echo [1] 更新
    echo [2] 查看
    echo [3] 启动
    echo [4] 停止
    echo [5] 重启
    echo [6] 卸载
    echo [7] 退出
fi

while read -p "选择: " num
do

if [ $num == 0 ];then
    install
    cfg
    cfg_service
    systemctl enable shadowsocks
fi

if [ $num == 1 ];then
    install
fi

if [ $num == 2 ];then
    cat /etc/shadowsocks.json
    status_ss
fi

if [ $num == 3 ];then
    start_ss
fi

if [ $num == 4 ];then
    stop_ss
    status_ss
fi

if [ $num == 5 ];then
    systemctl restart shadowsocks
    status_ss
fi

if [ $num == 6 ];then
    systemctl disable shadowsocks
    stop_ss
    status_ss
    pip uninstall -y shadowsocks
    rm /etc/shadowsocks.json
    rm /etc/systemd/system/shadowsocks.service
fi

if [ $num == 7 ];then
    break
fi

echo [0] 安装
echo [1] 更新
echo [2] 查看
echo [3] 启动
echo [4] 停止
echo [5] 重启
echo [6] 卸载
echo [7] 退出

done
