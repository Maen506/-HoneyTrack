# 🍯 HoneyTrack — Intelligent Honeypot System

A production-ready honeypot platform designed to detect, capture,
and analyze malicious network activity using machine learning,
threat intelligence, and real-time visualization.

---

## 🔍 Overview

HoneyTrack emulates vulnerable SSH and HTTP services to lure
attackers, then automatically analyzes their behavior using
ML models and the VirusTotal API, displaying everything on a
live dark-themed dashboard.

---

## ✨ Features

- **SSH Honeypot** — Captures brute-force attempts and commands
- **HTTP Honeypot** — Detects SQLi, XSS, Path Traversal,
  Command Injection, SSRF, XXE, and more
- **ML Detection** — Isolation Forest + Random Forest trained
  on UNSW-NB15 dataset
- **VirusTotal Integration** — Automatic IP reputation lookup
  across 70+ security vendors
- **MITRE ATT&CK Mapping** — Every attack mapped to techniques
- **GeoIP Tracking** — Real-time attacker origin on world map
- **Live Dashboard** — Auto-refreshing dark UI with charts,
  alerts, and threat intelligence cards
- **Alert System** — Automatic severity-based alerting

---

## 🏗️ Architecture

HoneyTrack/
├── server/
│   └── unified_server.py      # Flask API + pipeline worker
├── core/
│   ├── ssh_honeypot.py        # Paramiko-based SSH emulator
│   ├── http_honeypot.py       # Raw socket HTTP emulator
│   └── event_queue.py         # Shared event queue
├── database/
│   └── db_manager.py          # MySQL manager (9 tables)
├── ml/
│   ├── predictor.py           # Live prediction engine
│   └── models/                # Pre-trained .pkl models
├── virustotal/
│   └── vt_client.py           # VT API client + queue
└── app/
└── dashboard-1.html       # Live dashboard UI

---

## 🛡️ Attack Detection

| Attack Type       | Detection Method         | MITRE Technique |
|-------------------|--------------------------|-----------------|
| SQL Injection     | Pattern matching         | T1190           |
| XSS               | Pattern matching         | T1189           |
| Path Traversal    | Pattern matching         | T1083           |
| Command Injection | Pattern matching         | T1059           |
| SSRF              | Pattern matching         | T1090           |
| SSH Brute Force   | Auth attempt logging     | T1110           |
| Web Scanning      | UA + path analysis       | T1595           |
| Anomaly Detection | Isolation Forest (ML)    | T1190, T1203    |

---

## 🗄️ Database Schema

9 tables: `attackers`, `geolocation`, `credential_attempts`,
`sessions`, `command_logs`, `http_requests`, `ml_results`,
`vt_reports`, `alerts`

---

## 🚀 Quick Start

```bash
# 1. Install dependencies
pip install -r requirements.txt

# 2. Configure environment
cp .env.example .env
# Edit: DB_HOST, DB_USER, DB_PASS, VT_API_KEY

# 3. Run
python server/unified_server.py

# Dashboard → http://localhost:5000
```

---

## 🔧 Requirements

- Python 3.12+
- MySQL 8.0+
- GeoLite2-City.mmdb (MaxMind)
- VirusTotal API Key (free tier)

---

## 📊 Dashboard

- Real-time KPIs — Total Attacks, Unique IPs, Alerts, Anomalies
- Attack Types Chart — Dynamic from live data
- World Map — GeoIP attacker origins
- MITRE ATT&CK Table — Full technique breakdown
- VirusTotal Cards — Per-IP threat intelligence
- Live Activity Feed — Real-time event stream

---

## ⚠️ Legal Disclaimer

This tool is developed for **educational and research purposes
only** as part of a cybersecurity engineering capstone project.
Deploy only in controlled lab environments.
Do not use against systems you do not own or have explicit
permission to test.

---

## 👨‍💻 Author

Developed as a Final Year Capstone Project
Jordan University of Science and Technology
Department of Cybersecurity Engineering — 2026

