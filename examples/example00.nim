import os, netTest

var
  conn: int
  dConn: int
  timer: int

conn = 0
dConn = 0
timer = 0

while timer != 10:
  if testConn(cloudflare, 53, 250) != @[true, true]:
    dConn.inc(1)
    sleep(1000)
    timer.inc(1)
  else:
    conn.inc(1)
    sleep(1000)
    timer.inc(1)
echo("Connections: " & $conn)
echo("Disconnects: " & $dConn)
