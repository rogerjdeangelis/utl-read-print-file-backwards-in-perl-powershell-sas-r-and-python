%let pgm=utl-read-print-file-backwards-in-perl-powershell-sas-r-and-python-many-dropdowns;

Read print file backwards in perl powershell sas r and python many dropdowns

see below for a larger text file by Bart Jablonski
https://github.com/rogerjdeangelis/utl-flip-a-file-upside-down-using-recent-fcmp-dynamic-array-by-Bart-Jablonski

Mainframe IBM MVS / OS-390 can also read a file backwards(RDBACK)

    Solutions (Drop downs)

       1 Powershell
       2 SAS (limited to 32k Hash?)
       3 R
       4 Perl
       5 Python

github
http://tinyurl.com/mry3cvab
https://github.com/rogerjdeangelis/utl-read-print-file-backwards-in-perl-powershell-sas-r-and-python


Drop down macros at end of msg and in
macros
https://tinyurl.com/y9nfugth
https://github.com/rogerjdeangelis/utl-macros-used-in-many-of-rogerjdeangelis-repositories

/*               _     _
 _ __  _ __ ___ | |__ | | ___ _ __ ___
| `_ \| `__/ _ \| `_ \| |/ _ \ `_ ` _ \
| |_) | | | (_) | |_) | |  __/ | | | | |
| .__/|_|  \___/|_.__/|_|\___|_| |_| |_|
|_|
*/

/**************************************************************************************************************************/
/*                       |                                                             |                                  */
/*       INPUT           |    PROCESS                                                  |   OUTPUT(LOG)                    */
/*                       |                                                             |                                  */
/*   d:/txt/bacwrd.txt   |    Powershell                                               |  record number 10                */
/*                       |    ==========                                               |  record number 9                 */
/*   record number 1     |    $fileName = 'd:/txt/bacwrd.txt'                          |  record number 8                 */
/*   record number 2     |    $arr = Get-Content -Path $fileName                       |  record number 7                 */
/*   record number 3     |    [array]::reverse($arr)                                   |  record number 6                 */
/*   record number 4     |    foreach($line in $arr) {                                 |  record number 5                 */
/*   record number 5     |        $line                                                |  record number 4                 */
/*   record number 6     |    }                                                        |  record number 3                 */
/*   record number 7     |                                                             |  record number 2                 */
/*   record number 8     |    SAS (limited to 32k)                                     |  record number 1                 */
/*   record number 9     |    ====================                                     |                                  */
/*   record number 10    |    infile "d:/txt/bacwrd.txt" lrecl=32756 recfm=f;          |                                  */
/*                       |    input;                                                   |                                  */
/*                       |    str=trim(_infile_);                                      |                                  */
/*                       |    cntEof=countc(_infile_,'0D0A'x);                         |                                  */
/*                       |    do rec = cntEof to 1 by -1;                              |                                  */
/*                       |     line=scan(str,rec,'0D0A'x);                             |                                  */
/*                       |     putlog line;                                            |                                  */
/*                       |    end;                                                     |                                  */
/*                       |                                                             |                                  */
/*                       |    R                                                        |                                  */
/*                       |    =                                                        |                                  */
/*                       |    lines <- readLines('d:/txt/bacwrd.txt')                  |                                  */
/*                       |    reversed_lines <- rev(lines)                             |                                  */
/*                       |    str(reversed_lines)                                      |                                  */
/*                       |    nrow(lines);                                             |                                  */
/*                       |    for ( r in seq(1,length(lines),1)) {                     |                                  */
/*                       |      print(reversed_lines[r])                               |                                  */
/*                       |      }                                                      |                                  */
/*                       |                                                             |                                  */
/*                       |    PERL                                                     |                                  */
/*                       |    ====                                                     |                                  */
/*                       |    use File::ReadBackwards ;`                               |                                  */
/*                       |    $bw = File::ReadBackwards->new('d:/txt/bacwrd.txt') or   |                                  */
/*                       |        die 'cant read file';`                               |                                  */
/*                       |    while( defined( $log_line = $bw->readline ) ) {          |                                  */
/*                       |        print $log_line ;`                                   |                                  */
/*                       |    }`                                                       |                                  */
/*                       |    ");                                                      |                                  */
/*                       |                                                             |                                  */
/*                       |    Python                                                   |                                  */
/*                       |    ======                                                   |                                  */
/*                       |    from file_read_backwards import FileReadBackwards        |                                  */
/*                       |    with FileReadBackwards('d:/txt/bacwrd.txt') as frb:      |                                  */
/*                       |        for l in frb:                                        |                                  */
/*                       |            print(l)                                         |                                  */
/*                       |                                                             |                                  */
/**************************************************************************************************************************/

/*                   _
(_)_ __  _ __  _   _| |_
| | `_ \| `_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
*/

data _null_;
  file "d:/txt/bacwrd.txt";
  do rec=1 to 10;
    put  'record number ' rec;
    putlog 'record number ' rec;
  end;
run;quit;

/**************************************************************************************************************************/
/*                                                                                                                        */
/* d:/txt/bacwrd.txt                                                                                                      */
/*                                                                                                                        */
/* record number 1                                                                                                        */
/* record number 2                                                                                                        */
/* record number 3                                                                                                        */
/* record number 4                                                                                                        */
/* record number 5                                                                                                        */
/* record number 6                                                                                                        */
/* record number 7                                                                                                        */
/* record number 8                                                                                                        */
/* record number 9                                                                                                        */
/* record number 10                                                                                                       */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*                                    _          _ _
/ |  _ __   _____      _____ _ __ ___| |__   ___| | |
| | | `_ \ / _ \ \ /\ / / _ \ `__/ __| `_ \ / _ \ | |
| | | |_) | (_) \ V  V /  __/ |  \__ \ | | |  __/ | |
|_| | .__/ \___/ \_/\_/ \___|_|  |___/_| |_|\___|_|_|
    |_|
*/

%macro utl_psbegin;
%utlfkil(c:/temp/ps_pgm.ps);
%utlfkil(c:/temp/ps_pgm.log);
filename ft15f001 "c:/temp/ps_pgm.ps1";
%mend utl_psbegin;

%macro utl_psend;
run;quit;
* EXECUTE THE PYTHON PROGRAM;
options noxwait noxsync;
filename rut pipe "powershell.exe -executionpolicy bypass -file c:/temp/ps_pgm.ps1";
run;quit;
data _null_;
  file print;
  infile rut;
  input;
  put _infile_;
  putlog _infile_;
run;quit;
data _null_;
  infile " c:/temp/ps_pgm.log";
  input;
  putlog _infile_;
run;quit;
%mend utl_psend;

%utl_psbegin;
parmcards4;
$fileName = 'd:/txt/bacwrd.txt'
$arr = Get-Content -Path $fileName
[array]::reverse($arr)
foreach($line in $arr) {
    $line
}
;;;;
%utl_psend;

/**************************************************************************************************************************/
/*                                                                                                                        */
/* record number 10                                                                                                       */
/* record number 9                                                                                                        */
/* record number 8                                                                                                        */
/* record number 7                                                                                                        */
/* record number 6                                                                                                        */
/* record number 5                                                                                                        */
/* record number 4                                                                                                        */
/* record number 3                                                                                                        */
/* record number 2                                                                                                        */
/* record number 1                                                                                                        */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*___
|___ \   ___  __ _ ___
  __) | / __|/ _` / __|
 / __/  \__ \ (_| \__ \
|_____| |___/\__,_|___/

*/

data null_;
  infile "d:/txt/bacwrd.txt" lrecl=32756 recfm=f;
  input;
  str=trim(_infile_);
  cntEof=countc(_infile_,'0D0A'x);
  do rec = cntEof to 1 by -1;
   line=scan(str,rec,'0D0A'x);
   putlog line;
  end;
stop;
run;quit;

/*____
|___ /   _ __
  |_ \  | `__|
 ___) | | |
|____/  |_|

*/

%utl_rbegin;
parmcards4;
lines <- readLines('d:/txt/bacwrd.txt')
reversed_lines <- rev(lines)
str(reversed_lines)
nrow(lines);
for ( r in seq(1,length(lines),1)) {
  print(reversed_lines[r])
  }
;;;;
%utl_rend;

/*  _                     _
| || |    _ __   ___ _ __| |
| || |_  | `_ \ / _ \ `__| |
|__   _| | |_) |  __/ |  | |
   |_|   | .__/ \___|_|  |_|
         |_|
*/


/*----                                                                   ----*/
/*----  should not need to delete these files                            ----*/
/*----                                                                   ----*/

filename ft15f001 clear;
%utlfkil(c:/temp/pl_pgm.pl);
%utlfkil(c:/temp/pl_pgm.log);

%utl_plbegin;
parmcards4;
use File::ReadBackwards ;
$bw = File::ReadBackwards->new('d:/txt/bacwrd.txt') or
    die 'cant read file';
while( defined( $log_line = $bw->readline ) ) {
    print $log_line ;
}
;;;;
%utl_plend;

%macro utl_plbegin;
filename ft15f001 "c:/temp/pl_pgm.pl";
%mend utl_plbegin;

%macro utl_plend;
run;quit;
options noxwait noxsync;
filename rut pipe "d:\strawberry\perl\bin\perl c:/temp/pl_pgm.pl > c:/temp/pl_pgm.log";
run;quit;
data _null_;
  file print;
  infile rut;
  input;
  put _infile_;
  putlog _infile_;
run;quit;
data _null_;
  infile " c:/temp/pl_pgm.log";
  input;
  putlog _infile_;
run;quit;
%utlfkil(c:/temp/pl_pgm.pl);
%utlfkil(c:/temp/pl_pgm.log);
%mend utl_plend;

/*___                _   _
| ___|   _ __  _   _| |_| |__   ___  _ __
|___ \  | `_ \| | | | __| `_ \ / _ \| `_ \
 ___) | | |_) | |_| | |_| | | | (_) | | | |
|____/  | .__/ \__, |\__|_| |_|\___/|_| |_|
        |_|    |___/
*/

%utl_pybegin;
parmcards4;
from file_read_backwards import FileReadBackwards
with FileReadBackwards('d:/txt/bacwrd.txt') as frb:
    for l in frb:
        print(l)
;;;;
%utl_pyend;

/*                                                      _          _ _
 ___  __ ___   _____   _ __   _____      _____ _ __ ___| |__   ___| | |  _ __ ___   __ _  ___ _ __ ___
/ __|/ _` \ \ / / _ \ | `_ \ / _ \ \ /\ / / _ \ `__/ __| `_ \ / _ \ | | | `_ ` _ \ / _` |/ __| `__/ _ \
\__ \ (_| |\ V /  __/ | |_) | (_) \ V  V /  __/ |  \__ \ | | |  __/ | | | | | | | | (_| | (__| | | (_) |
|___/\__,_| \_/ \___| | .__/ \___/ \_/\_/ \___|_|  |___/_| |_|\___|_|_| |_| |_| |_|\__,_|\___|_|  \___/
                      |_|

*/

filename ft15f001 "c:/oto/utl_psbegin.sas";
parmcards4;
%macro utl_psbegin;
%utlfkil(c:/temp/ps_pgm.ps);
%utlfkil(c:/temp/ps_pgm.log);
filename ft15f001 "c:/temp/ps_pgm.ps1";
%mend utl_psbegin;
;;;;
run;quit;

filename ft15f001 "c:/oto/utl_psend.sas";
parmcards4;
%macro utl_psend;
run;quit;
* EXECUTE THE PYTHON PROGRAM;
options noxwait noxsync;
filename rut pipe "powershell.exe -executionpolicy bypass -file c:/temp/ps_pgm.ps1";
run;quit;
data _null_;
  file print;
  infile rut;
  input;
  put _infile_;
  putlog _infile_;
run;quit;
data _null_;
  infile " c:/temp/ps_pgm.log";
  input;
  putlog _infile_;
run;quit;
%mend utl_psend;
;;;;
run;quit;

/*                                     _
 ___  __ ___   _____   _ __   ___ _ __| |  _ __ ___   __ _  ___ _ __ ___
/ __|/ _` \ \ / / _ \ | `_ \ / _ \ `__| | | `_ ` _ \ / _` |/ __| `__/ _ \
\__ \ (_| |\ V /  __/ | |_) |  __/ |  | | | | | | | | (_| | (__| | | (_) |
|___/\__,_| \_/ \___| | .__/ \___|_|  |_| |_| |_| |_|\__,_|\___|_|  \___/
                      |_|
*/

filename ft15f001 "c:/oto/utl_plbegin.sas";
parmcards4;
%macro utl_psbegin;
%utlfkil(c:/temp/ps_pgm.ps);
%utlfkil(c:/temp/ps_pgm.log);
filename ft15f001 "c:/temp/ps_pgm.ps1";
%mend utl_plbegin;
;;;;
run;quit;

filename ft15f001 "c:/oto/utl_plend.sas";
parmcards4;
%macro utl_psend;
run;quit;
* EXECUTE THE PYTHON PROGRAM;
options noxwait noxsync;
filename rut pipe "powershell.exe -executionpolicy bypass -file c:/temp/ps_pgm.ps1";
run;quit;
data _null_;
  file print;
  infile rut;
  input;
  put _infile_;
  putlog _infile_;
run;quit;
data _null_;
  infile " c:/temp/ps_pgm.log";
  input;
  putlog _infile_;
run;quit;
%mend utl_plend;
;;;;
run;quit;

/*                                 _   _
 ___  __ ___   _____   _ __  _   _| |_| |__   ___  _ __    _ __ ___   __ _  ___ _ __ ___
/ __|/ _` \ \ / / _ \ | `_ \| | | | __| `_ \ / _ \| `_ \  | `_ ` _ \ / _` |/ __| `__/ _ \
\__ \ (_| |\ V /  __/ | |_) | |_| | |_| | | | (_) | | | | | | | | | | (_| | (__| | | (_) |
|___/\__,_| \_/ \___| | .__/ \__, |\__|_| |_|\___/|_| |_| |_| |_| |_|\__,_|\___|_|  \___/
                      |_|    |___/

*/

filename ft15f001 "c:/oto/utl_pybegin.sas";
parmcards4;
%macro utl_pybegin;
%utlfkil(c:/temp/py_pgm.py);
%utlfkil(c:/temp/py_pgm.log);
filename ft15f001 "c:/temp/py_pgm.py";
%mend utl_pybegin;
;;;;
run;quit;

filename ft15f001 "c:/oto/utl_pybegin.sas";
parmcards4;
%macro utl_pyend;
run;quit;
* EXECUTE THE PYTHON PROGRAM;
options noxwait noxsync;
filename rut pipe  "d:\Python310\python.exe c:/temp/py_pgm.py 2> c:/temp/py_pgm.log";
run;quit;
data _null_;
  file print;
  infile rut;
  input;
  put _infile_;
  putlog _infile_;
run;quit;
data _null_;
  infile " c:/temp/py_pgm.log";
  input;
  putlog _infile_;
run;quit;
%mend utl_pyend;
;;;;
run;quit;

/*
 ___  __ ___   _____   _ __   _ __ ___   __ _  ___ _ __ ___
/ __|/ _` \ \ / / _ \ | `__| | `_ ` _ \ / _` |/ __| `__/ _ \
\__ \ (_| |\ V /  __/ | |    | | | | | | (_| | (__| | | (_) |
|___/\__,_| \_/ \___| |_|    |_| |_| |_|\__,_|\___|_|  \___/

*/

filename ft15f001 "c:/oto/utl_rbegin.sas";
parmcards4;
%macro utl_rbegin;
%utlfkil(c:/temp/r_pgm.r);
%utlfkil(c:/temp/r_pgm.log);
filename ft15f001 "c:/temp/r_pgm.r";
%mend utl_rbegin;
;;;;
run;quit;

filename ft15f001 "c:/oto/utl_rend.sas";
parmcards4;
%macro utl_rend(returnvar=N);
* EXECUTE THE R PROGRAM;
options noxwait noxsync;
filename rut pipe "D:\r412\R\R-4.1.2\bin\R.exe --vanilla --quiet --no-save < c:/temp/r_pgm.r 2> c:/temp/r_pgm.log";
run;quit;
  data _null_;
    file print;
    infile rut recfm=v lrecl=32756;
    input;
    put _infile_;
    putlog _infile_;
  run;
  filename ft15f001 clear;
  * use the clipboard to create macro variable;
  %if %upcase(%substr(&returnVar.,1,1)) ne N %then %do;
    filename clp clipbrd ;
    data _null_;
     length txt $200;
     infile clp;
     input;
     putlog "macro variable &returnVar = " _infile_;
     call symputx("&returnVar.",_infile_,"G");
    run;quit;
  %end;
data _null_;
  file print;
  infile rut;
  input;
  put _infile_;
  putlog _infile_;
run;quit;
data _null_;
  infile "c:/temp/r_pgm.log";
  input;
  putlog _infile_;
run;quit;
%mend utl_rend;
;;;;
run;quit;

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
