# 🍯 HoneyTrack - Unified Honeypot & Threat Intelligence Platform

A production-ready, multi-protocol honeypot system designed for cybersecurity research, threat detection, and attacker profiling.

---

## 🚀 Features

### 🛡️ Multi-Protocol Honeypots
- **HTTP Honeypot** (Port 8080) — Emulates vulnerable web server detecting SQLi, XSS, Path Traversal, Command Injection, SSRF, XXE, and scanner activity
- **SSH Honeypot** (Port 2222) — Captures brute-force attempts and attacker commands

### 🗺️ Advanced Geolocation (GeoLite2 City)
- Country, City, Region, Latitude/Longitude via **GeoLite2-City**
- Identifies ISP/Cloud providers (OVH, Cloudflare, Google) vs Tor exit nodes
- Interactive world map with real-time attacker markers

### 🧠 ML-Powered Threat Detection
- Real-time anomaly detection using **Isolation Forest + Random Forest**
- Trained on the **UNSW-NB15** dataset
- Severity classification: LOW / MEDIUM / HIGH / CRITICAL
- Automatic alert generation for anomalous behavior

### 🦠 VirusTotal Intelligence
- Automated IP reputation checking against **70+ security vendors**
- Rate-limited queue system for free API tier (4 req/min)
- Local caching with configurable TTL
- Verdict classification: Malicious / Suspicious / Low Risk / Clean
- Per-IP threat intelligence cards with AS Owner, tags, and recommended actions

### 🎯 MITRE ATT&CK Mapping
- Automatic mapping of detected attacks to MITRE ATT&CK techniques
- Supports 15+ techniques (T1190, T1059, T1083, T1110, T1595, etc.)
- Visual frequency distribution with progress bars

### 📊 Live Dashboard
- Real-time attack monitoring with 5-second auto-refresh
- Interactive world map with attacker geolocation markers
- Attack timeline chart
- Protocol breakdown (SSH vs HTTP)
- Dynamic attack type distribution chart
- VirusTotal intelligence panel with detailed cards
- MITRE ATT&CK techniques table
- Top attacked paths
- Live activity feed

---

## 🏗️ Architecture

```
HoneyTrack/
├── server/
│   └── unified_server.py   # Unified server entry point + Flask API
├── core/                   # Honeypot engines
│   ├── http_honeypot.py    # HTTP honeypot (port 8080)
│   ├── ssh_honeypot.py     # SSH honeypot (port 2222)
│   └── event_queue.py      # Thread-safe event queue
├── database/
│   └── db_manager.py       # MySQL database operations
├── ml/
│   ├── predictor.py        # Machine learning anomaly detection
│   └── models/             # Pre-trained .pkl model files
├── virustotal/
│   └── vt_client.py        # VirusTotal API integration
└── app/
    ├── dashboard-1.html    # Live attack dashboard
    ├── login.html          # Authentication page
    └── GeoLite2-City.mmdb  # MaxMind geolocation database
```

---

## 🗄️ Database Schema

9 normalized tables with foreign keys and indexes:

| Table | Description |
|-------|-------------|
| `attackers` | Core attacker profiles |
| `geolocation` | GeoIP data per attacker |
| `credential_attempts` | SSH/HTTP login attempts |
| `sessions` | SSH session tracking |
| `command_logs` | SSH commands executed |
| `http_requests` | HTTP attack requests |
| `ml_results` | ML prediction results |
| `vt_reports` | VirusTotal scan reports |
| `alerts` | Generated security alerts |

---

## 🛡️ Attack Detection

| Attack Type | Detection Method | MITRE Technique |
|-------------|-----------------|-----------------|
| SQL Injection | Pattern matching | T1190, T1505 |
| XSS | Pattern matching | T1189, T1059 |
| Path Traversal | Pattern matching | T1083, T1005 |
| Command Injection | Pattern matching | T1059, T1203 |
| SSRF | Pattern matching | T1090, T1190 |
| SSH Brute Force | Auth attempt logging | T1110, T1078 |
| Web Scanning | UA + path analysis | T1595, T1046 |
| Anomaly | Isolation Forest (ML) | T1190, T1203 |

---

## 🔧 Installation

```bash
# Clone repository
git clone https://github.com/yourusername/HoneyTrack.git
cd HoneyTrack

# Install dependencies
pip install -r requirements.txt

# Configure environment
cp .env.example .env
# Edit: DB_HOST, DB_USER, DB_PASS, DB_NAME, VT_API_KEY, SECRET_KEY

# Download GeoLite2-City database (free MaxMind registration required)
# Place in: app/GeoLite2-City.mmdb

# Run the server
python server/unified_server.py
```

---

## 🌐 Access

| Service | URL |
|---------|-----|
| Dashboard | http://localhost:5000 |
| HTTP Honeypot | http://localhost:8080 |
| SSH Honeypot | localhost:2222 |

---

## 🔒 Security Features

- JWT-based authentication with HTTP-only cookies
- Parameterized SQL queries (no injection risk)
- Rate-limited VirusTotal queue
- GeoIP caching to minimize external requests

---

## 📊 Key Metrics Tracked

- Total attacks, unique IPs, open alerts, ML anomalies
- SQLi, XSS, Path Traversal, Command Injection, SSRF counts
- SSH brute force attempts with credential logging
- Scanner detection (Nmap, Nikto, SQLMap, Burp, Nessus)
- Hourly attack rate and 24h timeline trends
- MITRE ATT&CK technique frequency

---

## 🔧 Requirements

- Python 3.12+
- MySQL 8.0+
- GeoLite2-City.mmdb (MaxMind — free registration)
- VirusTotal API Key (free tier supported)

---

## ⚠️ Legal Disclaimer

This tool is developed for **educational and research purposes only**
as part of a cybersecurity engineering capstone project.

Deploy only in **controlled lab environments**.
Do not use against systems you do not own or have explicit permission to test.

---

## 👨‍💻 Author

Developed as a Final Year Capstone Project
Jordan University of Science and Technology
Department of Cybersecurity Engineering — 2026

---

**Built with ❤️ for cybersecurity education and research.**
