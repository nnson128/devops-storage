[Service]
Type=simple
Restart=on-failure
WorkingDirectory=/projects/vision
ExecStart=npm run start -- --port=3000