## Bash Cheat Sheet

  * [File Operators](#File_Operators)
  * [String Operators](#String_Operators)
  * [String Manipulation](#String_Manipulation)
  * [Arrays](#Arrays)
  * [Hashes](#Hashes)
  * [Conditionals](#Conditionals)
    * [if](#if)
    * [case](#case)
  * [Loops](#Loops)
    * [for](#for)
    * [while](#while)
    * [until](#until)
  * [Here Document](#Here_Document)
  * [Example](#Example)


File_Operators
==============

The complete list of bash 4.2 test operators:
```
-a FILE        True if file exists.
-b FILE        True if file is block special.
-c FILE        True if file is character special.
-d FILE        True if file is a directory.
-e FILE        True if file exists.
-f FILE        True if file exists and is a regular file.
-g FILE        True if file is set-group-id.
-h FILE        True if file is a symbolic link.
-L FILE        True if file is a symbolic link.
-k FILE        True if file has its `sticky' bit set.
-p FILE        True if file is a named pipe.
-r FILE        True if file is readable by you.
-s FILE        True if file exists and is not empty.
-S FILE        True if file is a socket.
-t FD          True if FD is opened on a terminal.
-u FILE        True if the file is set-user-id.
-w FILE        True if the file is writable by you.
-x FILE        True if the file is executable by you.
-O FILE        True if the file is effectively owned by you.
-G FILE        True if the file is effectively owned by your group.
-N FILE        True if the file has been modified since it was last read.
    
FILE1 -nt FILE2  True if file1 is newer than file2 (according to modification date).
    
FILE1 -ot FILE2  True if file1 is older than file2.
  
FILE1 -ef FILE2  True if file1 is a hard link to file2.
```

String_Operators
================

The complete list of bash 4.2 string operators:
```
-z STRING            True if string is empty.
    
-n STRING            True if string is not empty.
    
STRING1 = STRING2    True if the strings are equal.

STRING1 != STRING2   True if the strings are not equal.

STRING1 < STRING2    True if STRING1 sorts before STRING2 lexicographically.

STRING1 > STRING2    True if STRING1 sorts after STRING2 lexicographically.
```
String_Manipulation
===================

```
${str:position}			# substring starting at position
${str:position:len}		# substring starting at position with length len
${str#ubstring}			# delete shortest match from front
${str##substring}		# delete longest match from front
${str%substring}		# delete shortest match from back
${str%%substring}		# delete longest match from back
${str/pattern/replacement}	# pattern replace
${str/#pattern/replacement}	# pattern replace at front
${str/%pattern/replacement}	# pattern replace at end
${str//pattern/replacement}	# global pattern replace
```

Arrays
======

Indexed arrays require no declaration
```bash
arr=("string 1", "string 2", "string 3")
arr=([1]="string 1", [2]="string 2", [3]="string 3")

arr[4]="string 4"
```

Check below under "Hashes" for accessing the different properties of an array.

Hashes
======

Since Bash v4 Hashes need declaration!
```bash
declare -A arr

# Assigning values to associative arrays
arr[my key]="my value"
arr["my key"]="my value"
arr[$my_key]="my value"

# Fetching values
echo ${arr[my key]}
echo ${arr["my key"]}
echo ${arr[$my_key]}

# Accessing the array
${arr[@]}         # Returns all indizes and their items (doesn't work with associative arrays)
${arr[*]}         # Returns all items
${!arr[*]}        # Returns all indizes
${#arr[*]}        # Number elements
${#arr[$n]}       # Length of $nth item

# Pushing to array
arr+=("new string value", "another new value")
```
Conditionals
============

if
==

```bash
if [ "foo" = "foo" ]; then
  echo expression evaluated as true
fi
```
```bash
if [ "foo" = "foo" ]; then
  echo expression evaluated as true
else
  echo expression evaluated as false
fi
```
```bash
if [ $var1  -eq $var2 ]; then
  echo var1 is equal to var2
elif [ $var1 -gt $var2 ]
  echo var1 is greater then var2
fi

```

case
====

```bash
case "$1" in
1)
  echo is 1
2)
 echo ist 2
3|4)
  echo is 3 or 4
*)
  echo is everything else
esac
```

Loops
=====

for
===
 
```bash
for i in {1..10};do echo $i;done
```
```bash
for i in $(ls);do
  echo $i
done
```
### while 
```bash
while :;do 
  echo "hello"
done
```
```bash
COUNTER=0
while [  $COUNTER -lt 10 ]; do
  echo The counter is $COUNTER
  (( COUNTER++ ))
done
```
### until
```bash
COUNTER=20
until [  $COUNTER -lt 10 ]; do
  echo COUNTER $COUNTER
  (( COUNTER-- ))
done
```

Here_Document
=============


Bash allow here documents like this

```bash
cat <<EOT
[...]
EOT

To disable substitution in the here doc text quote the marker with single or double quotes.

cat <<'EOT'

To strip leading tabs use

cat <<-EOT
```

Example
=======

#### Initscript example
```bash
case "$1" in
        start)
            start
            ;;
         
        stop)
            stop
            ;;
         
        status)
            status anacron
            ;;
        restart)
            stop
            start
            ;;
        condrestart)
            if test "x`pidof anacron`" != x; then
                stop
                start
            fi
            ;;
         
        *)
            echo $"Usage: $0 {start|stop|restart|condrestart|status}"
            exit 1
 
esac
```
