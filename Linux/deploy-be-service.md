[Unit]
Description=My spring boot application
After=network.target

[Service]
Type=simple
User=note-be
Restart=on-failure
WorkingDirectory=/projects/note-be
ExecStart=/usr/bin/java -jar ./target/base-0.0.1-SNAPSHOT.jar