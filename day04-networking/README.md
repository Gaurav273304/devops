# Day 04: Networking Basics

## What I did today
Covered core networking concepts — connectivity testing, DNS, ports, and SSH. Learned the full flow of what happens when a browser loads a website, and set up SSH key-based authentication for the first time.

## Concepts and Commands Learned

### Connectivity Testing
```bash
ping google.com          # pings continuously (Ctrl+C to stop)
ping -c 4 google.com     # ping only 4 times
curl https://url         # shows the website's content
curl -I https://url      # shows only headers/status code
wget https://url -O file # downloads a file
```

### Status Codes (important)
| Code | Meaning |
|------|---------|
| 200 | OK — everything worked |
| 404 | Not Found — page doesn't exist |
| 403 | Forbidden — no access |
| 500 | Server Error — problem on the server side |

### Network Info
```bash
ip a                 # view your IP address
ss -tuln              # see which ports are listening
ss -tuln | grep :22    # check a specific port
```

### Common Ports (worth memorizing)
| Port | Service |
|------|---------|
| 22 | SSH |
| 53 | DNS |
| 80 | HTTP |
| 443 | HTTPS |
| 3306 | MySQL |
| 5432 | PostgreSQL |

### Core Concepts
- **IP Address** — a device's unique address (like a house address)
- **Private IP** — used within a local network (192.168.x.x)
- **Public IP** — visible on the internet
- **DNS** — converts domain names into IP addresses (like a phonebook — google.com → 142.250.183.14)
- **Port** — like a room number inside a building (same server, different services, different ports)
- **HTTP** — port 80, plain text (insecure)
- **HTTPS** — port 443, encrypted (secure)

### Browser Flow (common interview question)
1. DNS lookup — domain name resolves to an IP address
2. Browser connects to that IP
3. Port is decided automatically — 80 for HTTP, 443 for HTTPS
4. Connection is established, data transfer begins
5. Server responds and the website loads

### SSH Basics
```bash
ssh-keygen -t rsa -b 4096   # generate an SSH key pair
ls ~/.ssh                    # id_rsa (private) and id_rsa.pub (public)
ssh username@server-ip       # connect to a remote server
ssh localhost                 # test SSH on your own system
exit                          # exit an SSH session
```
**Important:** never share `id_rsa` (private key). `id_rsa.pub` (public key) is safe to share.

## Where I got stuck
Took a bit to properly understand the difference between private and public IPs, and why DNS is needed at all instead of just using IP addresses directly. Also had to look up the difference between `ping` and `curl` — ping just checks reachability, curl actually fetches content.

## Files in this folder
- `test.html` — sample file used for curl/wget practice

## Interview Question Prep

**Q: What happens when you type a URL in the browser?**
A: DNS lookup resolves the domain to an IP address, the port is decided (80 for HTTP, 443 for HTTPS), a connection is established, data is transferred, and the server responds with the page.

**Q: Difference between HTTP and HTTPS?**
A: HTTP uses port 80 and sends data in plain text (insecure). HTTPS uses port 443 and encrypts the data (secure).

**Q: What port does SSH run on?**
A: Port 22

**Q: How do you check if a service is listening on a port?**
A: `ss -tuln | grep :portnumber`

**Q: What is DNS?**
A: Domain Name System — it converts human-readable domain names into IP addresses.
