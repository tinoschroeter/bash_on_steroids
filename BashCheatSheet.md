## Bash Cheat Sheet

- [File Operators](#File_Operators)
- [String Operators](#String_Operators)
- [String Manipulation](#String_Manipulation)
- [Arrays](#Arrays)
- [Hashes](#Hashes)
- [Here Document](#Here_Document)
- [Misc](#Misc)


# File_Operators

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

# String_Operators

The complete list of bash 4.2 string operators:
```
-z STRING            True if string is empty.
    
-n STRING            True if string is not empty.
    
STRING1 = STRING2    True if the strings are equal.

STRING1 != STRING2   True if the strings are not equal.

STRING1 < STRING2    True if STRING1 sorts before STRING2 lexicographically.

STRING1 > STRING2    True if STRING1 sorts after STRING2 lexicographically.
```
# String_Manipulation

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

# Arrays

Indexed arrays require no declaration
```
arr=("string 1", "string 2", "string 3")
arr=([1]="string 1", [2]="string 2", [3]="string 3")

arr[4]="string 4"
```

Check below under "Hashes" for accessing the different properties of an array.

# Hashes

Since Bash v4 Hashes need declaration!
```
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
# Here_Document

Bash allow here documents like this

```
cat <<EOT
[...]
EOT

To disable substitution in the here doc text quote the marker with single or double quotes.

cat <<'EOT'

To strip leading tabs use

cat <<-EOT
```

# Misc
