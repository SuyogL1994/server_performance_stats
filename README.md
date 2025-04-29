# server_performance_stats

✅ **How to Use**:

1. Save it as `server-stats.sh`.
2. Give it executable permissions:
   ```bash
   chmod +x server-stats.sh
   ```
3. Run it:
   ```bash
   ./server-stats.sh
   ```

---

✅ **Commands used for each metric:**

| Metric                    | Command(s) Used                          |
|----------------------------|-----------------------------------------|
| OS Version                 | `uname -a`                              |
| Uptime                     | `uptime -p`                             |
| Load Average               | `uptime` + `awk`                        |
| Logged In Users            | `who`                                   |
| CPU Usage                  | `top -bn1` + `awk`                      |
| Memory Usage               | `free -h` + `awk`                       |
| Disk Usage                 | `df -h --total` + `awk`                 |
| Top 5 by CPU/Memory         | `ps` sorted by `%cpu` and `%mem`        |
| Failed Login Attempts      | `journalctl` or `/var/log/auth.log`     |

---
