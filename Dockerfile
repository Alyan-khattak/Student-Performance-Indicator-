# ═══════════════════════════════════════════════════════════════════
# Dockerfile
# ═══════════════════════════════════════════════════════════════════
# Docker = tumhara poora app ek isolated container mein pack karta hai
# Koi bhi machine pe same environment — no "works on my machine" issue
#
# IMAGE  = blueprint (read-only)
# CONTAINER = running instance of that image

# ── BASE IMAGE ────────────────────────────────────────────────────
# python:3.8-slim-buster
# python:3.8     → Python 3.8 pre-installed
# slim           → minimal version — unnecessary packages nahi hain
#                  full image ~900MB, slim ~120MB
# buster         → Debian 10 (Buster) OS base
FROM python:3.11-slim-bullseye

# ── WORKING DIRECTORY ─────────────────────────────────────────────
# container ke andar /app folder banao
# aage ke sab commands is folder se chalenge
# jaise cd /app karna
WORKDIR /app

# ── COPY FILES ────────────────────────────────────────────────────
# COPY <host machine se>  <container mein>
# . = current folder (Student_Performance_Indicator/)
# /app = container ka working directory
# sab files container mein copy ho jaati hain:
# app.py, requirements.txt, src/, templates/, artifacts/ etc.
COPY . /app

# ── INSTALL DEPENDENCIES ──────────────────────────────────────────
# container ke andar pip install chalao
# requirements.txt se sab packages install hote hain
# RUN = image build hote waqt ek baar chalta hai
RUN pip install -r requirements.txt

# ── START COMMAND ─────────────────────────────────────────────────
# container start hone pe yeh command chale
# CMD = container RUN hote waqt chalta hai (build pe nahi)
# ["python", "app.py"] = python app.py
CMD ["python", "app.py"]

# ─────────────────────────────────────────────────────────────────
# HOW TO USE:
#
# 1. Image build karo:
#    docker build -t student-performance-indicator .
#    -t = tag/naam do image ko
#    .  = current folder mein Dockerfile dhundho
#
# 2. Container run karo:
#    docker run -p 5000:5000 student-performance-indicator
#    -p 5000:5000 = host port 5000 → container port 5000
#
# 3. Browser mein:
#    http://localhost:5000
#
# ── DRY RUN — build process ───────────────────────────────────────
# docker build chalne pe yeh hota hai step by step:
#
# Step 1: FROM python:3.8-slim-buster
#         Docker Hub se image download karta hai
#
# Step 2: WORKDIR /app
#         container mein /app folder banta hai
#
# Step 3: COPY . /app
#         tumhari sab files container mein jaati hain
#         app.py, requirements.txt, src/, artifacts/ etc.
#
# Step 4: RUN pip install -r requirements.txt
#         flask, pandas, sklearn, catboost etc. install hote hain
#         yeh layer cache hoti hai — dobara build pe fast hoga
#
# Step 5: Image ready — .tar file jaisi packed hoti hai
#
# docker run pe:
#   CMD chalta hai → python app.py
#   Flask starts on port 5000
#   Container isolated environment mein chal raha hai
# ─────────────────────────────────────────────────────────────────