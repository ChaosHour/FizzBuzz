# FizzBuzz
Playing With FizzBuzz

## What is needed to run these scripts and SQL files.
- Bash
- MacOS or Linux
- MySQL `docker run -d --name ps -d -p 3306:3306/tcp  -e MYSQL_ROOT_PASSWORD=root percona/percona-server:8.0.32-24`
- PostgreSQL `docker run -d --name postq -d -p 5432:5432/tcp -e POSTGRES_PASSWORD=s3cr3t postgres:latest`
- ImageMagick `brew install imagemagick`
- [fd](https://github.com/sharkdp/fd) `brew install fd` A simple, fast and user-friendly alternative to 'find'

- PostgreSQL-Client `brew install libpq`
- MySQL-Client `brew install mysql-client`




## How to run the scripts
chmod +x or chmod 755 
```bash
❯ ./bash_demo.sh
1
2
 Fizz  [+] 
4
 Buzz  [+] 
 Fizz  [+] 
7
8
 Fizz  [+] 
 Buzz  [+] 
11
 Fizz  [+] 
13
14
 FizzBuzz  [+] 
16
17
 Fizz  [+] 
19
 Buzz  [+] 
 Fizz  [+] 
22
23
 Fizz  [+] 
 Buzz  [+] 
26
 Fizz  [+] 
28
29
 FizzBuzz  [+] 
31
32
 Fizz  [+] 
34
 Buzz  [+] 
 Fizz  [+] 
37
38
 Fizz  [+] 
 Buzz  [+] 
41
 Fizz  [+] 
43
44
 FizzBuzz  [+] 
46
47
 Fizz  [+] 
49
 Buzz  [+] 
 Fizz  [+] 
52
53
 Fizz  [+] 
 Buzz  [+] 
56
 Fizz  [+] 
58
59
 FizzBuzz  [+] 
61
62
 Fizz  [+] 
64
 Buzz  [+] 
 Fizz  [+] 
67
68
 Fizz  [+] 
 Buzz  [+] 
71
 Fizz  [+] 
73
74
 FizzBuzz  [+] 
76
77
 Fizz  [+] 
79
 Buzz  [+] 
 Fizz  [+] 
82
83
 Fizz  [+] 
 Buzz  [+] 
86
 Fizz  [+] 
88
89
 FizzBuzz  [+] 
91
92
 Fizz  [+] 
94
 Buzz  [+] 
 Fizz  [+] 
97
98
 Fizz  [+] 
 Buzz  [+] 


./thumbs.sh
[!]  Error: Please provide a directory and thumbnail directory.
 Usage:  ./thumbs.sh /path/to/<directory>  /path/to/<thumbnail directory>
 Example:./thumbs.sh ~/Downloads/pics ~/Downloads/pics

FizzBuzz on  main [!?] 
❯ ./thumbs.sh ~/Downloads/pics ~/Downloads/pics
[+] Generated thumbnail for /Users/klarsen/Downloads/pics/2-2-las-vegas-picture.png
[+] Generated thumbnail for /Users/klarsen/Downloads/pics/las-vegas2.jpg
[+] Generated thumbnail for /Users/klarsen/Downloads/pics/lasvw-exterior-0367-hor-feat-scaled.jpg
[+] Generated thumbnail for /Users/klarsen/Downloads/pics/unnamed.png
```



## How to run the SQL files
```bash
MySQL_FizzBuzz.sql
cat MySQL_FizzBuzz.sql | mysql -vv
--------------
WITH RECURSIVE numbers AS (
  SELECT 1 AS num
  UNION ALL
  SELECT num + 1
  FROM numbers
  WHERE num < 100
)
SELECT
  CASE
    WHEN num % 3 = 0 AND num % 5 = 0 THEN 'FizzBuzz'
    WHEN num % 3 = 0 THEN 'Fizz'
    WHEN num % 5 = 0 THEN 'Buzz'
    ELSE CAST(num AS CHAR)
  END AS result
FROM numbers
--------------

result
1
2
Fizz
4
Buzz
Fizz
7
8
Fizz
Buzz
11
Fizz
13
14
FizzBuzz
16
17
Fizz
19
Buzz
Fizz
22
23
Fizz
Buzz
26
Fizz
28
29
FizzBuzz
31
32
Fizz
34
Buzz
Fizz
37
38
Fizz
Buzz
41
Fizz
43
44
FizzBuzz
46
47
Fizz
49
Buzz
Fizz
52
53
Fizz
Buzz
56
Fizz
58
59
FizzBuzz
61
62
Fizz
64
Buzz
Fizz
67
68
Fizz
Buzz
71
Fizz
73
74
FizzBuzz
76
77
Fizz
79
Buzz
Fizz
82
83
Fizz
Buzz
86
Fizz
88
89
FizzBuzz
91
92
Fizz
94
Buzz
Fizz
97
98
Fizz
Buzz
100 rows in set

Bye



PostgreSQL_FizzBuzz.sql

FizzBuzz on  main [!?] 
❯ cat PostgreSQL_FizzBuzz.sql | psql -U postgres -d postgres -h 10.8.0.10 -v ON_ERROR_STOP=1
  result  
----------
 1
 2
 Fizz
 4
 Buzz
 Fizz
 7
 8
 Fizz
 Buzz
 11
 Fizz
 13
 14
 FizzBuzz
 16
 17
 Fizz
 19
 Buzz
 Fizz
 22
 23
 Fizz
 Buzz
 26
 Fizz
 28
 29
 FizzBuzz
 31
 32
 Fizz
 34
 Buzz
 Fizz
 37
 38
 Fizz
 Buzz
 41
 Fizz
 43
 44
 FizzBuzz
 46
 47
 Fizz
 49
 Buzz
 Fizz
 52
 53
 Fizz
 Buzz
 56
 Fizz
 58
 59
 FizzBuzz
 61
 62
 Fizz
 64
 Buzz
 Fizz
 67
 68
 Fizz
 Buzz
 71
 Fizz
 73
 74
 FizzBuzz
 76
 77
 Fizz
 79
 Buzz
 Fizz
 82
 83
 Fizz
 Buzz
 86
 Fizz
 88
 89
 FizzBuzz
 91
 92
 Fizz
 94
 Buzz
 Fizz
 97
 98
 Fizz
 Buzz
(100 rows)
```

