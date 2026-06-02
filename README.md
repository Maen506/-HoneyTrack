🍯 HoneyTrack — Intelligent Honeypot System
HoneyTrack - Advanced Honeypot System with ML-powered threat detection, real-time geolocation (GeoLite2 City + ASN), VirusTotal integration, MITRE ATT&CK mapping, and live attack dashboard.




 🍯 HoneyTrack - Unified Honeypot & Threat Intelligence Platform

A production-ready, multi-protocol honeypot system designed for cybersecurity research, threat detection, and attacker profiling.

 🚀 Features

 🛡️ Multi-Protocol Honeypots
- **HTTP Honeypot** (Port 8080) - Emulates vulnerable web server detecting SQLi, XSS, Path Traversal, Command Injection, SSRF, XXE, and scanner activity
- **SSH Honeypot** (Port 2222) - Captures brute-force attempts and attacker commands

 🗺️ Advanced Geolocation (GeoLite2 City + ASN)
- Country, City, Region, Latitude/Longitude via **GeoLite2-City**
- **ASN Number** & **Organization Name** via **GeoLite2-ASN** (e.g., AS15169 Google LLC, AS8376 Jordan Data Communications)
- Identifies ISP/Cloud providers (OVH, Cloudflare, Google) vs Tor exit nodes

 🧠 ML-Powered Threat Detection
- Real-time anomaly detection using machine learning
- Severity classification (LOW/MEDIUM/HIGH/CRITICAL)
- Automatic alert generation for anomalous behavior

 🛡️ VirusTotal Intelligence
- Automated IP reputation checking against 70+ security vendors
- Rate-limited queue system for free API tier (4 req/min)
- Local caching with configurable TTL
- Verdict classification: Malicious/Suspicious/Low Risk/Clean

 🎯 MITRE ATT&CK Mapping
- Automatic mapping of detected attacks to MITRE ATT&CK techniques
- Supports 17+ techniques (T1190, T1059, T1505, T1595, etc.)
- Visual frequency distribution with progress bars

 📊 Live Dashboard
- Real-time attack monitoring with 5-second auto-refresh
- Interactive world map with attacker geolocation markers
- Attack timeline chart (minute-by-minute)
- Protocol breakdown (SSH vs HTTP)
- Dynamic attack type distribution chart
- VirusTotal intelligence panel
- Live activity feed

 💾 Database Architecture
- MySQL database with 9 normalized tables
- Tracks: attackers, geolocation, credentials, sessions, HTTP requests, ML results, VT reports, alerts
- Professional schema with foreign keys and indexes

 🏗️ Architecture

HoneyTrack/
├── app/ # Flask web application
│ ├── app__init__.py # Unified server entry point
│ ├── dashboard-1.html # Live attack dashboard
│ └── login.html # Authentication page
├── core/ # Honeypot engines
│ ├── http_honeypot.py # HTTP honeypot (port 8080)
│ ├── ssh_honeypot.py # SSH honeypot (port 2222)
│ └── event_queue.py # Thread-safe event queue
├── database/
│ └── db_manager.py # MySQL database operations
├── ml/
│ └── predictor.py # Machine learning anomaly detection
├── virustotal/
│ └── vt_client.py # VirusTotal API integration
└── GeoLite2-*.mmdb # MaxMind geolocation databases

 🔧 Installation


 Clone repository
git clone https://github.com/yourusername/HoneyTrack.git
cd HoneyTrack

 Install dependencies
pip install -r requirements.txt

 Setup MySQL database
mysql -u root -p < schema.sql

 Download GeoLite2 databases (free registration required)
 Place in app/GeoLite2-City.mmdb and app/GeoLite2-ASN.mmdb

 Run the server
python app/app__init__.py


 🌐 Access
- **Dashboard:** http://localhost:5000
- **HTTP Honeypot:** http://localhost:8080
- **SSH Honeypot:** localhost:2222

 🛡️ Security Features
- JWT-based authentication
- HTTP-only cookies
- Role-based access control
- Input sanitization and parameterized SQL queries

 📊 Key Metrics Tracked
- Total attacks, unique IPs, open alerts
- SQLi, XSS, Path Traversal, Command Injection counts
- Brute force attempts (SSH/FTP/Telnet/RDP)
- Scanner detection (Nmap, Nikto, SQLMap, Burp, Nessus)
- Hourly attack rate and timeline trends

 📝 License
MIT License - see LICENSE file for details.

## 🤝 Contributing
Pull requests are welcome. For major changes, please open an issue first.

---

Built with ❤️ for cybersecurity education and research.
```



تقدر تنسخ هذا وتضعه في README.md للمستودع. أي تعديلات عايزها؟
