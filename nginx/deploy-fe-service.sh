### create
` vi /lib/systemd/system/vision.service
FILE_AT: ./vision.service.sh

` systemctl daemon-reload

` systemctl status vision


### remove
sudo systemctl stop <service>
sudo systemctl disable <service>
sudo systemctl daemon-reload   # reload systemd
