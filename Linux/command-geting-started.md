```
192.168.1.110

dev server:
    3gb memory
    1 processor
    shutdown and remove cd/dvd (auto detect)
```
```
command: 
    tail -n 10 hello.txt (10 dong cuoi)
    tail -f hello.txt (log realtime)

    other command:
        df -h /
        free -m
        top

    sp command:
        netstat -tlpun
        
        <!-- trien khai du an: test connection: muon biet server co thong den server database, server git,... -->
        telnet 192.168.1.199 80

        <!-- telnet ko success nhung server có tồn tại -->
        traceroute -T -p 80 192.168.1.199

    permission:
        clean: adduser -> deluser + rm /home/user
        usermod -aG <group> <user>
        chown -R <user>:<group> dir
        chmod -R 750 dir
    processing:
        ps -ef 
        <!-- filter process -->
        ps -ef | grep "[j]ava -jar"
```
