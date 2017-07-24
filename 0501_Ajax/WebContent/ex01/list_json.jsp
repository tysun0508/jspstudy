<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
[
<c:forEach begin="0" end="${list.size()-2}" step="1" items="${list }" var="k">
{"idx":"${k.idx}", "id":"${k.id }", "pwd": "${k.pwd }","name":"${k.name }", "age":"${k.age }", "addr":"${k.addr }"},
</c:forEach>
<c:forEach begin="${list.size()-1}" end="${list.size()-1}" step="1" items="${list }" var="k">
{"idx":"${k.idx}", "id":"${k.id }", "pwd": "${k.pwd }","name":"${k.name }", "age":"${k.age }", "addr":"${k.addr }"}
</c:forEach>


]
