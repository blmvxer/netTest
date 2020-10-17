import os, netTest

var
  conn: int
  dConn: int
  timer: int

conn = 0
dConn = 0
timer = 0

while timer != 300:
  if testConn("1.1.1.1", 53, 250) != true:
    dConn.inc(1)
    sleep(1000)
    timer.inc(1)
  else:
    conn.inc(1)
    sleep(1000)
    timer.inc(1)
echo("Connections: " & $conn)
echo("Disconnects: " & $dConn)
