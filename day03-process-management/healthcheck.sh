#!/bin/bash
echo "=== Disk Usage ==="
df -h
echo "=== Memory Usage ==="
free -m
echo "=== Practice Folder Size ==="
du -sh ~/devops-practice
