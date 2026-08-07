# Day 05: Bash Scripting + Text Processing Tools

## What I did today
Covered the basics of bash scripting — variables, conditionals, and loops — then moved into text processing tools (grep, awk, sed), which turned out to be the most useful part of the day. Combined grep and awk together for a real log-parsing use case.

## Concepts and Commands Learned

### Variables
```bash
name="DevOps"          # no spaces around =
echo "Hello $name"     # $ to access the value
today=$(date)          # store a command's output in a variable
```

### Conditionals (if/else)
```bash
if [ -f "$filename" ]
then
    echo "File exists"
else
    echo "File does not exist"
fi
```
- `-f` checks if a file exists
- `fi` closes the if block (if spelled backwards)

### Comparison Operators
| Operator | Meaning |
|----------|---------|
| `-eq` | equal to |
| `-ne` | not equal to |
| `-gt` | greater than |
| `-lt` | less than |
| `-ge` | greater than or equal to |
| `-le` | less than or equal to |

### Loops

**For loop:**
```bash
for i in 1 2 3 4 5
do
    echo "Number: $i"
done

for i in {1..5}     # range shortcut
do
    task
done
```

**While loop:**
```bash
count=1
while [ $count -le 5 ]
do
    echo "Count: $count"
    count=$((count + 1))    # increment is essential, otherwise infinite loop
done
```

### Text Processing Tools (the most important part)

**grep — pattern search**
```bash
grep "text" file          # show matching lines
grep -i "text" file       # case-insensitive search
grep -c "text" file       # show only the count of matches
```

**awk — extracting columns**
```bash
awk '{print $1}' file       # print first column
awk '{print $1, $3}' file   # print first and third columns
```
(files are split into columns by whitespace by default)

**sed — find and replace**
```bash
sed 's/old/new/' file       # preview only, doesn't modify the file
sed -i 's/old/new/' file    # in-place, permanent change
```

**Combining tools (real use case)**
```bash
grep "ERROR" file | awk '{print $1}'   # extract dates of ERROR lines
```

### Script Permissions — worth remembering
```bash
chmod +x script.sh   # only needed once, when the script is created
./script.sh          # can run as many times as needed after that
```
Editing the script later doesn't require running `chmod` again.

## Where I got stuck
Initially forgot the `count=$((count + 1))` line in the while loop and ended up with an infinite loop. Also took a moment to get used to `sed`'s default behavior — it only previews changes unless you pass `-i`.

## Files in this folder
- `app.conf`, `app.conf.bak` — sample config files for practicing sed/grep
- `application.log`, `sample.log` — log files used for grep/awk practice
- `checkfile.sh` — script to check file existence/status
- `createfiles.sh` — script to bulk-create test files
- `logmonitor.sh` — script combining grep + awk to monitor logs
- `students.txt` — sample data file for awk column practice
- `file1.txt` to `file5.txt`, `test.txt` — test files created during practice

## Interview Question Prep

**Q: How do you count how many times a pattern appears in a file?**
A: `grep -c "pattern" filename`

**Q: How do you search case-insensitively?**
A: `grep -i "pattern" filename`

**Q: How do you replace text in a file permanently?**
A: `sed -i 's/old/new/' filename`

**Q: How do you extract a specific column from a file?**
A: `awk '{print $1}' filename`

**Q: Difference between a for loop and a while loop?**
A: A for loop iterates over a fixed list/range. A while loop keeps running as long as a condition remains true.

**Q: How do you check if a file exists in a script?**
A: `if [ -f "$filename" ]; then ... fi`
