import net, nativesockets, os

{.hints: off, warnings: off, optimization: speed.}

const
  cloudflare* = @["1.1.1.1", "1.0.0.1"]
  google* = @["8.8.4.4", "8.8.8.8"]

type
  Result = object
    host: string
    connects, disconnects: int

var
  result: Result
  servers: seq[string]
  socket: Socket = newSocket(AF_INET, SOCK_STREAM, IPPROTO_TCP)

export cloudflare, google

proc testConn*(servers: seq[string], port: int, timeout: int): seq[bool] =
  for server in servers:
    if isIpAddress(server) == false:
      result.add(false)
    else:
      try:
        socket.connect(server, Port(port), timeout)
        result.add(true)
      except:
        result.add(false)
      finally:
        socket.close()
        socket = newSocket()
  return result

proc testConn*(server: string, port: int, timeout: int): bool =
  if isIpAddress(server) == false:
    return false
  else:
    try:
      socket.connect(server, Port(port), timeout)
      return true
    except:
      return false
    finally:
      socket.close()
      socket = newSocket()

proc timerConn*(server: string, port: int, timeout: int, timer: int): tuple[host: string, connects: int, disconnects: int] =
  var
    x: int
  x = 0
  result.host = server
  while x != timer:
    if testConn(server, port, timeout) != true:
      result.disconnects.inc(1)
      sleep(1000)
      x.inc(1)
    else:
      result.connects.inc(1)
      sleep(1000)
      x.inc(1)
  return result
