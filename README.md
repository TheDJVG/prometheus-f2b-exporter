# prometheus-f2b-exporter
This is a generic Fail2ban exporter using the fail2ban server socket directly. By default it listens on `:9635` as port was already allocated for another Fail2ban exporter.

## Usage
```bash
usage: prometheus-f2b-exporter [-h] [-version] [-web.listen-address WEB_LISTEN] [-fail2ban.socket-path F2B_SOCKET_PATH] [-log-level LOG_LEVEL]

Export fail2ban metrics in Prometheus format.

optional arguments:
  -h, --help            show this help message and exit
  -version              show program's version number and exit
  -web.listen-address WEB_LISTEN
                        Listen on this address. (default: :9635)
  -fail2ban.socket-path F2B_SOCKET_PATH
                        Path to fail2ban socket. (default: /var/run/fail2ban/fail2ban.sock)
  -log-level LOG_LEVEL  Configure the logging level. (default: 20)
```

#### Recommendations
Change ownership of socket to a user only used by the exporter. Otherwise it might be required to run the export as root. 

## ToDo

- systemd service