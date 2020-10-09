import net, nativesockets

{.hints: off, warnings: off, optimization: speed.}

var
  servers: seq[string]
  socket: Socket = newSocket(AF_INET, SOCK_STREAM, IPPROTO_TCP)

proc testConn*(service: string, timeOut: int): seq[bool] =
  if service == ("google"):
    servers = @["8.8.4.4", "8.8.8.8"]
  elif service == ("cloudflare"):
    servers = @["1.1.1.1", "1.0.0.1"]
  else:
    return @[false, false]
  for server in servers:
    try:
      socket.connect(server, Port(53), timeOut)
      result.add(true)
    except:
      result.add(false)
    finally:
      socket.close()
      socket = newSocket()
  return result
