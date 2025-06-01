```
vi /lib/systemd/system/<shoeshop>.service
```
```
[Unit]
Description=My Spring Boot Application
After=network.target

[Service]
Type=simple
User=<shoeshop>
Restart=on-failure
RestartSec=10
WorkingDirectory=/projects/<shoeshop>
ExecStart=/usr/bin/java -jar /projects/<path>/target/<shoe-ShoppingCart>-0.0.1-SNAPSHOT.jar

[Install]
WantedBy=multi-user.target

```
```
systemctl daemon-reload
systemctl enable shoeshop
```
