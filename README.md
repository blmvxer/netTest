# netTest
Basic Internet Test for Nim Web Projects<br><br>
<b>How to use</b><br>
copy netTest.nim to the projects src folder<br>
import netTest into which ever file will test the connection<br><br>
after importing you can use testConn("service", timeout)<br>
service being either google or cloudflare and timeout in miliseconds<br><br>
<b>Basic usage</b><br>
import netTest<br>
echo("Testing google")<br>
testConn(google, port, 2000)<br><br>
Output: @[true, true] or @[false, false]<br><br>
<b>testConn proc's</b><br>
testConn([cloudflare, google], port, timeout)<br>
output: @[bool, bool]<br><br>
testConn("server", port, timeout)<br>
output: bool<br><br>
testConn(@["server0", "server1", "server2"], port, timeout)<br>
output: @[bool, bool, bool]<br><br>
