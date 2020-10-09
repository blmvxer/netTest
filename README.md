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
netConn("google", 2000)<br><br>
Output: @[true, true] or @[false, false]<br><br>
